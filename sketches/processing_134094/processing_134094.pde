
int aumento =0;
void setup() {
  size(600, 600);
 
}
void draw() {
ellipse(mouseX, mouseY,50,50);
ellipse(mouseY, mouseX,50,50);
ellipse(height-mouseX, mouseY,50,50);
ellipse(height-mouseX, height-mouseY,50,50);
}

