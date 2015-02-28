
//Homework #9
//Tyler Porten (tporten) copyright 2012

int [] numbers = {15, 57, 42, 88, 9, 20, 7, 29, 61, 4};

void setup(){
 size(400, 400);
 background(255);
 fill(0);
 textAlign(CENTER);
  
 text("Array length: " + numbers.length, width/2, 20);
 text("Array sum: " + arraySum(), width/2, 40);
 text("Array average: " + arrayAverage(), width/2, 60);
 text("Sum of array values greater than average: " + arraySum2(), width/2, 80);
}

int arraySum(){
 int sum = 0;
 for(int i = 0; i < numbers.length; i ++){
  sum = sum + numbers [i];
 } 
  return sum;
}

float arrayAverage(){
  float sum = 0;
  for(int i = 0; i < numbers.length; i ++){
    sum = sum + numbers[i];
  }
  return sum / numbers.length;
  
}

int arraySum2(){
 int sum = 0;
 

 for(int i = 0; i < numbers.length; i ++){
   if(numbers[i] > arrayAverage()){
  sum = sum + numbers[i];
   } 
 }
  return sum;
}

