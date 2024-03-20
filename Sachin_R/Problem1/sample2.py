def count_mismatches(s1, s2):
    # Function to count the number of mismatches between two strings
    return sum(1 for x, y in zip(s1, s2) if x != y)

def virusIndices(num_tests, test_cases):
    # Function to find matching substrings in patient DNA for each test case
    for i in range(num_tests):
        patient_dna, virus_dna = test_cases[i]
        virus_length = len(virus_dna)
        matches = []
        for j in range(len(patient_dna) - virus_length + 1):
            substring = patient_dna[j:j + virus_length]
            if count_mismatches(substring, virus_dna) <= 1:
                matches.append(j)
        if matches:
            print(" ".join(map(str, matches)))
        else:
            print("No Match!")

# Sample Input
num_tests = 3
test_cases = [
    ("cgatcg", "gc"),
    ("atcgatcga", "cgg"),
    ("aardvark", "ab")
]

# Sample Output
virusIndices(num_tests, test_cases)

