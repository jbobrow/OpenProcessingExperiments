
float centerX = 100;
float centerY = 100;

void setup() {
  size(200,200); 
  //smooth();
}

void draw() {
  background(255);
  stroke(0);
  rectMode(CENTER);
  fill(175);
  rect(100,100,175,175);
  fill(255);
  ellipse(centerX,centerY,75,75);
  
  
  centerX += random(-1, 1);
  centerY += random(-1,1);
  
  centerX = constrain(centerX,0,width);
  centerY = constrain(centerY,0,height);
}
