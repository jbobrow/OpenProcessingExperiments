
void setup ()
{
  size (600, 200);
  smooth();
}

void draw ()
{
  background (#57385c);

  // Eingabe und Verarbeitung
  boolean zeichneRechteck1 = mouseX < width *0.25;
  boolean zeichneRechteck2 = mouseX < width *0.5;
  boolean zeichneRechteck3 = mouseX < width *0.75;


  // Ausgabe

  /* farbe */
  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);

  /* rechteck */
  if (zeichneRechteck1)
  {
    rect (0, 0, width *0.25, height);
  } else if (zeichneRechteck2)
  {
    rect (width *0.25, 0, width *0.25, height);
  } else if (zeichneRechteck3)
  {
    rect (width*0.50, 0, width *0.25, height);
  } else
  {
    rect (width *0.75, 0, width *0.25, height);
  }
}

