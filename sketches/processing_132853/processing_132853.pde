
int frames = 11;
int frame = 0;
PImage[] images = new PImage[frames];

void setup()
{
  size(387,270);
  frameRate(1);
  
  images[0] = loadImage("SLIDE1.png");
  images[1] = loadImage("SLIDE2.png");
  images[2] = loadImage("SLIDE2.png");
  images[3] = loadImage("SLIDE3.png");
  images[4] = loadImage("SLIDE4.png");
  images[5] = loadImage("SLIDE4.png");
  images[6] = loadImage("SLIDE5.png");
  images[7] = loadImage("SLIDE6.png");
  images[8] = loadImage("SLIDE7.png");
  images[9] = loadImage("SLIDE7.png");
  images[10] = loadImage("slide8.png");
}

void draw()
{
  background(255, 255, 0);
  frame = frame + 1;
  if(frame > frames)
  {
    frame = 0;
  }
  image(images[frame], 0, 0);
}


