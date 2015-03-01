
float [] [] rVals;
float total = 0;
float minVal, maxVal;
 
void setup ()
{
  size (600, 600);
  smooth();
 
  int i = 0;
  total = 0;
 
  rVals = new float [0] [0];
  int num = (int) random (5, 20);
  
  minVal = 20;
  maxVal = 0;
 
  while (i < num)
  {
    float rowTotal = 0;
    int numPerRow = (int) random (5, 20);
    float [] vals = new float [numPerRow];
     
    if (numPerRow > maxVal) maxVal = numPerRow;
    else if (numPerRow < minVal) minVal = numPerRow;
     
    int j = 0;
    while (j < vals.length)
    {
      vals [j] = random (5, 35);
      rowTotal = rowTotal + vals [j];
      j = j + 1;
    }
 
    rVals = (float [] []) append (rVals, vals);
 
    total = total + numPerRow;
    i = i + 1;
  }
}
 
void draw ()
{
  background (#57385c);
 
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
    float mapValue = map ( rVals [i].length, minVal, maxVal, 0,1);
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
 
      float x2 = x1 + cos (ca)*rVals [i] [j]*2;
      float y2 = y1 + sin (ca)*rVals [i] [j]*2;
      stroke (lerpColor (c, color (254, 190, 126), map (rVals [i] [j], 5, 35, 0, mapValue)));
      line (x1, y1, x2, y2);
 
      j = j +1;
    }
 
    // Berechnung -----------------------
    startAngle = startAngle + currentAngle;
 
    // zÃ¤hlvariable erhÃ¶hen----------------------------------
 
    i = i + 1;
  }
}
 
void mousePressed ()
{
  setup();
}
