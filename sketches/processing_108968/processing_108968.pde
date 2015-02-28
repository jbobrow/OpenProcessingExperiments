
int x = 0;
int speed = 4;
float r;
float g;
float b;
float a;

void setup() {
  size(400,400);
  smooth();
}

void draw() {
  background(450);
  r = random(250);
  g = random(250);
  b = random(250);
  a = random(250);

  x = x + speed;
  rect(x,200,300+x,300-x);
  if ((x > width) || (x < 0)) {
    speed = speed * -1;
    }

  stroke(0);
  fill(r,g,b,a);

}




