
float bx;
float by;
boolean locked;
float yOffset = 0.0;
float xOffset = 0.0;

void setup() {
  size(500, 500);
  stroke(255);
  background(#FFFFFF);
  noFill();
  bx = width/2;
  by = height/2;

}


void draw() {
  stroke(mouseY + mouseX % 255, mouseX %5, mouseY % 255);
 if (by > mouseY) {
   stroke(mouseX % 255, mouseY % 255, mouseX+mouseY %5);}


  strokeWeight(4);
line(mouseX, mouseY, bx, by);
 
}

void mousePressed() {
    locked = true;
  yOffset = mouseY-by;
  xOffset = mouseX - bx;
  
  
}
  
void mouseDragged() {
  if(locked) {
    by = mouseY-yOffset;
    bx = mouseX - xOffset;
  }
}
  
void mouseReleased() {
  locked = false;
  
  
}
