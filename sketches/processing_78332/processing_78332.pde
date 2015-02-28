
//Fibonacci Problem 2

int[] nums = new int[3];
int total = 2;
nums[0] = 1;
nums[1] = 2;

while (nums[2] < 4000000) {
  if (nums[2]%2 == 0) {
    total += nums[2];
  }

  nums[2] = nums[0] + nums[1];
  nums[0] = nums[1];
  nums[1] = nums[2];

 text(total,0,50);
}


