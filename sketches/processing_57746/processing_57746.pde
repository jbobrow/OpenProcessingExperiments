
float boxSize = 150;
float margin = boxSize*-3;
float depth = 900;
color boxFill;

void setup() {
  size(700, 700, P3D);
  noStroke();
}

void draw() {
  background(230,230,245);
       
  // Center and spin grid
  translate(width/2, height/7, depth-1);
  rotateY(frameCount * 0.03);
  rotateX(frameCount * 0.07);

  // Build grid using multiple translations 
  for (float i =- depth/7+margin; i <= depth/7-margin; i += boxSize){
    pushMatrix();
    for (float j =- height+margin; j <= height-margin; j += boxSize){
      pushMatrix();
      for (float k =- width/7+margin; k <= width-margin; k += boxSize){
     // Base fill color on counter values, abs function 
        // ensures values stay within legal range
        boxFill = color(15,10,0,10);
        pushMatrix();
       
     translate(k, j, i);
        fill(boxFill);
        box(700, 75, 75);
    
 popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
}



 
  



