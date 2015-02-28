
boolean isDrawing = false;

void setup(){
  size(400,200);
  background(100);
}

void mousePressed() {
  isDrawing=true;
}

void mouseReleased() {
  isDrawing=false;
}

void draw() {
  fill(0);
  if(isDrawing) {
    //point(mouseX, mouseY);
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
}



