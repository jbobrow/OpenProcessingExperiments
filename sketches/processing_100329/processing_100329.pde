
void setup() {
  size(640, 360); 
  stroke(255);
  background(#FFFFFF);
  noFill();
}

void draw() {
  stroke(0,0,0,0);
  fill((mouseX % 255), (mouseY % 255), ((mouseX * mouseY) % 255));
  rect(mouseX,mouseY,mouseX, (height*mouseY*width*mouseY/(mouseY*height*mouseX+1)));
}
