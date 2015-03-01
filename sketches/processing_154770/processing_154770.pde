
float noiseScale = 80.0;
float [] [] n;
int steps = 6;

float minVal;
float maxVal;

PFont font;

void setup() {
  size(600, 200);
  smooth();

  frameRate (30);

  font = createFont ("Arial", 14);
  textFont (font, 14);
  textAlign (CENTER, TOP);

  setNoise (80);
  setMinAndMaxVal ();
}


void draw()
{
  fill(#57385c, 120);
  noStroke();
  rect (0, 0, width, height);
  fill (#ffedbc);

  // noise --------------

  drawNoise();
  drawContrastNoise();

  // Info boxes ---------------
  textLeading (7 + 14);
  
  // LEFT

  String txtLEFT = "values of noise()\n lowest value: " + str (round (minVal)) + "\nhighest value: " + str (round (maxVal));

  fill (#57385c, 200);
  rect (width/4 - textWidth (txtLEFT)/2-10, 50, textWidth (txtLEFT) + 20, 14*5);

  fill (255);
  text (txtLEFT, width/4, 55);

  // RIGHT
  String txtRIGHT = "high contrast noise\n lowest value: " + str (0) + "\nhighest value: " + str (255);

  fill (#57385c, 200);
  rect (width*3/4 - textWidth (txtRIGHT)/2-10, 50, textWidth (txtRIGHT) + 20, 14*5);

  fill (255);
  text (txtRIGHT, width*3/4, 55);
}

void drawNoise ()
{
  int i = 0;
  while (i < n.length)
  {
    int j = 0;

    while (j < n[i].length)
    {
      float noiseVal = n [i] [j];

      fill (#ffedbc, noiseVal);
      rect (i *steps, j*steps, steps, steps);
      j = j+1;
    }
    i = i+1;
  }
}

void drawContrastNoise ()
{
  int i = 0;
  while (i < n.length)
  {
    int j = 0;

    while (j < n[i].length)
    {
      float noiseVal = n [i] [j];
      noiseVal = map (noiseVal, minVal, maxVal, 0, 255);

      fill (#ffedbc, noiseVal);
      rect (width/2 + i *steps, j*steps, steps, steps);
      j = j+1;
    }
    i = i+1;
  }
}

void setNoise (float noiseScale)
{
  n = new float [0] [0];

  int x = 0;
  while (x < width/2)
  {
    int y = 0;

    float [] nval = new float [0];

    while (y < height)
    {
      float noiseVal = noise (x / noiseScale, y / noiseScale, frameCount / noiseScale )*255;

      nval = (float []) append (nval, noiseVal);
      y = y + steps;
    }

    n = (float [] []) append (n, nval);
    x = x + steps;
  }
}

void setMinAndMaxVal ()
{
  minVal = 255;  // starting values should always be bigger than anything you will find
  maxVal = 0;  // starting values should always be lower than anything you will find

  int i = 0;
  while (i < n.length)
  {
    int j = 0;

    while (j < n[i].length)
    {
      float noiseVal = n [i] [j];

      if (noiseVal < minVal )
      {
        minVal = noiseVal;
      }
      else if (noiseVal > maxVal)
      {
        maxVal = noiseVal;
      }
      j = j+1;
    }
    i = i+1;
  }
}

void mousePressed ()
{
  setNoise (80);
  setMinAndMaxVal ();
}

