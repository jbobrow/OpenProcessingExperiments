
import java.util.Random;
import java.util.Arrays;

int n = 6;
int[] nums = new int[n];
int[] shuffled = new int[n];
int count = 0;

void setup() {
  size(500, 500);
  for (int i = 0; i < nums.length; i++) {
    nums[i] = i+1;
    shuffled[i] = i+1;
  }
  shuffleArray(shuffled);
}

void draw() {
  frameRate((float) (factorial(n-1)));
  background(255);
  fill(200);
  stroke(100);
  if(!Arrays.equals(nums, shuffled)){
    shuffleArray(shuffled);
    count++;
  }
  for (int i = 0; i < nums.length; i++) {
      pushMatrix();
      translate(i*width/n, height);
      rect(0, 0, width/n, -shuffled[i] * height/n);
      popMatrix();
  }
  text(count, 10, 10);
}

int factorial(int f) {
    return ((f == 0) ? 1 : f * factorial(f - 1)); 
}

void shuffleArray(int[] a) {
  int n = a.length;
  for (int i = 0; i < n; i++) {
    int change = i + (int) (Math.random() * (n - i));
    swap(a, i, change);
  }
}

void swap(int[] a, int i, int change) {
  int helper = a[i];
  a[i] = a[change];
  a[change] = helper;
}



