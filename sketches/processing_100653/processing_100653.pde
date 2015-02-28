
float bx;
float by;
boolean locked;
float yOffset = 0.0;

void setup() {
  size(500, 500);
  stroke(255);
  background(#FFFFFF);
  noFill();
  bx = width/2;
  by = height/2;

}


void draw() {
  stroke(0);
 if (by > mouseY) {
   stroke(#FFFFFF);}


  strokeWeight(3);
line(mouseX, mouseY, bx, by);
 
}

void mousePressed() {
    locked = true;
  yOffset = mouseY-by;
  
  
}
  
void mouseDragged() {
  if(locked) {
    by = mouseY-yOffset;
  }
}
  
void mouseReleased() {
  locked = false;
  
  
}
