
/* @pjs preload="dragon1.jpg, dragon2.jpg, dragon3.jpg, dragon4.jpg, dragon5.jpg, dragon6.jpg, dragon7.jpg, dragon8.jpg, dragon9.jpg, dragon10.jpg"; */

PImage[] myimages = new PImage[10];

int backgroundIndex = 0;
float timer = 0;

void setup()
{
  size(500, 500);
  frameRate(30);
  
  myimages[0] = loadImage("dragon1.jpg");
  myimages[1] = loadImage("dragon2.jpg");
  myimages[2] = loadImage("dragon3.jpg");
  myimages[3] = loadImage("dragon4.jpg");
  myimages[4] = loadImage("dragon5.jpg");
  myimages[5] = loadImage("dragon6.jpg");
  myimages[6] = loadImage("dragon7.jpg");
  myimages[7] = loadImage("dragon8.jpg");
  myimages[8] = loadImage("dragon9.jpg");
  myimages[9] = loadImage("dragon10.jpg");
}

void draw()
{
  background(255);
  timer = timer + 1.0 / 30.0;
  
  if (timer > 1)
  {
    backgroundIndex = backgroundIndex + 1;
    timer = 0;
    
  }
  if (backgroundIndex >= myimages.length)
  {
    backgroundIndex = 0;
  }
    image(myimages[backgroundIndex], 0, 0);
}

void keyReleased()
{
 if (key == 'r')
 {
  backgroundIndex = (int)random(0,9);
 }
 if (keyCode == LEFT)
 {
   backgroundIndex = backgroundIndex - 1;
 }
 if (keyCode == RIGHT)
 {
   backgroundIndex = backgroundIndex + 1;
 }
}



