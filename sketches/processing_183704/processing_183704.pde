
void setup() {
  size(100, 100);
  background(192);
}

int x = 50;
int y = 50;

void draw() {
  float n = random(1, 100);  //Var
  strokeWeight(1);
  point(x, y);    //Start point

  if (n >= 0 && n <= 25) {
    y=y-1;
    if (y==0) {
      y=50;
    }
    point(x, y);
    println("Up");
  }
  if (n >= 25 && n <= 50) {
    y=y+1;
    if (y==100) {
      y=50;
    }
    point(x, y);
    println("Down");
  }
  if (n >= 50 && n <= 75) {
    x=x-1;
    if (x==0) {
      x=50;
    }
    point(x, y);
    println("Left");
  }
  if (n >= 75 && n <= 100) {
    x=x+1;
    if (x==100) {
      x=50;
    }
    point(x, y);
    println("Right");
  } else {
  }
}

