
int circleX = 0;
int speed = 1;

void setup(){
  size(200,200);
  smooth();
}

void draw(){
  background(255);
  circleX = circleX + speed;
  if ( circleX > width || circleX < 0)
    speed = speed * -1;
    
  stroke(0);
  fill(150,120,50);
  ellipse(circleX,100,32,32);
}

