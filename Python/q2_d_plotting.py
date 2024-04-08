import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

advertisements_vs_sales = pd.read_csv('advertisements_vs_sales.csv')

tv_advertisements = advertisements_vs_sales['TV Advertisement (X₁)']
radio_advertisements = advertisements_vs_sales['Radio Advertisement (X₂)']
newspaper_advertisements = advertisements_vs_sales['Newspaper Advertisement (X₃)']
sales = advertisements_vs_sales['Sales(Y)']

# Histograms
fig, axs = plt.subplots(1, 2, figsize=(10, 5), tight_layout=True)
axs[0].hist(tv_advertisements, bins=10, color='skyblue', edgecolor='black')
axs[0].set_title('TV Advertisement')
axs[0].set_xlabel('Amount')
axs[0].set_ylabel('Frequency')

axs[1].hist(sales, bins=15, color='lightgreen', edgecolor='black')
axs[1].set_title('Sales')
axs[1].set_xlabel('Amount')
axs[1].set_ylabel('Frequency')

plt.show()

# Scatter plot
plt.scatter(tv_advertisements, sales, color='coral')
plt.title('TV Advertisement vs Sales')
plt.xlabel('TV Advertisement')
plt.ylabel('Sales')
plt.grid(True)
plt.show()

# Box plot
plt.figure(figsize=(10, 6))

plt.boxplot([tv_advertisements, radio_advertisements, newspaper_advertisements, sales], 
            labels=['TV Advertisement', 'Radio Advertisement', 'Newspaper Advertisement', 'Sales'])

plt.title('Distribution of Advertisements and Sales')
plt.xlabel('Advertisement Type')
plt.ylabel('Amount')
plt.grid(True)
plt.show()

# Bar plot
x = np.arange(len(tv_advertisements))

width = 0.2

plt.figure(figsize=(10, 5))

plt.bar(x - width, tv_advertisements, width=width, label='TV Advertisement')
plt.bar(x, radio_advertisements, width=width, label='Radio Advertisement')
plt.bar(x + width, newspaper_advertisements, width=width, label='Newspaper Advertisement')

plt.xlabel('Index')
plt.ylabel('Amount')
plt.title('Advertisements vs Sales')
plt.xticks(x, labels=np.arange(len(tv_advertisements)))
plt.legend()
plt.show()
