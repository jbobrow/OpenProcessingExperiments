
PImage source;
int countR[] = new int[256];
int countG[] = new int[256];
int countB[] = new int[256];
void setup()
{
  size(800, 600);
  source = loadImage("rubber-duck.jpg");

  source.loadPixels();
  for (int i=0 ; i<source.pixels.length ; i++)
  {
    color c = source.pixels[i];
    countR[int(red(c))]++;
    countG[int(green(c))]++;
    countB[int(blue(c))]++;
  }
  println(max(countR));
  println(max(countG));
  println(max(countB));
}
void histogram(int x, int y, int a, int b, int freq[], color v)
{
  
  stroke(v);
  for (int i=0 ; i< 256 ; i++)
  {
    float px = map(i, 0, freq.length, x+1, x+a-1);
    float py = map(freq[i], 0, 200, y+1, y+b-1);
    line(px,py,px,y+b-1);
  }
}
void draw()
{
  histogram(0, 0, width, 30, countR, color(255, 0, 0));
  histogram(0, 0, width, 30, countB, color(0, 0, 255));
  histogram(0, 0, width, 30, countG, color(0, 255, 0));
}



