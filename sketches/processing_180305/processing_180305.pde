
// Rumpelstilzchen
// 08.12.2014

/*Aufgabenstellung
Schreibe ein Programm, das einen selbst gewÃ�Â¤hlten Text an der Mausposition erscheinen lÃ�Â¤sst und ihn anschlieÃ�ï¿½end wieder ausblendet. 
Hinweis 1: Recherchiere, wie du in Processing Text einfuegen kannst. 
Hinweis 2: In Abschnitt zwei findest du ein Beispiel, in dem eine Ellipse ausgeblendet wird. 
*/
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
  textSize(48);
  text ("niki ist cool",mouseX,mouseY);
}



