
//Andy M CP 1 14/15

int x = 150;
int y = 150;
PImage a;
PImage b;
PImage c;

boolean start = true;

void setup ()
{
  size (500, 500);
  a = loadImage("http://i.imgur.com/bXi61.png");
  b = loadImage("http://i.imgur.com/NIrmN.jpg");
  c = loadImage("http://i.imgur.com/P8dS9.jpg");
}
 
void draw()
{
if (start == true)
  {
  background(255);
  image(c, 0, 0, 500, 500);
  }
if (mousePressed == true)
  {
    background(255);
    image(b,0,0,500,500);
    image(a, x, y, 160, 250);
    x = x + int(random(-3, 3));
    y = y + int(random(-3, 3));
  }
}
