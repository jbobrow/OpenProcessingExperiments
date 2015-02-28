
int circleX = 0;
int circleY = 100;
int fillColor = 0;
void setup(){
  size(200,200);
}

void draw(){
  background(100);
  stroke(255);
  fill(0);
  ellipse(circleX,circleY,50,50);
  circleX = circleX+2;


if (circleX > 230){
  circleX = circleX-200;
}
    noFill();

}


