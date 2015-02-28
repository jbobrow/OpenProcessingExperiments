
int[] nums = {5, 4, 2, 7, 6, 8, 5, 2, 8, 14}; 

// Square each number ((i.e., multiply each by itself) 
for (int i = 0; i < nums.length; i++)  {   
  nums[i] = nums[i]*nums[i];  
}   
 
// Add a random number between zero and 10 to each number.  
for (int i = 0; i < nums.length; i++)  {   
  nums[i] += int(random(10));  
}

// Add to each number the number that follows in the array. Skip the last value in the array.  
for (int i = 0; i < nums.length-1; i++)  {   
  nums[i] += nums[i+1]; 
}

// Calculate the sum of all the numbers.  
int sum = 0;
for (int i = 0; i < nums.length; i++) {   
  sum += nums[i];
}

