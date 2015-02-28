
void setup(){
  size(500, 500);
}

void draw(){
  background(255, 204, 0);

ellipse(mouseX, mouseY, 55, 55);

ellipse(mouseX*1.5, mouseY*1.3, 55, 55);

ellipse(mouseX*4, mouseY*4, 55, 55);

point(60, 20); ellipse(mouseX, mouseY, 55, 55);

point(120, 20); ellipse(mouseX*1.2, mouseY*1.5, 10, 40);

point(90, 75); ellipse(mouseX*2, mouseY*4, 20, 100);
}

