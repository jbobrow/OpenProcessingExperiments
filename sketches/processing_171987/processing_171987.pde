
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/32892*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
PImage[] images = new PImage[9];
PImage img = new PImage();
float x;
float y;
int i;

void setup()
{
  size(640,480);
  for (int i = 0; i < images.length; i ++)
   {
    images[i] = loadImage( i +".JPG");
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
      image(images[i],0,0);
      i = (i + 1) % images.length;
    }
  }
}


