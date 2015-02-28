


float boxSize = 40;
float margin = boxSize*2;
float depth = 400;
color boxFill;

void setup() {
  size(640, 600, P3D);
  noStroke();
}

void draw() {
  background(250);
  

  translate(width/2, height/2, -depth);
  rotateY(frameCount * 0.01);
  rotateX(frameCount * 0.02);

  for (float i =- depth/3+margin; i <= depth/3-margin; i += boxSize){
    pushMatrix();
    for (float j =- height+margin; j <= height-margin; j += boxSize){
      pushMatrix();
      for (float k =- width+margin; k <= width-margin; k += boxSize){
       
        boxFill = color(abs(i), abs(j), abs(k), 50);
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


