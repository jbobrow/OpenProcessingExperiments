
float [] n;

float minVal;
float maxVal;

PFont font;

void setup() {
  size(600, 200);
  smooth();

  frameRate (30);

  font = createFont ("Arial", 14);
  textFont (font, 14);
  textAlign (CENTER, BOTTOM);

  setRandomValues ();
  setMinAndMaxVal ();
}


void draw()
{
  fill(#57385c, 120);
  noStroke();
  rect (0, 0, width, height);
  fill (#ffedbc);

  drawBar ();

  // Infor bar bottom

  fill (0, 50);
  noStroke();
  rect (10, height-10, width-20, -25);

  fill (255);
  String txt = "lowest bar value (red bar): " + str (round (minVal)) + ", highest bar value (violet bar): " + str (round (maxVal));
  text (txt, width/2, height-14);
}

void drawBar()
{
  int i = 0;

  float xSteps = (width-20- (n.length-1)*4) / (float) n.length;


  strokeWeight (2);
  while (i < n.length)
  {

    float rVal = n [i];
    rVal = map (rVal, minVal, maxVal, 20, height-55);

    float colorMapValue  = map (n [i], minVal, maxVal, 1, 0); 
    color c = lerpColor (#ffedbc, color (254, 190, 126), colorMapValue);

    if (n [i] == minVal) c = #A75265;

    if (n [i] == maxVal) 
    {
      stroke (255);
      c = #57385c;
    }
    else stroke (#A75265);

    fill (c);
    rect (10+i *xSteps + i*4, height-45, xSteps, -rVal);

    i = i+1;
  }
}



void setRandomValues ()
{
  int num = round (random (25, 60));
  n = new float [num];

  int i = 0;
  while (i < num)
  {
    n [i] = random (20, 1000);

    i = i + 1;
  }
}

void setMinAndMaxVal ()
{
  minVal = 10000000;  // starting values should always be bigger than anything you will find
  maxVal = 0;  // starting values should always be lower than anything you will find

  int i = 0;
  while (i < n.length)
  {

    float rVal = n [i];

    if (rVal < minVal )
    {
      minVal = rVal;
    }
    else if (rVal > maxVal)
    {
      maxVal = rVal;
    }
    i = i+1;
  }
}

void mousePressed ()
{
  setRandomValues ();
  setMinAndMaxVal ();
}

