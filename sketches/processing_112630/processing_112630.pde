
Sprite skull;

void setup()
{
  size(500, 500);
  skull = new Sprite("skull.jpg");
  skull.x = width/2;
  skull.y = width/2;
  
}

void draw()
{
  skull.render();
}




class Sprite
{
  float x;
  float y;
  float w;
  float h;
  PImage img;
  
  Sprite(String filename)
  {
    img = requestImage(filename);
    while (img.width > 0)
    {
      println("loading");
    }
    w = img.width;
    h = img.height;
  }
  
  void render()
  {
    //if (img.width > 0)
    {
      image(img, x, y, w, h);
    }
  }
}


