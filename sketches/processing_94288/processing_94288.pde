
void setup() {
size(1000, 500);
fill(255, 0, 0, 102);
smooth();
noStroke();
}
void draw() {

if (mousePressed) {
  fill(255, 0, 0, 102);
  
  
  if (mouseButton == RIGHT){
    fill(0, 255, 0, 102);
  }
  
}

else {
  fill(0, 0, 255, 102);
}
ellipse(mouseX, mouseY, 20, 20);
}


