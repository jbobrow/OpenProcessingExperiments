
int color = 0;
void draw() {
size(256,256);
noStroke();
background(255);
fill(130,color,color,80);
ellipse(90, 90, mouseX, mouseX);

ellipse(80, 168, mouseY, mouseY);
ellipse(130, 100, mouseY-15, mouseY-15);
ellipse(150,180,mouseX-20,mouseX-20);

}

void mouseMoved() {
  color = color+ 3;
  if (color > 255) {
    color = 0;
  }
}
