
void setup ()
{
  size (600, 200);
  smooth();
  
}
 
void draw ()
{
  background (#57385c);
 
  // wie viele kleine Kreise sollen gezeichnet werden? -----------------------
  int numberOfElements = 20;
  float r = 80;
 
  // wie groß sollen die Abstände zwischen den Kreisen sein?-------------------
  float angleSteps = TWO_PI / numberOfElements;
 
  int i = 0;
 
  while (i < numberOfElements)
  {
 
    // Berechnung -----------------------
    
    float angle = angleSteps * i;
    float x = width/2 + cos (angle)*r;
    float y = height/2 + sin (angle)*r;
 
    // Kreis zeichnen ---------------------------------
 
    fill (#ffedbc);
    stroke (#A75265);
    ellipse (x, y, 10, 10);
 
    // zählvariable erhöhen----------------------------------
 
    i = i + 1;
  }
}
