
//homework 9 rwandrew
//copyright russell andrews 2012

int [] numbers = {2, 4, 6, 8, 100, 200, 300, 42, 57, 84};

void setup(){
  size(400,400);
  background(255);
  fill(0);
  textAlign(LEFT, CENTER);
  
  text("Length of the array: " + numbers.length, 100,160);
  text("Sum of array values: " + findSum(), 100, 180);
  text("Average of array values: " + findAverage(), 100, 200);
  text("Sum of array values that are \ngreater than their average: " + findThing(), 100, 230);
}

int findSum(){
  int sum = 0;
  for(int i = 0; i < numbers.length; i++){
    sum = sum + numbers[i];
  }
  
  return sum;
}

float findAverage(){
  float sum = 0;
  for(int i = 0; i < numbers.length; i++){
    sum = sum + numbers[i];
  }
  
  return sum/numbers.length;
}

float findThing(){

  float sum = 0;
  for(int i = 0; i < numbers.length; i++){
    if(numbers[i] > findAverage()){
    
    sum = sum + numbers[i];
  }
  }
 
  
  return sum; 
}


