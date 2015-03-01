
int circleX=100;
int circleY= 150;
int speed = 3;
void setup(){
  size(300,300);
  smooth();
}

void draw() {
  background(#017479);
  circleX = circleX + speed; 
  stroke(0);
  fill(#2DF007);
  ellipse(circleX,circleY, 100,100);
  
  if(circleX > height|| circleX < 0) 
    speed = speed * -1; // reverse course
}
void mousePressed() {
  speed = speed + 1;
}
