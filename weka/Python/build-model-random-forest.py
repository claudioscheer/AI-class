# https://stackabuse.com/random-forest-algorithm-with-python-and-scikit-learn/
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestRegressor
from sklearn import metrics
from sklearn.externals import joblib

dataset = pd.read_csv("./csv-data.csv")
datetime = pd.to_datetime(dataset["Date"], format="%Y-%m-%d")
dataset["Date"] = datetime.dt.year + datetime.dt.month + datetime.dt.day
X = dataset.iloc[:, 0:5].values
y = dataset.iloc[:, 5].values
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=1)

sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

regressor = RandomForestRegressor(n_estimators=500, random_state=1)
regressor.fit(X_train, y_train)
y_pred = regressor.predict(X_test)

print("Mean Absolute Error:", metrics.mean_absolute_error(y_test, y_pred))
print("Mean Squared Error:", metrics.mean_squared_error(y_test, y_pred))
print("Root Mean Squared Error:", np.sqrt(
    metrics.mean_squared_error(y_test, y_pred)))

# joblib.dump(regressor, "StockModelRandomForest.pkl")
