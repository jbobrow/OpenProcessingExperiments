
int x1 = 200;
int y1 = 250;
int y12 = 200;
int x2 = 200;

void setup(){
  size(700,400);
  background(0);
}

void draw(){
  stroke(255);
  line(x1,y1,200,400);
  y1 = y1 + 5;
  x1 = x1 - 5;
}

