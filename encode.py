import sys

def main():

    if len(sys.argv) != 2 and len(sys.argv) != 3:
        print("Usage: encode <input file> [output file]")
        exit()
    
    fInput = open(sys.argv[1], "r")
    fOutput = open(sys.argv[2] , "w") if len(sys.argv) == 3 else open("salida.lp" , "w")

    n = int(fInput.readline())
    fOutput.write("#program initial.\n\n#const n=" + str(n) + ".\n")

    for i in range(n):
        linea = fInput.readline()
        for j in range(n):
            state = "on" if linea[j]=="1" else "off"
            coor = str(i) + "," + str(j)
            fOutput.write("h(ce(" + coor + "), " + state + ").\n")

    fInput.close()
    fOutput.close()

main()
