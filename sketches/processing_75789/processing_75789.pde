
// Leyli Guliyeva
// 2012 Copyright
// homework 9

int[] x = { 12, 54, 37, 65, 89, 17, 5, 185, 57, 64, 26, 78, 177, 121, 90, 21};
int sum, avg, high;

void setup () {
  size (400, 200);
  background (#F57474);  
  textSize (10);
  fill (#FFFCFC);
  
  text("length : " + x.length, width/2, height/2-30); 
  sum = fSum();
  text("sum : " + sum, width/2, height/2-10);
  avg = fAvg();
  text("average : " + avg, width/2, height/2+10);
  high = fHigh();
  text("sum of greater values : " + high, width/2, height/2+30);
 
 textAlign(RIGHT); 
}
 
int fSum(){
  int sum = 0;
  for(int i = 0; i<x.length; i++){
    sum = sum + x[i]; 
}
  return sum;
}
 
 int fAvg() { 
    return fSum()/x.length;
 }
 
int fHigh(){
  int sum = 0;
  int avg = fAvg ();
  for(int i = 0; i < x.length; i++){
    if(x[i] > avg){
      high = high + x[i]; 
    }
  }
  return high;
}

