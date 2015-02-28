

int numFrames = 4;
int frame = 0;
PImage[] images = new PImage[numFrames];
PImage b;

void setup()
{
  
  b = loadImage("enchtrees.jpg");
  
  size(500,500);
  frameRate(4);
  
  images[0] = loadImage("SD_anim0000.gif");
  images[1] = loadImage("SD_anim0001.gif");
  images[2] = loadImage("SD_anim0002.gif");
  images[3] = loadImage("SD_anim0003.gif");
  
}

void draw() { 
  image(b, 0, 0);
  
  frame = (frame+1) % numFrames;  
  image(images[frame], 0, 300);
  
  
  frame = (frame+10) % numFrames;  
  image(images[frame], 150, 270);
  
  
}

