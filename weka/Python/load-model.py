from sklearn.externals import joblib

regressor = joblib.load("./StockModelLinearRegression.pkl")
y_pred = regressor.predict([
    [2001, 0.6183, 0.6011, 0.6093, 1017479],  # 0.6183
    [2011, 5.0143, 4.9801, 4.993, 1889690],  # 5.0018
])

print(y_pred)
