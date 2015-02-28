
//Bryan Williams
//September 28, 2011
//Computational Methods
//Assignment 6

//rectangle count
int num = 1; 
 
// create the arrays
float[] b = new float[num]; 
float[] speed = new float[num];
 
void setup() {
  size(300, 400);
  frameRate(20);
  background(20,42,108);
  noFill();
  stroke(200,255);
  strokeWeight(random(.8));
  smooth();
   
  //seed the array
  for (int m = 0; m < num; m++) {
    b[m] = m; 
    //this is for the speed
    speed[m] = random(1, 6);
  }
}
void draw() {
  for (int m=0; m < num; m++) {

    rect(b[m], 0,b[m], random(height));
    //this will loop the randomly sized rectangles
    b[m] = b[m] + speed[m]/8;
    if (b[m] > height + 40) {
      b[m] = 10;     
    } 
  } 
}


    

