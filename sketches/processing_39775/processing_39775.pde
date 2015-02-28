
//Irina Shumskaya
//6.1

int num = 150; // 150 variables
 
// create the arrays
float[] x = new float[num]; // x-coordinate
float[] y = new float[num]; // y-coordinate
float[] speed = new float[num]; // speed
 
void setup() {
  size(300, 300);
  smooth();
 
  // seed the array
  for (int i=0; i < num;i++) {
    x[i] = random(width);
    y[i] = random(height);
    speed[i] = random(1, 7);
  }
}
 
void draw() {
  background(0);
   
  for (int i=0; i < num; i++) {
     
    //rotate the composition 15 degrees and adjust the origin
    pushMatrix();
    rotate(15);
   translate(-100,-120);
     
     
    // draw a set of rectangles with variation in fill
    noStroke();
    fill(random (110),100,random (50),90);
    rect(x[i],-y[i],5, 150);
  
     
    popMatrix();
     
    // set variables speed
    y[i] = y[i] + speed[i];
    if (y[i] > height) {
      y[i] = 0;
    }
  }
}


