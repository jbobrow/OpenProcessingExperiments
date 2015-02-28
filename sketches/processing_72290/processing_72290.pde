
//Brandan H. computer programming, programming
int x=75;
int y=75;
PImage troll;
void setup()
{
  size(600, 600);
  troll = loadImage("http://s3.amazonaws.com/kym-assets/photos/images/original/000/125/306/wario-troll-face.jpg?1305992120");
  background(135);
  image (troll, x, y, 300, 300);
}
void draw()
{
  if (mousePressed==false)
  {
    background(135);
    image(troll, x, y, 150, 150);
    x=x+int(random(-500, 500));
    if (x<0)
    {
      x=0;
    }
    if (x>600)
    {
      x=300;
    }
    y=y+int(random(-500, 500));
    if (y<0)
    {
      y=0;
    }
    if (y>600)
    {
      y=300;
    }
    fill(0);
    textSize (50);
    text("U Mad Bro?", 275, 300);
    noFill();
  }
}
