
boolean moving=true;
int circleX = 100;
int circleY = 150;
void setup(){
  size(400,400);
}


void draw(){
  background(#48BAFF);
  stroke(0);
  fill(0);
  ellipse(circleX,circleY,100,100);
  
  if (moving) circleX = circleX + 1;
}

void mousePressed() {
  moving=false;
  

}
  
