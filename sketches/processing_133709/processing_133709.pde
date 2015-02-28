
void setup(){
  background(240,248,255);
  noStroke();
}

void draw() {
  purpleSquare(10,25);
  purpleSquare(70,45);
  purpleSquare(35,70);
}

void purpleSquare(int x, int y) {
  fill(176,196,222);
  rect(x,y, 20, 20);
}

