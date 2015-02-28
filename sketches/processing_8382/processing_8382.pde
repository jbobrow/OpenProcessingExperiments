
void setup() {
  size(300, 300);
  smooth();
  strokeWeight (8); 
  strokeCap(ROUND); 
  background(218, 229, 229);
}

void draw() {

  if(mousePressed) { 
    strokeWeight (8); 
    strokeCap(ROUND); 
    stroke(183,67,158,127);
  } else {
    stroke(234,163,219, 100);
  }
    line(mouseX, mouseY, pmouseX, pmouseY);
  }



