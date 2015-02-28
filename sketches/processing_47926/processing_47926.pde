
/*
    Another sketch by Dave Kay
     -cst003@rootofpi.org
     -12-08-11 (modified from earlier code)
 
     - creates interesting shifting patterns by randomly
     assigning a Hue to use and then randomizing each pixel's
     sat and brightness. then it'll increase the hue and continue
     along its merry path until it arrives at a hue above 360.
     and then its back to random city.
 */

/* Variables to be used throughout sketch */
int beginColor = int(random(360));

void setup() {
  size (500, 300);
  smooth();
  frameRate(300);
  beginColor = int(random(360));    
  colorMode(HSB, 360, 100, 100);    // HueSatBright, 360 degrees, 100%, 100%
}

void draw() {

  if (beginColor == 361) {
    beginColor =int(random(360));
  }

  //create an alpha blended background
  //slowly fades things into the background. lovely.
  fill(0, 1);
  rect(0, 0, width, height);

  for (int xCounter = 0; xCounter < width; xCounter++)
  {
    int brightVal = 0;
    for (int yCounter = 0; yCounter < height; yCounter++)
    {
      if (brightVal >= 40)
      {
        brightVal = 0;
      }
      stroke(beginColor, random(100), brightVal * 2.8);
      brightVal = int(random(101));
      point(xCounter, yCounter);
    }
  }
  //this will randomize, somewhat the variance of the hue
  int catcher = 10 % int(random(1,5)); 
  beginColor = beginColor + catcher;  
}

void mouseReleased() {
  beginColor = int (random(361));
}


