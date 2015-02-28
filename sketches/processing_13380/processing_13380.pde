
// Un premier programme de dessin
// PrPierre, 2008

void setup() {
  size(500, 500);
  background(200);
  smooth(); 
  strokeWeight(20);
  stroke(0, 100);
}

void draw() {
  point(mouseX, mouseY);
  point(width-mouseX, mouseY);

  ///// Variante pour une symetrie centrale : ajouter
  //point(mouseX,height-mouseY);
  //point(width-mouseX,height-mouseY);
}


