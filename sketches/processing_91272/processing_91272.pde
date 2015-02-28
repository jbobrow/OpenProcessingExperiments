
//so erstelle ich maloberfläche
void setup(){
  //die grösse
size(400,400);
//background farbe
background(255);
}


void draw() {
  /*Wen die lefte maustaste gedrückt ist dann eine Linie zeichnen*/
  if (mouseButton == LEFT) {
   line(mouseX, 200, 200, mouseY);//schwarz
  }else if (mouseButton == RIGHT) {//mit rechtem click
    background(0);//schwarze Hintergrund
    stroke(255);//weisse linie
  } 
}
