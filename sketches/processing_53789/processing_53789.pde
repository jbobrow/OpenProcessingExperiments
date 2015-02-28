
// homework #9 for Jim's CFA-757
// @ Carnegie Mellon University
// Zoe Lu copyright Spring 2012, Pittsburgh PA 15213

int [] numArray = {2,6,57,21,8,96,37,45,76,58,32,38,29};

void setup(){
  size(600,200);
  textSize(14);
  background(250,250,250);
  fill(45,158,243);
  text("The length of this array is: " + numArray.length,20,50);
  text("The sum of this array is: " + getSum(numArray),20,80);
  text("The average of this array is: " + calculateAvg(numArray),20,110);
  text("The sum of the numbers that grater than the average is: "+getSum2(numArray),20,140);

}

int getSum(int[] myArray){
  int sum=0;
  for(int i=0;i<myArray.length;i++){
    sum+=myArray[i];
  }
  return sum;
}

float calculateAvg(int[] myArray){
  int sum=0;
  for(int i=0;i<myArray.length;i++){
    sum+=myArray[i];
  }
  return sum/(myArray.length);
}

//returns the sum of numbers that grater than the average
int getSum2(int[] myArray){
  int sum2=0;
  for(int j=0;j<myArray.length;j++){
    if(myArray[j]>calculateAvg(myArray)){
      sum2+=myArray[j];
    }
  }
  return sum2;
}


