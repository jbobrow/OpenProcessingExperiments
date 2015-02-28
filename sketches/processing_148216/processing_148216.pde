

void setup ()
{
  size (600, 200);
  smooth();
  noLoop();
}

void draw ()
{
  /* Hintergrund zeichnen */
  background (#57385c);
  
  /* Farbe und Kontur festlegen */
  stroke (#57385c);
  strokeWeight (1);
  fill (#ffedbc);
  
  /* Anzahl der Elemente festlegen */
  int elementsNum = (int) random (20, 1000);
  int i = 0; // zählvariable für die Elemente
  
  /* in jedem Schleifendurchlauf wird ein Element gezeichnet */
  while(i < elementsNum) {
  
      /* Festlegung der Position jedes Elementes */
      float x = random(width);
      float y = random(height);
  
      /* jedes Element besteht aus sich überlagernden Kreisen, die in jeder Ebene kleiner werden */
      float d = random (10, 100); // zählvariable = aktueller Durchmesser des Kreises
      float steps = random (4, 12); // Wert für die schrittweise Verkleinerung des Durchmessers
      
      /* die Schleife wird nur ausgeführt, wenn der Durchmesser positiv ist */
      while (d > 1) {
        /* zeichnet einen Kreis mit dem aktuellen Durchmesser */  
        ellipse (x, y, d, d);
        
        /* verkleinert den aktuellen Wert von d*/
        d = d - steps;
      }
      
      i = i + 1;
  }
 
}

 
void mousePressed ()
{
  redraw();
}

