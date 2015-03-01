
int perro = 0;
void setup() {
  size(800,800);
}
void draw() {
  perro = perro+2;
  fill(119,214,250);
  ellipse(mouseY, mouseX, 50,50); 
  fill(138,252,238);
  ellipse(mouseX, mouseY, 50,50); 
}

