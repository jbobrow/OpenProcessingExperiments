
//Winston L, Hundreds :), CP1, Mods 4-5
//http://www.openprocessing.org/sketch/74567

int a=0;
int b=0;
int c=0;
int e=0;
int f=0;
int g=0;

void setup()
{
  size(500, 500);
  background(255);
  frameRate(5);
}

void draw()
{
  background(a,b,c);
  int Start=1;
  while (Start<=101)
  {
    fill(g, e, f, 105);
    stroke(e, f, g, 105);
    int sx=int(random(20, 480));
    int sy=int(random(20, 480));
    int ex=int(random(20, 480));
    int ey=int(random(20, 480));
    //square
    fill(e, f, g, 100);
    strokeWeight(3);
    stroke(g, e, f, 100);
    rect(int(random(20, 480)), int(random(20, 480)), 20, 20);
    //ellipse
    fill(e, f, g, 105);
    strokeWeight(1);
    stroke(e, f, g, 100);
    ellipse(int(random(20, 480)), int(random(20, 480)), 20, 20);
    e=int(random(256));
    f=int(random(256));
    g=int(random(256));
    Start=Start+1;
  }
}
void keyPressed()
{
  background(a,b,c);
  a=int(random(256));
  b=int(random(256));
  c=int(random(256));
}
void mouseClicked()
{ 
  background(a,b,c);
  a=int(random(256));
  b=int(random(256));
  c=int(random(256));
}
