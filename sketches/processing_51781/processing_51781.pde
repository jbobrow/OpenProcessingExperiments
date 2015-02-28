
int numFrames = 9;
PImage[] images = new PImage[numFrames];
int currentFrame = 0;


void setup()
{
  size (600,600);
  imageMode(CENTER);
  for(int i=0;i<images.length;i++)
  {
    String imageName = nf(i,1) + ".JPG";
    images[i] = loadImage(imageName);
  }
frameRate(1);
}

void draw()
{
  float x = random(0,500);
  float y = random (0,500);
  
  image(images[currentFrame],x,y,574,322);
  currentFrame++;
  if (currentFrame == images.length)
  {
    currentFrame = 0;
  }

  
  
  
  //float x = random(0,800);
  //float y = random(0,800);
  //float x1 = random(0,800);
  //float y1 = random(0,800);
  //image(img,x,y,x,y);
  //image(img2,x1,y1,x1,y1);
  //float all = random(0,9);
  //image(img,x,y,x,y);
}

