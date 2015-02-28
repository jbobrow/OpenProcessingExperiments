
void setup(){
  size(500,500);
  smooth();
  colorMode(RGB,50,500,500,500);
  background(50,500,500);
}

void draw(){
  strokeWeight(abs(mouseX-pmouseX)+abs(mouseY-pmouseY));
  stroke(abs(mouseY-pmouseY),400,mouseX, 200);
  line(mouseX, mouseY, mouseX, mouseY);
}

