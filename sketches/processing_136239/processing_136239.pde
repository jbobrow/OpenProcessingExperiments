
int circleX=50;
int circleY=100;

void setup(){
  size(500,200);
}
void draw(){
  background(random(205), random(175), random(168),random(255));
  stroke(0);
  fill(0);
  ellipse(circleX,circleY,50,50);
  circleX=circleX+1;
  if(circleX==width-40){
    circleX=50;
  }
}
