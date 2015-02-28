
//so erstelle ich maloberfläche
void setup(){
  //die grösse
size(400,400);
//background farbe
background(255);
smooth();
}
//funktion malen
void draw(){
  //die farbe schwarz 255 und radius 30
fill(255,30);
// radius und gröse 30
//und man zeichnet, wo der maus grade ist
ellipse(mouseX,mouseY,30,30);
}
