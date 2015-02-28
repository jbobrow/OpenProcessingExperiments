
PImage bug;
//float x, y;
float x = 0;
float y = 0;
float rot;
int speed = 2;

void setup() {
  size(800, 300);
  bug = loadImage("Bug.jpg");
  y = width/5.0;
  rot = 0.0;
}
void draw() {
  background(255);
  translate(x, y);
  rotate(rot);
  image(bug, 0, 0);
  x = x + speed;
  //y = y + speed;
  rot += 0.01;

  
  if ((x > width) || (x < 0) && (y > height) || (y < 0)) {
    speed = speed * -2;
    rot += 0.01;
  }


}


