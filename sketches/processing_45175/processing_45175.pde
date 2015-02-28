
/* purpose of program: 
             monochromatic static.
             
             random Hue is selected at beginning of program.
             random values are assigned to Saturation and Brightness
             to all pixels on sketch. 
 
             Press the mouse to reload the screen with new
             Hue and randomization of pixels.
 */
int beginColor = int (random(361));


void setup() {
  size (900, 400);
  colorMode(HSB, 360, 100, 100);    // HueSatBright, 360 degrees, 100%, 100%
}

void draw() {

  //color beginColor = color(int (random(361), 100, 100));  //creates some random color at full blast.
  noLoop();
  for (int xCounter = 0; xCounter < width; xCounter++)
  {
    int brightVal = 0;
    for (int yCounter = 0; yCounter < height; yCounter++)
    {
      if (brightVal >= 40)
      {
        brightVal = 0;
      }
      stroke(beginColor, int (random(101)), brightVal * 2.5);
      brightVal = int(random(101));
      point(xCounter, yCounter);
    }
  }
}

void mousePressed() {
  beginColor = int (random(361));
  redraw();
}


