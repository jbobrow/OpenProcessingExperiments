
// Einzeiliger Kommentar mit Doppelslash
// Kommentare kÃ�Â¶nnen Ã�Â¼berall stehen

void setup ()
{
  size (600, 200);
  smooth();

  /* 
   
   mehrzeiliger Kommentar
   
   beginnt mit Slash+Sternchen und endet mit Sternchen+Slash
   
   Lehrzeichen und ZeilenumbrÃ�Â¼che werden i.d.R. ignoriert
   
   sie dienen vor allem der Lesbarkeit des Codes
   
   */
}

void draw ()
{
  background (#57385c);

  strokeWeight (10);
  stroke (255);
  noFill();
  
  point (50, 100);
  line (100, 20, 150, 180);
  rect (200, 20, 50, 160);
  ellipse (350, 100, 120, 120);
  triangle (430, 180, 550, 180, 490, 30);
}

