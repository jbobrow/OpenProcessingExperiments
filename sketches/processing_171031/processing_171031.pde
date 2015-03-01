
void setup ()
{
  size (600, 200);
  smooth();
}

void draw ()
{
  background (#57385c);

  // Eingabe
  boolean zeichneRechteckMitte = true;
  boolean zeichneRechteckeAussen = false;
  color fillColor = #ffedbc;

  // Verarbeitung
  zeichneRechteckMitte = mouseX >= width *0.25 && mouseX <= width *0.75;
  zeichneRechteckeAussen =  mouseX < width *0.25 || mouseX > width * 0.75;

  if (mouseY > height*0.25 && mouseY < height*0.75)
  {
    fillColor = #ec7263;
  }

  // Ausgabe

  /* farbe */
  fill (fillColor);
  stroke (#A75265);
  strokeWeight (3);

  /* rechteck */
  if (zeichneRechteckMitte)
  {
    rect (width *0.25, 0, width *0.5, height);
  } else if (zeichneRechteckeAussen)
  {
    rect (0, 0, width *0.25, height);
    rect (width *0.75, 0, width *0.25, height);
  }
}

