
int numimages = 12;
int time = 0;
PImage images[] = new PImage[numimages];

void setup()
{
  size(640,480);
  background(0);
  smooth();
  for(int i = 0; i < numimages; i++)
  {
    images[i] = loadImage(i + ".jpg");
  }
  frameRate(3);
}

void draw()
{
  for(int i = 50; i < width - 50; i+=50)
  {
    for(int j = 50; j < height - 50; j+=50)
    {
      image(images[int(random(0,numimages - 1))], i,j,50,50);
    }
  }
}


