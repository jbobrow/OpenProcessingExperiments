
float timer =10;
float game1timer = 0;
float game2timer = 0;
float game1x =0;
float game2x=0;

float game1y =0;
float game2y =0;
float game1size=100;
float game2size=100;

int gamestate=0;
int PLAYSTATE =0;
int WINSTATE =1;
int LOSESTATE=2;
int Happiness =10;

PImage sadsonic;
PImage happysonic;
PImage losesonic;
PImage goodsonic;
PImage badsonic;

void setup()
{
  size(400,400);
  background(255);
  textSize(25);
  frameRate(30);
  sadsonic = requestImage("sadsonic.jpg");
  happysonic = requestImage("happysonic.jpg");
  losesonic = requestImage("losesonic.jpg");
  goodsonic = requestImage("sonic2.jpg");
  badsonic = requestImage("sonic2006.jpg");
}

void draw()
{
    if(gamestate == PLAYSTATE)
    {
  timer = timer -(1.0/30.0);
  game1timer= game1timer +(1.0/30.0);
  game2timer= game2timer +(1.0/30.0);
  image(sadsonic,0,0,width,height);
  fill(0);
  text("TIME: " +(int)timer,20,50);
  text("Happiness =" + Happiness,20,300);
  
  if (game1timer < .80)
  {
    if(game1x < width - game1size)
    {
      game1x = game1x +(5 * game1timer);
    }
    if(game1y >0)
    {
      game1y = game1y -2;
    }
  }
  else
  {
    if(game1x >0)
    {
      game1x = game1x -2;
    }
    if(game1x < height - game1timer)
    {
      game1y = game1y + (5 * game1timer);
    }
  }

    if(game1timer >1.75)
    {
      game1timer =0;
      game1x=random(width - game1size);
      game1y = random(0,height- game1size);
    }
    if(badsonic.width >0)
    {
      image(badsonic,game1x,game1y,game1size,game1size);
    }
     if (game2timer < .90)
  {
    if(game2x < width - game2size)
    {
      game2x = game2x +(5 * game2timer);
    }
    if(game2y >0)
    {
      game2y = game2y -2;
    }
  }
  else
  {
    if(game2x >0)
    {
      game2x = game2x -2;
    }
    if(game2x < height - game2timer)
    {
      game2y = game2y + (5 * game2timer);
    }
  }

    if(game2timer >1.75)
    {
      game2timer =0;
      game2x=random(width - game2size);
      game2y = random(0,height- game2size);
    }
    if(goodsonic.width >0)
    {
      image(goodsonic,game2x,game2y,game2size,game2size);
    }
    if(timer <0)
    {
      if(Happiness>=30)
      {
        gamestate = WINSTATE;
      }
      else
      {
        gamestate= LOSESTATE;
      }
    }
    }

if(Happiness<0)
{
  gamestate =LOSESTATE;
}
if(gamestate == LOSESTATE)
{
  image(losesonic,0,0,width,height);
  textAlign(CENTER);
 fill(0,0,255);
  text("Sonic is not in a good place.",0,0,width,100);
}
if(gamestate == WINSTATE)
{
 
  textAlign(CENTER);

  
  image(happysonic,0,0,width,height);
  text("Sonic is feeling way past cool!",0,0,width,100);
}
}
void mouseReleased()
{
  if(mouseX > game1x 
  && mouseY > game1y
  && mouseX <(game1x + game1size)
  && mouseY < (game1y + game1size))
  {
    Happiness = Happiness -1;
    game1size = game1size *1.05;
    fill(255,0,0);
    text("NOPE!!!",30,250);
  }
  if(mouseX> game2x
  && mouseY > game2y
  && mouseX <(game2x + game2size)
  && mouseY< (game2y + game2size))
  {
    Happiness = Happiness +1;
    game2size = game2size *0.975;
    fill(0,255,0);
    text("GREAT!",300,30);
  }
  
}


