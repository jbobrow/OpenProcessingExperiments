
void setup() {
  size(500,500);
  background(0);
}

void draw() {
  circle(100,100,150,100,1);
}

void circle(float x, float y, int size, int gry, int fillon) {
  noStroke();
 fill(gry);
 if (fillon==0) {noFill(); stroke(gry);}
  ellipse(x,y,size,size);
}
