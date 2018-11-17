import pandas as pd
from sklearn.externals import joblib

regressor = joblib.load("./StockModelLinearRegression.pkl")
date_value = pd.to_datetime(input("Date (yyyy-mm-dd): "), format="%Y-%m-%d")
open_value = input("Open: ")
high_value = input("High: ")
low_value = input("Low: ")
y_pred = regressor.predict([
    [
        date_value.year + date_value.month + date_value.day,
        open_value,
        high_value,
        low_value
    ],
])

print(y_pred)
