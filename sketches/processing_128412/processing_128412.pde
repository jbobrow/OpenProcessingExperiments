
/*@ pjs preload="fstImage.jpg, theBird.jpg, whale.jpg";*/

PImage fstImage;
PImage theBird;
PImage Whale;
float noiseScale=0.02;

void setup()
{
  size(500,500);
  fstImage = requestImage("download.jpg");
  theBird = loadImage("bird.jpg");
  Whale= loadImage("killerwhale.jpg");
  theBird.filter(INVERT);
  Whale.filter(INVERT);
}

void draw()
{
  if (fstImage.width > 0);
  {
    image(fstImage,0,0,width,height);
  }
  image(theBird,400,200,100,100);
  image(Whale,0,200,100,100);
  for (int x= 0; x < width; x+=20)
  {
    stroke(0,200,150);
    line(x,0,x,height);
  }
  for (int y=0; y<height; y+=20)
  {
    stroke(255,0,70);
    line(0,y,width,y);
  }
  for (int x=100;x<400;x++)
  {
    float noiseVal= noise((100+x)*noiseScale,150*noiseScale);
    stroke(noiseVal*255,255,0);
    line(x,200+noiseVal*80,x,230);
  }
}



