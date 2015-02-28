
int width = 10;
int high = 10;

void setup() {
  size(500,500);
  smooth();
}

void draw() {
  background(0);
  fill(0,100,10,width);
  ellipse(200,200, width,high);

}

void mousePressed() {
  width = width + 10;
  high = high + 10;
}

void keyPressed() {
  width = 10;
  high = 10;
}

