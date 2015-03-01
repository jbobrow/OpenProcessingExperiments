
void drawChart ()
{
  // wie viele kleine segmente gibt es im pie chart? -----------------------
  int numberOfElements = rVals.length;

  // winkel-abstände -------------------
  float angleSteps = TWO_PI / total;

  int i = 0;

  stroke (#A75265);
  strokeWeight (2);

  float currentAngle = 0;
  float startAngle = 0;

  while (i < numberOfElements)
  {
    currentAngle = angleSteps * rVals [i].length;

    stroke (#A75265);
    float mapValue = map ( rVals [i].length, minVal, maxVal, 0, 1);
    mapValue = constrain (mapValue, 0, 1);

    color c = lerpColor (#ffedbc, #A75265, mapValue);

    // pie chart zeichnen
    fill (c);
    arc (width/2, height/2, 260, 260, startAngle, startAngle+currentAngle);
    line (width/2, height/2, width/2 + cos (startAngle+currentAngle)*130, height/2 + sin (startAngle+currentAngle)*130);

    float ca = 0;
    float as = currentAngle / rVals[i].length;
    int j = 0;
    while (j < rVals[i].length)
    {
      ca = startAngle + as *  j;

      float x1 = width/2 + cos (ca)*138;
      float y1 = height/2 + sin (ca)*138;

      float lineLength = map (rVals [i] [j], minViews, maxViews, 10, 150);

      float x2 = x1 + cos (ca)*lineLength;
      float y2 = y1 + sin (ca)*lineLength;
      stroke (lerpColor (c, color (254, 190, 126), map (rVals [i] [j], minViews, maxViews, 0, mapValue)));
      line (x1, y1, x2, y2);

      j = j +1;
    }

    // Berechnung -----------------------
    startAngle = startAngle + currentAngle;

    // zÃ¤hlvariable erhÃ¶hen----------------------------------

    i = i + 1;
  }
}


