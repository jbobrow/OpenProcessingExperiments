
float timer = 0;
PImage book;
PImage intro;
PImage ugly;
PImage sougly;
PImage everyone;
PImage died;
PImage end;
PImage nope;

void setup()
{
  size(500,500);
  book = requestImage("book.jpg");
 intro = requestImage("Intro Screen.png");
 ugly = requestImage("The ugly barnacle.jpg");
  sougly = requestImage("so ugly.jpg");
  everyone = requestImage("Everyone.jpg");
 died = requestImage("Everyone died.jpg");
 end = requestImage("The end.jpg");
  nope = requestImage("That didn't help at all.jpg");
  frameRate(30);
}

void draw()
{
  timer = timer + 1;
  if (timer > 0)
  {
    image(book,0,0, 500,500);
  }
  if (timer > 60)
  {
    image(intro,0,0,500,500);
  }
  if (timer > 120)
  {
    image(ugly,0,0,500,500);
  }
  if (timer > 180)
  {
    image(sougly,0,0,500,500);
  }
  
  if (timer > 240)
  {
    image(everyone,0,0,500,500);
  }
  if(timer > 300)
  {
    image(died,0,0,500,500);
  }
  if(timer > 360)
  {
    image(end,0,0,500,500);
  }
  if(timer > 420)
  {
    image(nope,0,0,500,500);
  }
  if(timer > 480)
  {
    timer = 0;
  }
}
    


