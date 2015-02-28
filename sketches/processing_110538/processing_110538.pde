

int diameter = 100;
int distance = diameter/2;
int speed = 10;
int direction = 1;


void setup() {
  size(800, 800);
  background(100);
  fill(150, 109, 255);
  noStroke();
}
void draw() {
  background(100);
  ellipse(width/2, distance, diameter, diameter);

  distance += speed*direction;

  if (distance>height-diameter/2 || distance<0+diameter/2) {
    direction = - direction;
  }

}
