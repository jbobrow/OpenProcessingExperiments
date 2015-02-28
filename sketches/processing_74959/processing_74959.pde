
//Zhaochang He  zhaochah@andrew.cmu.edu
//HW 9 array
//copyright

int [] arrayofints = {2, 13, 24,34, 47, 51, 53, 55, 56, 63, 65, 78, 83, 92, 95, 99};

void setup()
{
  size(400,400);
  smooth(); 
  fill(100);
}


void draw() {
 background(#CCFFCC);
 textSize(width/30);
 text("The Length of the array: " + arrayofints.length, width/20, height*.1);
 text("The sum of the array: " + sumofarray(), width/20, height*0.2);
 text("The average of the array value: " + averageofarray(), width/20, height*0.3);
 text("The sum of all values that greater than average: " + sumavg(), width/20, height*0.4);
}


float sumofarray(){
  float sum = 0;
  for (int i = 0; i < arrayofints.length; i++) {
    sum = sum + arrayofints [i];
  }
  return sum;
}


float averageofarray(){
    return sumofarray()/arrayofints.length;
}

int sumavg(){
  int sumagain = 0; 
  float average = averageofarray();
  for (int i = 0; i < arrayofints.length; i++) {
    if(arrayofints [i] > average) {
      sumagain = sumagain + arrayofints [i];
    }
  }
    return sumagain; 
}




