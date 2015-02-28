
/**
 * Cubic Grid 
 * by Ira Greenberg. 
 * 
 * 3D translucent colored grid uses nested pushMatrix()
 * and popMatrix() functions. 
 */

float boxSize = 20;
float margin = boxSize*2;
float depth = 100;
color boxFill;

void setup() {
  size(800, 700, P3D);
  noStroke();
}

void draw() {
  background(999);
  
  // Center and spin grid
  translate(width/101, height/101, -depth);
  rotateY(frameCount * 0.05);
  rotateX(frameCount * 0.05);

  // Build grid using multiple translations 
  for (float i =- depth/1+margin; i <= depth/1-margin; i += boxSize){
    pushMatrix();
    for (float j =- height+margin; j <= height-margin; j += boxSize){
      pushMatrix();
      for (float k =- width+margin; k <= width-margin; k += boxSize){
        // Base fill color on counter values, abs function 
        // ensures values stay within legal range
        boxFill = color(abs(j), abs(j), abs(k), 100);
        pushMatrix();
        translate(k, j, j);
        fill(boxFill);
        box(boxSize, boxSize, boxSize);
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
}


