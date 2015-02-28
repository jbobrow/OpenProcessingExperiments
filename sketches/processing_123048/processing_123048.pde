
 PImage source;
int countR[] = new int[256];
int countG[] = new int[256];
int countB[] = new int[256];
void setup()
{
  
  PImage source = loadImage("PImage.png");

    
  source.loadPixels();
  for(int i=0 ; i<source.pixels.length ; i++)
  {
    color c = source.pixels[i];
    countR[int (red(c))]++;
    countG[int (green (c))]++;
    countB[int(blue(c))]++;
  }
  println(max(countR));
}
void histogram(int x, int y, int a, int b,
               int freq[], color bar)
{
  rect(x,y,a,b);
  for(int i=0 ; i<freq.length ;i++)
  {
    float px = map(i, 0,freq.length,x, x+a-1);
    float py = map(freq[i],0,255, y+1, y+b-1);
    line(px,b,px,py); 
    
  }
}

void draw(){
 histogram(0,0, 100,100, countR, color(255,0,0));
}
    




