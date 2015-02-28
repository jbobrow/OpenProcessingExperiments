
PImage source;
int countR[] = new int [256];
int countB[] = new int [256];
int countG[] = new int [256];
void setup()
{
  source = loadImage("PImage.png");
  
  source.loadPixels();
  for(int i=0 ; i<source.pixels.length ; i++)
  {
    color c = source.pixels[i];
    countR[int(red(c))]++;
    countB[int(blue(c))]++;
    countB[int(green(c))]++;
  }
}
void historgram(int x, int y, int a, int b, int freq[], color bar)
{
  rect(x,y,a,b);
  stroke(bar);
  for(int i=0; i<freq.length ;i++)
  {
    float px = map(i,0,freq.length,x+1,x+a-1);
    float py = map(freq[i],0,200,y+1,y+b-1);
    line(px,py,px,y+b-1);
  }
}
void draw()
{ 
  historgram(0,0,width,30,countR,color(255,0,0,64));
  historgram(0,0,width,30,countG,color(0,255,0,64));
  historgram(0,0,width,30,countB,color(0,0,255,64));
}


