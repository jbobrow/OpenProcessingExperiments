
void setup ()
{
  size (600, 600);
  smooth();
  noLoop();
}

void draw ()
{
  // hintergrund
  background (#57385c);

  // wie viele  Kreise sollen gezeichnet werden? -----------------------
  int numberOfElements = (int) random (50, 1000);
  float numberOfCirculations = random (1, 20);

  // wie groß sollen die Abstände zwischen den Kreisen sein?-------------------
  float angleSteps = numberOfCirculations * TWO_PI / numberOfElements;
  float radiusSteps = (float) 230 / numberOfElements;

  int i = 0;

  while (i < numberOfElements)
  {

    // Berechnung -----------------------

    float r = radiusSteps * i;
    float angle = angleSteps * i;
    float x = width/2 + cos (angle)*r;
    float y = height/2 + sin (angle)*r;

    // Kreis zeichnen ---------------------------------

    fill (#ffedbc);
     stroke (#A75265);
    ellipse (x, y, 20, 20);

    // zählvariable erhöhen----------------------------------

    i = i + 1;
  }
}

void mousePressed () {
  redraw();
}

