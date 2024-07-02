import numpy as np
import operator
import matplotlib.pyplot as plt

'''
    trainData - 训练集  N
    testData - 测试   1
    labels - 训练集标签
'''


def knn(trainData, testData, labels, k):
    # 计算训练样本的行数
    rowSize = trainData.shape[0]
    # 计算训练样本和测试样本的差值
    diff = np.tile(testData, (rowSize, 1)) - trainData
    # 计算差值的平方和
    sqrDiff = diff ** 2
    sqrDiffSum = sqrDiff.sum(axis=1)
    # 计算距离
    distances = sqrDiffSum ** 0.5
    # 对所得的距离从低到高进行排序
    sortDistance = distances.argsort()

    count = {}

    for i in range(k):
        vote = labels[sortDistance[i]]
        # print(vote)
        count[vote] = count.get(vote, 0) + 1
    # 对类别出现的频数从高到低进行排序
    sortCount = sorted(count.items(), key=operator.itemgetter(1), reverse=True)

    # 返回出现频数最高的类别
    return sortCount[0][0]


def evaluate_KNN(train_datas, train_labs, test_datas, test_labs, K=5):
    N_test = test_datas.shape[0]

    N_right = 0
    for i in range(N_test):
        det_lab = knn(train_datas, test_datas[i], train_labs, K)

        if det_lab == test_labs[i]:
            N_right += 1  # N_right +1

    # 计算准确率
    acc = N_right * 100 / N_test
    return acc


def evaluate_KNN_fold(datas, labs, k_fold, K=10):
    N = np.shape(datas)[0]
    n_each_fold = int(N / k_fold)
    N_used = n_each_fold * k_fold

    index = np.random.permutation(N)[:N_used]

    index_fold = np.reshape(index, (k_fold, n_each_fold))
    acc_all = []
    for i in range(k_fold):
        index_test = index_fold[i, :]
        sel_train = [i for i in range(k_fold)]
        sel_train.remove(i)
        index_train = index_fold[sel_train, :].flatten()

        train_datas = datas[index_train]
        train_labs = labs[index_train]

        test_datas = datas[index_test]
        test_labs = labs[index_test]

        acc = evaluate_KNN(train_datas, train_labs, test_datas, test_labs, K)
        print("acc in fold %d = %.2f %%" % (i, acc))
        acc_all.append(acc)

    return np.average(acc_all)


def indexSplit(N, train_ratio):
    N_train = int(N * train_ratio)
    index_random = np.random.permutation(N)
    index_train = index_random[:N_train]
    index_test = index_random[N_train:]

    return index_train, index_test


def autoNorm(datas):
    val_min = np.min(datas, axis=0, keepdims=True)
    val_max = np.max(datas, axis=0, keepdims=True)
    val_range = val_max - val_min

    norm_datas = (datas - val_min) / val_range
    return norm_datas, val_range, val_min


def evaluate_KNN_fold_norm(datas, labs, k_fold, K=10):
    pass


if __name__ == "__main__":
    # iris 数据处理
    file_data_train = 'train.txt'
    file_data_test = 'test.txt'

    # 数据读取
    datas_train = np.loadtxt(file_data_train, dtype=float, delimiter=',', usecols=(0, 1, 2, 3))
    labs_train = np.loadtxt(file_data_train, dtype=str, delimiter=',', usecols=(4))
    N_train, D_train = np.shape(datas_train)

    datas_test = np.loadtxt(file_data_test, dtype=float, delimiter=',', usecols=(0, 1, 2, 3))
    labs_test = np.loadtxt(file_data_test, dtype=str, delimiter=',', usecols=(4))
    N_test, D_test = np.shape(datas_test)

    train_datas = datas_train
    train_labs = labs_train

    test_datas = datas_test
    test_labs = labs_test

    # 一般测试
    K = 5
    acc = evaluate_KNN(train_datas, train_labs, test_datas, test_labs, K)

    print("k = %d , acc= %.2f%%" % (K, acc))

    # 参数设定
    n_right_5 = 0
    for i in range(N_test):
        test = datas_test[i, :]

        det = knn(datas_train, test, labs_train, K)

        if det == labs_test[i]:
            n_right_5 = n_right_5 + 1

        if det != labs_test[i]:
            print('Sample %d  lab_ture = %s  lab_det = %s' % (i, labs_test[i], det))

    # 结果分析
    print('Accuracy = %.2f %%' % (n_right_5*100/N_test))

    K = 7
    acc = evaluate_KNN(train_datas, train_labs, test_datas, test_labs, K)

    print(" k = %d , acc = %.2f%%" % (K, acc))

    n_right_7 = 0
    for i in range(N_test):
        test = datas_test[i, :]

        det = knn(datas_train, test, labs_train, K)

        if det == labs_test[i]:
            n_right_7 = n_right_7 + 1

        if det != labs_test[i]:
            print('Sample %d  lab_ture = %s  lab_det = %s' % (i, labs_test[i], det))

    # 结果分析
    print('Accuracy = %.2f %%' % (n_right_7 * 100 / N_test))
