
//Justin J. Walking Penguin, CP1 Mods 16/17
int x=60;
int y=60;
int v=60;
int w=60;
PImage Penguin;
PImage TickledPenguin;
PImage PenguinsFish;
void setup()
{
  background(28, 216, 190);
  size(500, 500);
  Penguin=loadImage("http://justinsprogrammingsite.webs.com/Penguin.jpg");
  TickledPenguin=loadImage("http://justinsprogrammingsite.webs.com/TickledPenguin.jpg");
  PenguinsFish=loadImage("http://justinsprogrammingsite.webs.com/PenguinsFish.jpg");
}
void draw()
{
  image(Penguin, x, y, 400, 356);
  if (mousePressed==true)
  {
    background(28, 216, 190);
    image(TickledPenguin, x, y, 356, 389);
    image(PenguinsFish, 360+v, 360+w, 58, 23);
    int direction = int(random(4));
    int fishDirection=int(random(4));
    if (direction ==0)
    {
      x=x-1; //left
    }
    else if (direction ==1)
    {
      x=x+1; //right
    }
    else if (direction==2)
    {
      y=y-1; //up
    }
    else //direction == 3
    {
      y=y+1; //down
    }
    if (fishDirection==0)
    {
      v=v-1; //left
    }
    else if (fishDirection ==1)
    {
      v=v+1; //right
    }
    else if (fishDirection==2)
    {
      w=w-1; //up
    }
    else //fishDirection == 3
    {
      w=w+1; //down
    }
  }
  else
  {
    background(28, 216, 190);
    image(Penguin, x, y, 400, 356);
  }
}
/* To make the penguin do a random walk,<br>
 tickle it by holding down any mouse button.<br>
 */
