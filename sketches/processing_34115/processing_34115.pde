
float value = 0;
void setup(){
  size(700,400);
  
}
void draw() {
  smooth();
  fill(value);
  ellipse(mouseX,mouseY,50,50);
}

void mouseReleased() {
  if(value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}

