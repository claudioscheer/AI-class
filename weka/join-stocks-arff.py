import os
import csv


folder = "./Stocks"
outputFile = open("output.arff", "w")
# @attribute Company string
outputFile.write("""@relation stock

@attribute Date date "yyyy-MM-dd"
@attribute High numeric
@attribute Low numeric
@attribute Close numeric
@attribute Volume numeric
@attribute Open numeric

@data
""")

for f in os.listdir(folder):
    print(f)
    file = csv.reader(open(os.path.join(folder, f)))
    try:
        headers = next(file)
        for row in file:
            outputFile.write(",".join([
                # f[:-4],
                row[0],
                row[2],
                row[3],
                row[4],
                row[5],
                row[1],
            ]) + "\n")
    except:
        print("*****************")

print("Done!")
