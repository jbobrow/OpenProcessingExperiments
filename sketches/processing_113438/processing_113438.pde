
SpriteObject main;
 
void setup()
{
  size(700, 500);
  main = new SpriteObject("Windows.png");
  background(58,110,165);
 
}
 
void draw()
{
  noCursor();
  main.rendermain();
}
 
 
class SpriteObject
{
  PImage img;
  boolean loaded = false;
   
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
   
  void rendermain()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
    }
     
    if (loaded)
    {
      pushMatrix();
      translate(0,0);
      image(this.img, mouseX - 150, mouseY - 75, 300, 150);
      popMatrix();
    }
  }
}



