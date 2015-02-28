
//Sarah Anderson, seanders
//hw9
//copywrite Sarah Anderson @CMU 2012

int [] myArray = {0,1,2,3,4,5,6,7,8,9};


void setup(){
  size(400,400);
  background(50);
  smooth();
  textSize(20);
}

void draw(){
  text("Length of Array is: " + findLength(), 20,40);
  text("Sum of elements in my Array is: " + findSum(), 20, 80);
  text("Average of elements in my Array is: " + findAvg(), 20, 120);
  text("Sum of numbers > Average is: " + largerSum(), 20, 160);
}

float largerSum(){
  float larger=0;
  for (int i=0;i<myArray.length; i++){
    if(myArray[i]>findAvg()){
      larger += myArray[i];
       
    } 
  }
 return larger; 
}


float findAvg(){
  return findSum()/myArray.length;  
}


float findSum(){
  float sum=0;
  for( int i=0; i< myArray.length; i++){
    sum+=myArray[i];
  }
  return sum;  
}

int findLength(){
  return myArray.length;
  
  
}
