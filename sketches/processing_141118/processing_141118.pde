
//copyright Yoon-ji Kim 2014
//51-257 A
// ICE 14

String [] colornames = {"cerulean", "crimson", "bayleaf", "teal", "lilac", "burntsienna", "cerise", "magenta", "fuschia", "pewter"};
float dX = 0;
float x = 50;

void setup()
{
  size(400, 400);
  frameRate(35);
}

void draw()
{
  background(0);
  dX += 1;
  for(int i = 0; i<colornames.length; i++)
  {
    text(colornames[i], x+dX, 30 + i*30);
    if(dX > width)
    {
      x = 50;
      dX = 0;
      text(colornames[i], x+dX, 30 + i*30);
    }     
  }
}


