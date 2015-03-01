
// TYPE PLAID

void setup() {
size(500, 500);
noStroke();
background(0);
//fill(255, 51);
}
void draw() { } // Empty draw() keeps the program running

void keyPressed() {
  fill(100,110,200,50);
  int y = (key-32)*5;
  rect(0, y, 500, 4);
  }

void keyReleased() {
  fill(150,210,100,50);
  int x = (key-32)*5;
  rect(x, 0, 4, 500);
}


