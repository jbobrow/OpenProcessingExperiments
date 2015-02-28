
PImage source;
int countR[] = new int[256];
int countG[] = new int[256];
int countB[] = new int[256];
void setup()
{
  size(256,200);
  source = loadImage("xpack1.jpg");
  source.loadPixels();
  println(source.pixels.length);
  for(int i=0 ; i<source.pixels.length ; i++)
  {
    color c = source.pixels[i];
    countR[int(red(c))]++;
    countG[int(green(c))]++;
    countB[int(blue(c))]++;
  }
  println(max(countR));
}
void histogram(int x, int y, int a, int b, int freq[], color bar)
{
 stroke(0);
 rect(x,y,a,b);
 stroke(bar);
 for(int i=0 ; i<freq.length ;i++)
 {
   float px = map(i,0,freq.length, x+1, x+a-1);
   float py = map(freq[i],0,1350,y+b-1,y+1);
   line( px, py, px, y+b-1);
}
}
void draw()
{
  histogram(0,0,width,60,countR,color(255,0,0,64));
  histogram(0,60,width,60,countG,color(0,255,0,64));
  histogram(0,120,width,60,countB,color(0,0,255,64));
}


