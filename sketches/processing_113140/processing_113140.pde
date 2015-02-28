
//color
//Lin,Lien-Ya
void setup() {
  size(480, 120);
  smooth();
  background(0);
}
void draw() {
  if (mousePressed) {
    ;
    fill(mouseX, mouseY, mouseX/10+mouseY/10,48);
  } 
  else {
    fill(85, 45, 501, 46);
  }
  noStroke();
  ellipse(mouseX, mouseY, 80, 80);
}



