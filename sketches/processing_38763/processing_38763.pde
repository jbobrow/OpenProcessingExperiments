
boolean bover =true;
boolean locked = false;

void setup() {
  size(500, 500);
  
  background(2037);
  
  stroke(0,255,0);
}
void draw(){}
void mousePressed() {
  if (bover) {
    locked = true;
    point(mouseX,mouseY);
  } 
  else {
    locked = false;
  }
}
void mouseDragged() {
  if (locked) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}


