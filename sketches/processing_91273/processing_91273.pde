
//Neue Versuche
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
   stroke(0);
  }else if (mouseButton == RIGHT) {//mit rechtem click
    stroke(255);//weisse linie
     line(mouseX, 200, 200, mouseY);
  } else{
    stroke(0);
  }
}
