
void setup() {
  size(400, 400);
  background(250);
}

void draw() {
  if(mousePressed){
    drawLine(mouseX, mouseY, pmouseX, pmouseY);
    stroke((int)random(255), (int)random(255), (int)random(255));
    strokeWeight(8);
  }
}

void drawLine(int x, int y, int x2, int y2) {
  if(x >= 200 && y < 200) {
    line(y, x, y2, x2);
  } else if(x >= 200 && y >= 200) {
    line(400-y, 400-x, 400-y2, 400-x2);
  } else if(x < 200 && y <200){
    line(400-x, 400-y, 400-x2, 400-y2);
  } else {
    line(400-x, 400-y, 400-x2, 400-y2);
  } 
}
