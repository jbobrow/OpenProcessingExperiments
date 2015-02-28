
PImage[] images = new PImage[9];
PImage img = new PImage();
float x;
float y;
int r;

void setup()
{
  size(640,480);
  for (int i = 0; i < images.length; i ++)
   {
    images[i] = loadImage( i +".jpg");
   }
   for(int i=0; i  < images.length; i ++)
   {
   images[i].resize(640,480);
   }
   background(images[0]); 
}
void draw()
{
  if(mousePressed)
  {
    for(int count = 0;count<20;count ++)
    {
      r=int(random(9));
      image(images[r],0,0);
    }
  }
}


