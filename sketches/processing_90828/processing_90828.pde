
//Gabriela Nisenbaum
//Feb 23, 2013
//Bouncing Object

int circleX=300;
int circleY=200;
int circle=2;

void setup(){
  size(500, 500);
  background(255);
}

void draw(){
  background(24, 157, 131);
  circleX=circleX+circle;
  noStroke();
  fill(94, 24, 157, 100);
  ellipse(circleX, circleY+150, 200, 200);
  ellipse(200, 350, circleX, circleY);
  fill(24, 157, 29, 150);
  ellipse(circleY, circleX, 100, 100);
  ellipse(200, 200, circleY, circleX);
  
  circleX=circleX+circle;
  if(circleX>width) {
    circle = -2;
  }
  if(circleX < 0){
    circle = 2;
  }
}
