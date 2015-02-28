
//so erstelle ich maloberfläche
void setup(){
  //die grösse
size(400,400);
//background farbe
background(255);
rect(0,0,width,height);
smooth();
}
//funktion malen
void draw(){
 if (mousePressed){
 
  //die farbe schwarz 255 und radius 30
fill(255,50);
//so wird transparenz erzeugt
rect(0,0,width,height);
//dadurch wird mit farbe gefühlt
fill(0);
// radius und gröse 30
//und man zeichnet, wo der maus grade ist
ellipse(mouseX,mouseY,50,50);
 }
 
}
