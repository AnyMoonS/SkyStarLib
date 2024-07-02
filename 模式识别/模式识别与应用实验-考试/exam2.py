from sklearn.cluster import KMeans
import matplotlib.pyplot as plt

# 从文件中读取数据
with open('data.txt', 'r') as f:
    lines = f.readlines()

data = []
for line in lines:
    x, y = line.strip().split(',')
    data.append([float(x), float(y)])

# 运行kmeans算法
kmeans = KMeans(n_clusters=2, random_state=0).fit(data)
labels = kmeans.labels_
centers = kmeans.cluster_centers_

# 绘制散点图
colors = ['r', 'b']
for i in range(len(data)):
    plt.scatter(data[i][0], data[i][1], c=colors[labels[i]])

# 绘制聚类中心
for i in range(len(centers)):
    plt.scatter(centers[i][0], centers[i][1], marker='+', s=100, c='k')

# 显示图像
plt.show()
