
int x = 0;
int y = 0;
int speed = 1;

void setup () {
  size(500,500);
  smooth();
}

void draw () {
  background(0);
  
  x = x + speed;
  y = y + speed;
  
  if ((x>width) || (x < 0) || (y>height) || (y < 0)) {
    speed = speed * -1;
  }
  
  stroke(255);
  fill(100);
  ellipse(x,y,32,32);
}

