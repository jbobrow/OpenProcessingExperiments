
/*
Pop the Bubble
Click the bubbles to pop them.
Made by: David Y. Stephanie T. Jimmy L.
 */
int screenNumber = 0;
int time = 900;
int g = time;
int m;
float r = random(60,90);
int score;
PImage pic2;
PImage pic4;
PImage pic5;
PFont font;
bubble[] a;
void setup()
{
  frameRate(30);
  background(0);
  size(500,500);
  noStroke();
  pic2 = loadImage("pic2.gif");
  pic4 = loadImage("pic4.gif");
  pic5 = loadImage("pic5.gif");
  font = loadFont("CourierNewPSMT-16.vlw");
  a = new bubble[80];
  for(int i=0; i<a.length; i++)
  { 
    a[i] = new bubble();
    a[i].x = (i*50)+25;
    a[i].y = 25;
    a[i].c = color(255);
  }
}

void draw()
{
  background(0);
  if(screenNumber == 0)
  {
    titleScreen();
  }
  if(screenNumber == 1)
  {
    drawBubbles();
    score();
    time();
  }
  if(screenNumber == 2)
  {
    endScreen();
    restart();
  }
}

class bubble
{
  int x,y;
  color c;

  void show()
  {
    fill(c);
    ellipse(x,y,50,50);
  }
}



