
PFont font = createFont ("Arial", 12);

void setup ()
{
  size (600, 200);
  smooth();
  textFont (font, 12);
}

void draw ()
{
  background (#57385c);


  int numberOfElements = 20;
  float r = 80;

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

    // text ----------------------------------
    fill (255);
    if (abs(sin (angle)) < 0.95)
    {
      text (
      "x = " + nf ( i, 2) + "x angleSteps", // text
      (angle < PI / 2 || angle > PI*1.5) ? x + 20 : x -140, // x koordinate vom text     
      y                                                     // y koordinate vom text
      );
    }

    i = i + 1;
  }
}

