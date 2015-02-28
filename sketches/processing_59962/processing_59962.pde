
float x=0;
float speed=14;

void setup() {
  size(400, 400);
  fill(250, 0, 0);
  noStroke();
  smooth();
}

void draw() {
  background(255, 255, 255);
  frameRate(10);
 ellipse(200, 400-x, 12, 12);
  x=x+speed;
    speed=speed-.4;
if((x>350)||(x<-50)) {
  speed=speed*-1;
}
}

