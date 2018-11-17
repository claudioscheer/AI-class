import os
import csv


folder = "./Stocks"
outputFile = csv.writer(open("Python/csv-data.csv", "w"))
outputFile.writerow(
    ["Company", "Date", "High", "Low", "Close", "Volume", "Open"])

for f in os.listdir(folder):
    print(f)
    file = csv.reader(open(os.path.join(folder, f)))
    try:
        headers = next(file)
        for row in file:
            outputFile.writerow([
                f[:-4],
                row[0],
                row[2],
                row[3],
                row[4],
                row[5],
                row[1],
            ])
    except:
        print("*****************")

print("Done!")
