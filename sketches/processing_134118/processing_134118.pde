
// crashCourse processing by Corneel Cannaerts 2014
// arrays

// an array can store a number of variables
// use the [] bracks after the datatype while initialising array
// float[] arrayOfValues =


// a variable has a position in the array defined by its index  

//values can be assigend direcly by using { , , }
int[] heightValues = {   10, 80, 50, 90, 14, 85, 17, 32};

//or an array with a specific length can be initialized first
float[] widthValues = new float[8];


void setup() {  
  size(400, 400);
  //values assigned later
  widthValues[0] = 10;
  widthValues[1] = 9.5;
  widthValues[2] = 6.7;
  widthValues[3] = 12.3;
  widthValues[4] = 8.3;
  widthValues[5] = 7.8;
  widthValues[6] = 13.1;
  widthValues[7] = 10.5;
  
  //print array
  println(heightValues); 
  
  //length of array
  println(heightValues.length);
  
  //get variable at specifi index in this case 3
  //println(heightValues[3]);
}

void draw() {
  background(255);
  fill(0); 
  for (int i=0; i<heightValues.length; i++) {   
    rect(50+i*40, 150, widthValues[i], heightValues[i]);
  }
}



