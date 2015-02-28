
void setup() {
 size(500,500);
 smooth();
}
 
void draw() {
  ellipse(250,250,2*mouseX,2*mouseY);
  ellipse(100,100,-mouseX,-mouseY);
}

