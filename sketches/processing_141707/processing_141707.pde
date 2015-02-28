
PImage source;
int countR[] = new int[256];
int countG[] = new int[256];
int countB[] = new int[256];
 int data_start = 0;
  int data_length = 256;
  int l=10, r=265;
  int bottom=265, t=10;
  float freq[];
void setup()
{
  
  source=loadImage("PImage.png");
  source.loadPixels();
  for (int i=0;i<source.pixels.length;i++)
  {
    color c = source.pixels[i];
    countR[int(red(c))]++;
    countG[int(green(c))]++;
    countB[int(blue(c))]++;
  }
}

void histogram(int x, int y, int a, int b, int freq[], color bar)
{
  rect(x,y,a,b);
stroke(bar);

  for ( int q=0;q<freq.length;q++)
  {
    float point_x = map(q, 0, freq.length, x, x+a);
    float Pmax = max(freq);
    float Pmin = min(freq);
    float point_y = map(freq[q], Pmin, Pmax, y, y+b);
    line(point_x, y+b, point_x, point_y);
  }
}
void draw()
{
  histogram(0, 0, width, 30, countR, color(255, 0, 0));
  histogram(0, 30, width, 30, countG, color(0, 255, 0));
  histogram(0, 60, width, 30, countB, color(0, 0, 255));
}



