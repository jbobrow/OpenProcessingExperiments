
/* @pjs globalKeyEvents="true"; */
PImage bunny;
PImage carrot;
PImage meme;
PImage bunnyCarrot;
PImage bunnyBox;
PImage meme2;
int x = 250;
int y = 250;
int a = 0;
int b = 0;
int c = int(random(-21,21));
int d = int(random(-21,21));
int horizontal;
int vertical;
int move;
int time = 0;
void setup()
{
  size(500, 500);
  bunny = loadImage("http://voidspot.webs.com/Bunny.gif");
  carrot = loadImage("http://voidspot.webs.com/Carrot.gif");
  meme = loadImage("http://voidspot.webs.com/bunnyMeme.jpg");
  bunnyCarrot = loadImage("http://voidspot.webs.com/CarrotBunny.jpg");
  bunnyBox = loadImage("http://voidspot.webs.com/bunnybox.jpg");
  meme2 = loadImage("http://voidspot.webs.com/carrotmeme.jpg");
  frameRate(10);
}
void draw()
{
  time = time + 1;
  if (horizontal == x && vertical == y)
  {
    finish();
  }
  else if (time > 500)
  {
     fail();
   }
  else if (time > 100)
  {
    crazy();
    carrot();
    bunny();
  }
  else
  {
    image(meme2,0,0,500,500);
    carrot();
    bunny();
  }
}
void carrot()
{
  rect(x, y, 104.7, 103.5);
  image(carrot,x,y,104.7,103.5);
  move = int(random(1, 5));
  if (move == 1)
  {
    x = x+25;
  }
  else if (move == 2)
  {
    x = x - 25;
  }
  else if (move == 3)
  {
    y = y + 25;
  }
  else if (move == 4)
  {
    y = y - 25;
  }
  if (x > 400)
  {
    x = x - 50;
  }
  if (x < 50)
  {
    x = x + 50;
  }
  if (y > 400)
  {
    y = y - 50;
  }
  if (y < 50)
  {
    y = y + 50;
  }
}
void bunny()
{
  image(bunny,horizontal,vertical,33,49);
  if (keyPressed)
  {
    if (keyCode == UP)
    {
      vertical = vertical - 15;
    }
    if (keyCode == DOWN)
    {
      vertical = vertical + 15;
    }
    if (keyCode == RIGHT)
    {
      horizontal = horizontal + 15;
    }
    if (keyCode == LEFT)
    {
      horizontal = horizontal - 15;
    }
  }
  if (vertical < 0)
  {
    vertical = vertical + 20;
  }
  if (vertical > 451)
  {
    vertical = vertical - 20;
  }
  if (horizontal < 0)
  {
    horizontal = horizontal + 20;
  }
  if (horizontal > 467)
  {
    horizontal = horizontal - 20;
  }
}
void crazy()
{
  image(meme, 0, 0, 500, 500);
  if (move == 1)
  {
    x = x + 30;
  }
  else if (move ==2)
  {
    x = x - 30;
  }
  else if (move ==3)
  {
    y = y + 30;
  }
  else if (move == 4)
  {
    y = y - 30;
  }
}
void finish()
{
  image(bunnyCarrot, 0, 0, 500, 500);
}
void fail()
{
  image(bunnyBox,0,0,500,500);
}
