
void setup() {
  size(700,700);
  smooth();
  background(0);
}

void draw() {

  int r = int(random(0, 200));
  int a = int(random(10,99));
  fill(0,random(255), random(255), a);
  
  if(a<90) {
    blueGreenSquares(mouseX, mouseY, r, 10);
  }
  else if (a>90) {
    blueGreenCircles(mouseX, mouseY, r);
  }
}
 
void blueGreenSquares(int x, int y, int r, int c) {
  noStroke();
  rectMode(CENTER);
  rect(x, y, r, r, 10);
}


void blueGreenCircles(int x, int y, int r) {
  noStroke();
  ellipse(x, y, r, r);

}
 



