
// hw 9
// name: Peter Teguh Salim
// e-mail: psalim@andrew.cmu.edu
// Copyright: Â© Peter Teguh Salim August 2012  Pittsburgh, PA 15213  All Rights Reserved

int[] a = {32,133,23,152,32,4,213,234,14,3,131,205,31,20,145,111,132,75,64,54}; // a random collection of ints
int sum, avg, sumHigh;

void setup(){
  size(400,400);
  background(255);
  textSize(14);
  fill(70);
  
  text(a.length, width/2+35, height/2 - 21);
  sum = getSum();
  text(sum, width/2+35, height/2);
  avg = getAvg();
  text(avg, width/2+35, height/2+21);
  sumHigh = getHigh();
  text(sumHigh, width/2+35, height/2 + 42);
  
  textAlign(RIGHT);
  text("LENGTH : ", width/2+35, height/2-21);
  text("SUM : ", width/2+35, height/2);
  text("AVERAGE : ", width/2+35, height/2+21);
  text("SUM OF GREATER VALUES : ", width/2+35, height/2 + 42); 
}

int getSum(){ 
  for(int i = 0; i<a.length; i++){
    sum += a[i]; // adds everything in the array
  }
  return sum;
}

int getAvg(){
  for(int i = 0;i<a.length;i++){
     avg = sum/a.length; 
  }
  return avg;
}  

int getHigh(){
  for(int i = 0;i<a.length;i++){
    if(a[i]/avg > 0){
      sumHigh += a[i]; // only numbers greater than the average will be included in this sum
    }
  }
  return sumHigh;
}

