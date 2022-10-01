import sys
input = sys.stdin.readlines

is_open = False
case_num = 0

files = sys.stdin.readlines()
for line in files:
    if line.strip() == "**input**":
        case_num += 1
        if is_open:
            f.close()
            f = open("./input/case"+str(case_num)+"_input", 'w')
        else:
            f = open("./input/case"+str(case_num)+"_input", 'w')
            is_open = True
    elif line.strip() == "**output**":
        f.close()
        f = open("./output/case"+str(case_num)+"_output", 'w')
    elif line.strip() == "**end**":
        f.close()
    else:
        f.write(line)

