import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn import metrics
from sklearn.externals import joblib

dataset = pd.read_csv("./csv-data.csv")
datetime = pd.to_datetime(dataset["Date"], format="%Y-%m-%d")
dataset["Date"] = datetime.dt.year + datetime.dt.month + datetime.dt.day
X = dataset.iloc[:, 0:5].values
y = dataset.iloc[:, 5].values
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

regressor = LinearRegression()
regressor.fit(X_train, y_train)
y_pred = regressor.predict(X_test)

print("Coefficients:", regressor.coef_)
print("Mean Absolute Error:", metrics.mean_absolute_error(y_test, y_pred))
print("Mean Squared Error:", metrics.mean_squared_error(y_test, y_pred))
print("Root Mean Squared Error:", np.sqrt(
    metrics.mean_squared_error(y_test, y_pred)))

joblib.dump(regressor, "StockModelLinearRegression.pkl")
