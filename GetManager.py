from csv import reader
import csv


with open("EnabledList.txt") as textFile:
    lines = textFile.readlines()

    for line in lines:
        SplitLine = line.split(",")
        LastName = SplitLine[0]

        SplitLine = list(SplitLine[1].split())
        print(SplitLine)
        FirstName = SplitLine[0]

        if(len(SplitLine) > 1):
            MiddleInit = SplitLine[1]
        else:
            MiddleInit = ""
        print("Name:")
        print("First: " + FirstName)
        print("Middle: " + MiddleInit)
        print("Last: " + LastName)
        print("####")

        with open("DataBaseForm2CSV.csv") as csvFile:
            csv_reader = reader(csvFile)

            for row in csv_reader:
                print(row[0])