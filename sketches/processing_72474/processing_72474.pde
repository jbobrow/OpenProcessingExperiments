
//Winston L.,CP1,Mods 4/5, RandomWalk
//http://www.openprocessing.org/sketch/72474

boolean ismoving=false;
boolean pause=true;
int a=125;
int b=262;
int c=0;
int d=0;
int e=0;
int f=0;
int g=0;
int h=-3;
int x=0;
int y=0;
//PImage hair;
void setup()
{
  size(500, 500);
  //hair = loadImage("hair.JPG");
  frameRate(10);
}
void draw()
{
  textSize(30);
  text("Press Any Key to Start", 90, 250);
  if (ismoving==true)
  {
    a=a+int(random(d, c));
    b=b+int(random(c, d));
    c=c-3;
    d=d+3;
    background(255);
    fill(e, f, g);
    stroke(e, f, g);
    e=int (random(0, 256));
    f=int (random(0, 256));
    g=int (random(0, 256));
    ellipse(a, b, 50, 50);
    stroke(0);
    fill(e, f, g);
    strokeWeight(3);
    //image(hair, 45, 188, 50, 50);
    ellipse(75, 240, 25, 25);
    line(75, 252, 75, 280);
    line(75, 280, 60, 300);
    line(75, 280, 100, 300);
    line(75, 262, 100, 252);
    line(75, 262, 100, 272);

    if (a>500)
    {
      a=a+h;
      h=-383;
      b=270;
      c=0;
      d=0;
    }
    if (b<0)
    {
      b=238;
    }
    if (b>500)
    {
      b=238;
    }
  }
}
void keyPressed()
{
  ismoving=!ismoving;
}

