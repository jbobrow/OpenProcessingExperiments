
float yPosCenter = 15;
boolean direction = true;

void setup(){
  size(400, 400);
  background(250);
  smooth();
  noStroke();
}

void draw(){
  fill(0);
  background(250);
  ellipseMode(CENTER);
  ellipse(width/2, yPosCenter, 15, 15);
  
  if (yPosCenter == height-15){
    direction = false;
  }
  
  if (yPosCenter == 15){
    direction = true;
  }
  
  if (yPosCenter >= 15 && yPosCenter != height-15 && direction == true) {
    yPosCenter++;
  }
  else if (yPosCenter <= height-15 && yPosCenter != 15 && direction == false) {
    yPosCenter--;
  }
 }

