//PROBLEM - 1

import java.util.*;

public class Solution {
    private static final Scanner scanner = new Scanner(System.in);

    static RollingHash text, target;

    // Method to check if substring matches target string
    private static boolean isSubstringMatch(int start, int left, int right) {
        if (right - left < 2) {
            return true;
        }

        int mid = (left + right) / 2;
        long leftHashText = text.getHash(start + left, start + mid);
        long leftHashTarget = target.getHash(left, mid);
        long rightHashText = text.getHash(start + mid, start + right);
        long rightHashTarget = target.getHash(mid, right);

        if (leftHashText == leftHashTarget) {
            return rightHashText == rightHashTarget ? true : isSubstringMatch(start, mid, right);
        } else if (rightHashText == rightHashTarget) {
            return isSubstringMatch(start, left, mid);
        }

        return false;
    }

    public static void main(String[] args) {
        int T = scanner.nextInt();
        while (T-- != 0) {
            final String s = scanner.next();
            final String t = scanner.next();
            text = new RollingHash(s);
            target = new RollingHash(t);
            boolean isFirst = true;
            boolean isMatchFound = false;
            for (int i = 0; i + t.length() <= s.length(); i++) {
                if (isSubstringMatch(i, 0, t.length())) {
                    System.out.print((isFirst ? "" : " ") + i);
                    isFirst = false;
                    isMatchFound = true;
                }
            }
            if (!isMatchFound) {
                System.out.println("No match!");
            } else {
                System.out.println();
            }
        }
    }

    // RollingHash class to compute rolling hash values
    static class RollingHash {
        private static final long RADIX = 1000000009L;
        private int length;
        long[] hashTable, powers;

        public RollingHash(String str) {
            length = str.length();

            hashTable = new long[length + 1];
            powers = new long[length + 1];

            powers[0] = 1;
            hashTable[0] = 0;
            for (int i = 0; i < length; i++) {
                hashTable[i + 1] = hashTable[i] * RADIX + str.charAt(i % length);
                powers[i + 1] = powers[i] * RADIX;
            }
        }

        // Method to compute hash of a substring
        public long getHash(int start, int end) {
            assert(start <= end);
            return hashTable[end] - hashTable[start] * powers[end - start];
        }
    }
}
