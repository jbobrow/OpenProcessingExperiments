
//Dan Sztanga
//dan.sztanga@gmail.com
//(C) 2012. All Rights Reserved.
//HW9_ Array Math

//initialize array
int[] listA = {93, 37, 59, 12, 78, 50, 63, 35, 61, 96};
float sum, avg, greater;

void setup(){
  size(400,400);
  background(255);
  fill(0);
  
  //prints values to console
  for(int i = 0; i <listA.length; i++){
    println(listA);
  }
  
  //prints out calculations on screen
  text("There are " + listA.length + " values.", 10, 50);
  text("The sum of the values is " + int(sumCalc()) + ".", 10, 100);
  text("The average of the values is " + avgCalc() + ".", 10, 150);
  text("The sum of values greater than the sum is " + int(greaterCalc()) + ".", 10, 200);
}

//sum calc
float sumCalc(){
  for(int i = 0; i <listA.length; i++){
    sum += listA[i];
  }
  return sum;
}

//avg calc
float avgCalc(){
  avg = sum/listA.length;
  return avg;
}

//sum greater than greater calc
float greaterCalc(){
  for(int i = 0; i <listA.length; i++){
    if(listA[i] > avg){
      greater =+ listA[i];
    }
  }
  return greater;
}

