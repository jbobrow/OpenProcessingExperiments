
PImage source;
int[] countR = new int[256];
int[] countG = new int[256];
int[] countB = new int[256];

void setup()
{
  size(255, 600);
  countR = new int[256];
  countG = new int[256];
  countB = new int[256];
  source = loadImage("alpaca.jpg");
  source.loadPixels();
  print(source.pixels.length);
    for(int n=0;n<256;n++){countR[n]=0;}
  for (int i = 0; i < source.pixels.length; i++)
  {
    //Gets the pixel.
    color c = source.pixels[i];
    //Gets the colour values from that pixel.
    countR[int(red(c))]++;
    countG[int(green(c))]++;
    countB[int(blue(c))]++;
  }
  countR[0] = 0;
  countG[0] = 0;
  countB[0] = 0;
}


void histogram(int X, int Y, int h, int freq[], color colour)
{
  Y = 600 - Y;
  stroke(colour);
  for (int i = 0; i < 256; i++)
  {
    line(i, Y, i, Y -(freq[i] * h) / Max(freq));
  }
}

int Max(int freq[])
{
  int m = 0;
  for (int i = 0; i < freq.length; i++)
  {
    if (freq[i] > m)
      m = freq[i];
  }
  return m;
}

void draw()
{
  //Draws the blue histogram.
  histogram(0, 400, 200, countB, color(0, 0, 255));
  //Draws the green histogram.
  histogram(0, 200, 200, countG, color(0, 255, 0));
  //Draws the red histogram.
  histogram(0, 0, 200, countR, color(255, 0, 0));
}

