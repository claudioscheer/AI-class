from spyre import server
import numpy as np
import pandas as pd
from sklearn.externals import joblib


class SimpleApp(server.App):
    title = "Stock Price"
    inputs = [
        {
            "type": "text",
            "key": "date",
            "label": "Date (yyyy-mm-dd)",
            "value": "2018-09-09"
        },
        {
            "type": "text",
            "key": "open",
            "label": "Open",
            "value": 1
        },
        {
            "type": "text",
            "key": "high",
            "label": "High",
            "value": 1
        },
        {
            "type": "text",
            "key": "low",
            "label": "Low",
            "value": 1
        }
    ]

    controls = [{
        "type": "button",
        "id": "button_predict",
        "label": "Predict"
    }]

    outputs = [{
        "type": "html",
        "id": "simple_html_output"
    }]

    def getHTML(self, params):
        if params["date"]:
            date_value = pd.to_datetime(params["date"], format="%Y-%m-%d")
            x = np.array(
                [
                    date_value.year + date_value.month + date_value.day,
                    params["open"],
                    params["high"],
                    params["low"]
                ]
            )
            y_pred = regressor.predict([x.astype(np.float)])
            return "The predicted value is: <b>%s</b>" % y_pred[0]
        else:
            return "Values can be empty."


regressor = joblib.load("./StockModelLinearRegression.pkl")

app = SimpleApp()
app.launch(port=3000)
