import os
import csv


folder = "./Stocks"
outputFile = open("output.arff", "w")
# @attribute Company string
outputFile.write("""@relation stock

@attribute Date date "yyyy-MM-dd"
@attribute Open numeric
@attribute High numeric
@attribute Low numeric
@attribute Close numeric

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
                row[1],
                row[2],
                row[3],
                row[4],
            ]) + "\n")
    except:
        print("*****************")

print("Done!")
