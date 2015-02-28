
float x=0;
float speed=18;

void setup() {
  size(400, 400);
  fill(250, 0, 0);
  noStroke();
  smooth();
}

void draw() {
  gravity();
}

void gravity() {
  background(255, 255, 255);
  frameRate(100);
 ellipse(200, 400-x, 12, 12);
  x=x+speed;
    speed=speed-.53;
if((x>390)||(x<-50)) {
  speed=speed*-1;
}
if(x>390) {
  x=0;
  speed=18;
}
}

