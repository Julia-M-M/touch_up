words = ['OXA-51']

with open('input.txt') as input, open('output.txt', 'w') as output:
    for line in input:
        if any(word in line for word in words):
        #if not any(word in line for word in words):
            output.write(line)
