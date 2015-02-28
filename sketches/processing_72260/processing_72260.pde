
// Hayley G, CP1, mods 14/15

int x = 200;
int y = 100;
int x1 = 20;
int y1 = 30;
PImage quidditch;
PImage snitch;
void setup ()
{
  size(800, 500);
  quidditch = loadImage ("http://static8.businessinsider.com/image/4e2073c449e2ae1f59130000/harry-potter-quidditch.jpg");
  snitch = loadImage ("http://news.bbc.co.uk/olmedia/1575000/images/_1575314_potter8.jpg");
}

void draw ()
{
  background(0);
  image (quidditch, x, y, 400, 300);
  image (snitch,x1,y1,130,87);
  if (mousePressed==true)
  {
    image (quidditch, x, y, 400, 300);
    x = mouseX + int(random(-2,2));
    y = mouseY + int(random(-4,4));
    image (snitch,x1,y1,130,87);
    x1 = int(random(-800,800));
    y1 = int(random(-500,500));  
  }
}  

void mouseReleased ()
{
  image(snitch,x1,y1,130,87);
}
