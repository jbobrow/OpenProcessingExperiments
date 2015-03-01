
void setup ()
{
  size (600, 600);
  smooth();
  background (#57385c);
}

void draw ()
{
  // hintergrund
  fill (#57385c, 25);
  noStroke();
  rect(0, 0, width, height);

  // wie viele  Kreise sollen gezeichnet werden? -----------------------
  int numberOfElements = 40;

  // wie groÃ� sollen die AbstÃ¤nde zwischen den Kreisen sein?-------------------
  float angleSteps = TWO_PI / numberOfElements;
  float startAngle = (float) frameCount / 200;

  int i = 0;

  while (i < numberOfElements)
  {

    // Berechnung -----------------------
    
    float r = 140 + sin((float) frameCount /100) * 100;
    float angle = startAngle + angleSteps * i;
    float x = width/2 + cos (angle)*r;
    float y = height/2 + sin (angle)*r;

    // Kreis zeichnen ---------------------------------

    fill (#ffedbc, 180);
    noStroke();
    ellipse (x, y, 20, 20);

    // zÃ¤hlvariable erhÃ¶hen----------------------------------

    i = i + 1;
  }
}

