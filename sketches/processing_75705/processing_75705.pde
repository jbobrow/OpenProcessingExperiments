
int [] numbers = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20};

PFont font;
 
void setup(){
  size(400, 400);
  smooth();
  background(255);
  fill(130);
  font = loadFont("ChaparralPro-Light-48.vlw");
  textFont(font);
  textAlign(LEFT);
  textSize(width/30);
  text("Length of the array: " + numbers.length, width/3.5, height/2-60);
  text("Sum of array values: " + calcSum(), width/3.5, height/2-40);
  fill(70);
  text("Average of array values: " + calcAverage(), width/3.5, height/2-20);
  text("Sum of array values that are \ngreater than their average: " + calcFinal(), width/3.5, height/2);
}
 
int calcSum(){
  int sum = 0;
  for(int i = 0; i < numbers.length; i++){
    sum = sum + numbers[i];
  }
   
  return sum;
}
 
float calcAverage(){
  float sum = 0;
  for(int i = 0; i < numbers.length; i++){      //russell andrews
    sum = sum + numbers[i];
  }
   
  return sum/numbers.length;
}
 
float calcFinal(){
 
  float sum = 0;
  for(int i = 0; i < numbers.length; i++){
    if(numbers[i] > calcAverage()){
     
    sum = sum + numbers[i];
  }
  }
  
   
  return sum;
}


