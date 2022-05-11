##DELETE LINES IN TEXT THAT CONTAIN OR DO NOT CONTAIN CERTAIN CHARACTERS ##

# Specify the words
words = ['write', 'characters', 'here']

with open('input.txt') as input, open('output.txt', 'w') as output:
    for line in input:
        # Delete line if it does not contain any of the words
        if any(word in line for word in words):
        # Delete line if it contains any of the words
        #if not any(word in line for word in words):
            output.write(line)
