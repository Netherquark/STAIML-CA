import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

from sklearn import datasets, linear_model
from sklearn.metrics import mean_squared_error, r2_score

advertisements_vs_sales = pd.read_csv('advertisements_vs_sales.csv')

tv_advertisements = advertisements_vs_sales['TV Advertisement (X₁)'].values
sales = advertisements_vs_sales['Sales(Y)'].values

tv_advertisements_train = tv_advertisements[:-10].reshape(-1, 1)
tv_advertisements_test = tv_advertisements[-10:].reshape(-1, 1)

sales_train = sales[:-10]
sales_test = sales[-10:]

linregmodel = linear_model.LinearRegression()

linregmodel.fit(tv_advertisements_train, sales_train)
sales_predict = linregmodel.predict(tv_advertisements_test)

print("Coefficient: \n", linregmodel.coef_)
print("Mean squared error: %.2f" % mean_squared_error(sales_test, sales_predict))
print("Coefficient of determination: %.2f" % r2_score(sales_test, sales_predict))

plt.scatter(tv_advertisements_test, sales_test, color="black")
plt.plot(tv_advertisements_test, sales_predict, color="blue", linewidth=3)

plt.xticks(())
plt.yticks(())

plt.show()