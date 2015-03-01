
//Einfuehrung in Processing
// 2-4 Aushauchen von Spuren
 
void setup (){
  size (400, 200);
  background(255,255,255);
}
  
 
 
void draw (){
  // Zeichnen eines leicht durchsichtigen Hintergrunds
  fill (0,155,188, 20); // die vierte komponente gibt die deckkraft der farbe (max. 255) an
  noStroke();
  rect (0, 0, width, height);
  
  // Zeichnen der Kreise
  stroke (255,206,0);
  strokeWeight (2);
  fill (208,242,2);
  ellipse (mouseX, mouseY, 50, 50);
}

