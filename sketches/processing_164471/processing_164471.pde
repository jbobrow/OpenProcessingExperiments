
void setup() {
  size(500, 500);
  background(124); 
  smooth();
}

void draw() {
  drawSword(width/2, height/2, 200); //center position
}



void drawSword(int x, int y, int size) {
  y = y - size/3; //this is used to corent the center position on the Y axis.
  swordHilt(x, y, size); //draws the hilt
  swordBlade(x, y, size); //draws the blade
}


void swordBlade(int x, int y, int size) {
  triangle( x, y-size/5, x-size/6, y+size/2, x+size/6, y+size/2); //using a triangle function to do the blade
}

void swordHilt(int x, int y, int size) {
  rectMode(CENTER); //make the drawing of the handle easier.
  rect(x, y+size/2+size/10, size/10, size/3); //the handle
  rectMode(CORNER); 
  rect(x-size/4, y+size/2, size/2, size/10); //the guard (?)
}



