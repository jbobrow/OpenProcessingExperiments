
float [] rVals = new float [10];
float total = 0;

void setup ()
{
  size (600, 600);
  smooth();

  int i = 0;
  total = 0;
  while (i < rVals.length)
  {
    rVals [i] = random (5, 200);
    total = total + rVals [i];
    i = i + 1;
  }
}

void draw ()
{
  background (#57385c);

  // wie viele kleine Kreise sollen gezeichnet werden? -----------------------
  int numberOfElements = rVals.length;

  // wie groÃ�ï¿½ sollen die AbstÃ�Â¤nde zwischen den Kreisen sein?-------------------
  float angleSteps = TWO_PI / total;
  
  int i = 0;

  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (2);

  float currentAngle= 0;
  float startAngle = 0;

  while (i < numberOfElements)
  {
    currentAngle= angleSteps * rVals [i];


    // pie chert zeichnen ---------------------------------

    arc (width/2, height/2, 260, 260, startAngle , startAngle+currentAngle);
    line (width/2, height/2, width/2 + cos (startAngle )*130, height/2 + sin (startAngle )*130);

    // Berechnung -----------------------
    startAngle = startAngle + currentAngle;

    // zÃ�Â¤hlvariable erhÃ�Â¶hen----------------------------------

    i = i + 1;
  }
}

void mousePressed ()
{
  setup();
}

