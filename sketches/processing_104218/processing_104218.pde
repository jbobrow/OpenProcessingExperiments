
// Processing Mod 1 : Line Sketches
//Global Variables here

//RED RECTANGLE

void setup() {
  size(800, 800);
  background(255, 3, 24);
}
    
void draw() {
 rainbowRectangles(mouseX, mouseY);
}

void rainbowRectangles (int x, int y) {
  fill(255, 3, 24);
  rectMode(CENTER);
  rect(x, y, 400, 400);
  fill(255, 159, 3);
  rectMode(CENTER);
  rect (x, y, 330, 330);
  fill(255, 247, 3);
  rectMode(CENTER);
  rect (x, y, 260, 260);
  fill(22, 255, 3);
  rectMode(CENTER);
  rect (x, y, 190, 190);
  fill(3 , 249, 255);
  rectMode(CENTER);
  rect (x, y, 120, 120);
  fill(205, 130, 252);
  rectMode(CENTER);
  rect (x, y, 50, 50);

}
