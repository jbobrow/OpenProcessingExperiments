
// Eingabe
float x = 0;
float y = 0;

void setup ()
{
  size (600, 200);
  smooth();

  /* setzen der Initialwerte für x und y */
  x = width /2;
  y = height /2;
  
  frameRate (500);

  background (#57385c);
}

void draw ()
{
  //Verarbeitung
  /* Zufallszahl berechnen */
  float wuerfel = random (100);

  /**
   * Aktualisierung von x und y in Abhängigkeit von wuerfel
   * 25% Schritt nach oben: wuerfel < 25
   * 25% Schritt nach rechts: wuerfel < 50 (und wuefel > 25)
   * 25% Schritt nach unten: wuerfel < 75 (und wuefel > 50)
   * 25% Schritt nach links: wuerfel < 100 (und wuefel > 75)
   */

  if (wuerfel < 25) // Schritt nach oben
  {
    y = y-1;
  } else if (wuerfel < 50) // Schritt nach rechts
  {
    x = x+1;
  } else if (wuerfel < 75) // Schritt nach unten
  {
    y = y+1;
  } else // Schritt nach links 
  {
    x = x-1;
  }

  /**
   * Randüberprüfung
   * Überprüfung der Were von x und y, damit der Punkt nicht aus dem Fenster wandert
   * Ränder: Oben, Rechts, Unten, Links
   */

  if (x < 0)
  {
    x = 0;
  } else if (x > width)
  {
    x = width;
  }

  if (y < 0)
  {
    y = 0;
  } else if (y > height)
  {
    y = height;
  }

  // Ausgabe
  fill (#ffedbc);
  stroke (#57385c);
  strokeWeight (0.5);
  ellipse (x, y, 6, 6);
 
}

void mousePressed ()
{
    /* setzen der Initialwerte für x und y */
  x = width /2;
  y = height /2;

  background (#57385c);
}

