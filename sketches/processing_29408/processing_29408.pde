
int circleX = 100;
int circleY = 100;

void setup(){
  size(200,200);
  ellipseMode(CENTER);
}

void draw(){
  
  background(100);
  stroke(255);
  fill(0);
  ellipse(100,100,circleX+1,circleY+1);
  circleX=circleX+1;
  circleY=circleY+1;
}
  



