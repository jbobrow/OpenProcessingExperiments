
int value = 0;

void setup () {
  size ( 500, 500);
}
void draw() {
  if (value == 1){
    stroke(255, 0, 100);
    fill(100, 25, 89);
  ellipse(mouseX, mouseY, 55, 55);
  }
}
void mousePressed() {
    value = 1;
}

void mouseReleased(){
  value = 0;
}


