
PImage src;
int freqR[] = new int[256];
int freqG[] = new int[256];
int freqB[] = new int[256];
int freqA[] = new int[256];

void setup()
{
  size(700,400);
  src = loadImage("shen.jpg");
  src.loadPixels();
  for(int i=0 ; i<src.pixels.length ; i++)
  {
    color p = src.pixels[i];
    
    freqR[int(red(p))]++;
    freqG[int(green(p))]++;
    freqB[int(blue(p))]++;
  }
}

void histogram(int a, int b, int c, int d,
               int freq[], color bar)
{
  for(int i=0 ; i<freq.length ; i++)
  {
    float px = map(i,0,freq.length,a,a+c);
    float py = map(freq[i],0,300,b+d,b);
    stroke(bar);
    line(px,py,px,b+d);
  }
}

void draw()
{
  background(204);
  histogram(0,0,width,height,freqR,color(255,0,0,180));
  histogram(0,0,width,height,freqG,color(0,255,0,180));
  histogram(0,0,width,height,freqB,color(0,0,255,180));
}


