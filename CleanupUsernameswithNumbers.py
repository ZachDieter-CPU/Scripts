with open("cleanMe.txt", 'r') as f:
    with open("cleanedUp.txt", "w") as fc:
        count = 1
        DeplicatedList = []
        listWithNumber = []
        listWithoutNumber = []
        for line in f.readlines():
            if not line.strip():
                continue            

            period = line.index(".")
            name = line[period + 2:]

            if name in DeplicatedList:
                continue
            DeplicatedList.append(name)

            listWithoutNumber.append(line[period + 2:])
            line = str(count) + ". " + line[period + 2:]
            count += 1
            fc.write(line)


        fc.write("\n\n")

        for line in listWithoutNumber:
            fc.write(line)
