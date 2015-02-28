

int shapeSize = 50;

void setup(){

 size(500, 500);
 
  
}


void draw() {
  
  background(20);
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  noStroke();
  fill(255,0,255);
  rect(s*width/60, 5, shapeSize, shapeSize);
  ellipse(m*width/60, height/2, shapeSize, shapeSize);
  triangle(h*width/24, 480,shapeSize+h*width/24, 480,shapeSize/2+h*width/24,480-shapeSize);
}


