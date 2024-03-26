function countMismatches(substring, virus) {
    let count = 0;
    for (let i = 0; i < substring.length; i++) {
        if (substring[i] !== virus[i]) {
            count++;
            if (count > 1) {
                return false;
            }
        }
    }
    return true;
}

function virusIndices(testCases) {
    for (let i = 0; i < testCases.length; i++) {
        const [p, v] = testCases[i];
        const indices = [];
        for (let j = 0; j <= p.length - v.length; j++) {
            const substring = p.substring(j, j + v.length);
            if (countMismatches(substring, v)) {
                indices.push(j);
            }
        }
        if (indices.length > 0) {
            console.log(indices.join(" "));
        } else {
            console.log("No Match!");
        }
    }
}

// Input
const testCases = [
    ["abbab", "ba"],
    ["hello", "world"],
    ["banana", "nan"]
];

// Output
virusIndices(testCases);


// Function to count mismatches between substrings
function countMismatches1(substring, virus) {
    let count = 0;
    for (let i = 0; i < substring.length; i++) {
        if (substring[i] !== virus[i]) {
            count++;
            if (count > 1) {
                return false;
            }
        }
    }
    return true;
}

// Function to find indices of matching substrings
function virusIndices1(testCases1) {
    for (let testCase1 of testCases1) {
        const p = testCase1[0]; // Patient DNA
        const v = testCase1[1]; // Virus DNA
        const indices1 = [];
        for (let i = 0; i <= p.length - v.length; i++) {
            const substring = p.substring(i, i + v.length); // Extract substring of patient DNA
            if (countMismatches1(substring, v)) { // Check if the substring matches with virus DNA
                indices1.push(i); // If match found, add index to the list
            }
        }
        if (indices1.length > 0) {
            // If matching substrings found, print their indices
            console.log(indices1.join(" "));
        } else {
            // If no matching substrings found, print "No Match!"
            console.log("No Match!");
        }
    }
}

// Input
const testCases1 = [
    ["cgatcg", "gc"],
    ["atcgatcga", "cgg"],
    ["aardvark", "ab"]
];

// Output
virusIndices1(testCases1);
