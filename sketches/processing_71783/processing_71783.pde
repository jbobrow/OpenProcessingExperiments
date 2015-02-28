

int x= 30;
int y = 30;
PImage img;
PImage pic;
void setup ()
{
  size(500,550);


}
void draw()
  {
    frameRate(500);
    if (mousePressed == true)
    {
      background(255,255,255);
    img = loadImage("spongebobjump.jpg");
    image(img,x,y,500,500);
    x= x+int(random(-7,7));
    y = y+int(random(-7,7));
    }
  }
void mouseReleased()
{
  background (255,255,255);
  pic = loadImage("Spongebob009.gif");
  image(pic,50,40);
}


  

