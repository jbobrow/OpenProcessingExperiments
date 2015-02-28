
/**
 * Cubic Grid 
 * by Ira Greenberg. 
 * 
 * 3D translucent colored grid uses nested pushMatrix()
 * and popMatrix() functions. 
 */

float boxSize = 80;
float margin = boxSize*2;
float depth = 1000;
color boxFill;

void setup() {
  size(900, 250, P3D);
  noStroke();
}

void draw() {
  background(300);
  
  // Center and spin grid
  translate(width/2, height/2, -depth);
  rotateY(frameCount * 1.0);
  rotateX(frameCount * 0.5);

  // Build grid using multiple translations 
  for (float i =- depth/2+margin; i <= depth/2-margin; i += boxSize){
    pushMatrix();
    for (float j =- height+margin; j <= height-margin; j += boxSize){
      pushMatrix();
      for (float k =- width+margin; k <= width-margin; k += boxSize){
        // Base fill color on counter values, abs function 
        // ensures values stay within legal range
        boxFill = color(abs(i), abs(j), abs(k), 30);
        pushMatrix();
        translate(k, j, i);
        fill(boxFill);
        box(boxSize, boxSize, boxSize);
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
}


