
PImage src;
int freqR[] = new int[256];
int freqG[] = new int[256];
int freqB[] = new int[256];
int freqA[] = new int[256];

void setup()
{
  size(256,200);
  src = loadImage("fragmented.jpg");
  src.loadPixels();
  for (int i = 0; i < src.pixels.length; i++)
{ 
  color p = src.pixels[i];
  freqR[int(red(p))]++;
  freqG[int(green(p))]++;
  freqB[int(blue(p))]++;
  freqA[int(alpha(p))]++;
}
  float m[]={max(freqR),max(freqG),max(freqB)};
  print(max(m));
}


void histogram(int a, int b, int c, int d,
               int freq[], color bar)
{               
 for (int i = 0; i<freq.length; i++)
 {
  float px = map(i,0,freq.length,a,a+c);
  float py = map(freq[i],0,500,b+d,b);
  stroke(bar);
  line(px,py,px,b+d);
}
}

void draw()
{
  background(255);
  histogram(0,0,width,50,freqR,color(255,0,0,63));
  histogram(0,0,width,50,freqG,color(0,255,0,63));
  histogram(0,0,width,50,freqB,color(0,0,255,63));

  histogram(0,50,width,50,freqR,color(255,0,0));
  histogram(0,100,width,50,freqG,color(0,255,0));
  histogram(0,150,width,50,freqB,color(0,0,255));

}



