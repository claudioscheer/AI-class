from sklearn.externals import joblib

regressor = joblib.load("./StockModelLinearRegression.pkl")
y_pred = regressor.predict([
    [2020, 27.555, 27.832, 27.24, 168845],  # 27.652
])

print(y_pred)
