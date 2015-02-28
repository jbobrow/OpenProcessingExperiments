
int x1 = 200;
int y1 = 250;
int y2 = 250;
int x2 = 200;

void setup(){
  size(700,400);
  background(0);
}

void draw(){
  if (mousePressed && (mouseButton == LEFT)) {
  stroke(255);
  line(x1,y1,200,400);
  y1 = y1 + 5;
  x1 = x1 - 5;
  line(x2,y2,200,400);
  y2 = y2 + 5;
  x2 = x2 + 5;}
}

void mouseReleased(){
  background(0);
}

