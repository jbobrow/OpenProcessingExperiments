
/* @pjs preload="flower1.png, flower2.png, flower3.png, flower4.png, bee1.png, bee2.png, bee6.png, bee4.png, bee5.png, background1.png, background 2.png, background3.png"; */
PImage[] myimg = new PImage [11];

int backgroundIndex = 0;

float timer = 15;

void setup ()
{
  size (500, 500);
  frameRate(30);
  myimg[0] = requestImage("background1.png");
  myimg[1] = requestImage("background 2.png");
  myimg[2] = requestImage("background3.png");
  myimg[3] = requestImage("flower1.png");
  myimg[4] = requestImage("flower2.png");
  myimg[5] = requestImage("flower3.png");
  myimg[6] = requestImage("bee1.png");
  myimg[7] = requestImage("bee2.png");
  myimg[8] = requestImage("bee6.png");
  myimg[9] = requestImage("bee4.png");
  myimg[10] = requestImage("bee5.png");
}

void draw()
{
  
  timer = timer + 1.0 / 30.0;
  
  if (timer > 1)
  {
    backgroundIndex = backgroundIndex + 1;
    timer = 0;
  }
  if (backgroundIndex >= myimg.length)
  {
    backgroundIndex = 0;
  }
  image(myimg[backgroundIndex], 0, 0);
 }




