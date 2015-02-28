
PImage scr;
int freqR[] = new int[256];
int freqG[] = new int[256];
int freqB[] = new int[256];
void setup()
{
  size(600,600);
  scr = loadImage("images.jpg");
  scr.loadPixels();
  for(int i=0 ; i<scr.pixels.length ; i++)
  {
    
    color p = scr.pixels[i];
    
    freqR[int(red(p))]++;
    freqG[int(green(p))]++;
    freqB[int(blue(p))]++;
  }
}

void histogram(int a, int b, int c, int d, int freq[], color bar)
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
  background(240);
  histogram(0,100,width,50,freqR,color(255, 0, 0, 63));
  histogram(0,100,width,50,freqG,color(0, 255, 0, 63));
  histogram(0,100,width,50,freqB,color(0, 0, 255, 63));  
  
  histogram(0,200,width,50,freqR,color(255, 0, 0, 63));
  histogram(0,300,width,50,freqG,color(0, 255, 0, 63));
  histogram(0,400,width,50,freqB,color(0, 0, 255, 63));
}
  


