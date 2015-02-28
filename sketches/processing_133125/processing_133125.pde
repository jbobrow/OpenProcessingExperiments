
int x=0;
int speed=5;
void setup() {
  size(400,400);
  background(255);
  strokeWeight(5);
}

void draw() {
  background(255);
  float r=random(400);
  float g=random(400);
  float b=random(400);
  strokeWeight(1);
  line(50,200,150,200);
  line(50,200,50,300);
  ellipse(220+x,200,20,20);
  line(150,200,r+150,g+150);
  x+=speed;
}
