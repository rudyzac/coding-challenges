/*
 * Given three ints, a, b, and c, one of them is small, one is medium, and one is large.
 * Return true if the three values are evenly spaced, meaning the difference between small and medium 
 * is the same as the difference between medium and large.
 * (https://codingbat.com/prob/p198700)
 * 
 * Example:
 * evenlySpaced(2, 4, 6) → true
 * evenlySpaced(4, 6, 2) → true
 * evenlySpaced(4, 6, 3) → false
 * 
 * Mathematical solution:
 * 
 * Let a, b, and c, where a > b > c.
 * 
 * b = a + k  <=>  k = b - a
 * c = b + k  <=>  k = c - b
 * 
 * Therefore, b - a = c - b.
 */

public boolean evenlySpaced(int a, int b, int c) {
  int[] integers = {a, b, c};

  Arrays.sort(integers);

  int small = integers[0];
  int medium = integers[1];
  int large = integers[2];

  return medium - small == large - medium;
}
