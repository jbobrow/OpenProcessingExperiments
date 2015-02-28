
void setup() {
  size (480, 120) ;
  smooth() ;
  text("Sebastian Santoro", 50, 30);
}

void draw() {
  if (mousePressed) {
    fill (0) ;
  } 
  else {
    fill(225) ;
  }
  ellipse(mouseX, mouseY, 80, 80);
}



