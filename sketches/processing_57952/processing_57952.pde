
/*
Sara Humel
shumel
copyright @ 2012



*/


int [] numbers = {3, 6, 59, 4, 29 , 6, 53, 28, 10, 29};
void setup () {
  textSize(15);
 size (600,200);
background(255);

strokeWeight(1);
stroke(0);
fill(0);
text("length of array: " + numbers.length, 20,60);
text("sum of array values: " + arraySum(numbers),20,90);
text("average of array values: " + arrayAverage(numbers), 20, 120);
text("sum of array values greater than their average: " + arraySumTwo(numbers), 20, 150); 

saveFrame("thumbnail.tif");
}

int arraySum( int [] myArray) {
  int sum = 0;
  for (int i = 0; i <myArray.length; i++) {
    sum = sum + numbers[i];  
  }
  
  return sum;
}
  
float arrayAverage( int [] myArray) {
  int sum = 0;
  for (int i = 0; i <myArray.length; i++) {
    sum = sum + numbers[i];  
  }
  
  return sum/(myArray.length);
}

int arraySumTwo (int [] myArray) {
int sumTwo = 0;
  for(int i = 0; i < myArray.length; i++) {
   if (arrayAverage(myArray) < myArray[i]) {
    sumTwo = sumTwo + myArray[i]; 
  }
  }
  
  return sumTwo;
  
  }


