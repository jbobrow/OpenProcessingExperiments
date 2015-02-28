
void setup() {
  size(400, 400);
  smooth();
  noCursor();
  }
void draw() {
  background(204);
  int nmouse = 0;
  float x = mouseX;
  float y = mouseY;
  line(x, y, x, y+40);
  line(x, y, x, y-40);
  triangle(x, y-40, x-20, y, x+20, y);
  rect(x-20, y, 40, 40);
  if (mousePressed){
    cursor();
    }
  else {
    noCursor();
    }
  }                 
