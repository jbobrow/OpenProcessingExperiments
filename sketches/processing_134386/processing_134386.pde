
float timer = 10;
float game1timer = 0;
float game1x = 0;
float game1y = 0;
float game1size = 100;
float game2timer = 0;
float game2x = 0;
float game2y = 0;
float game2size = 100;


int gamestate = 0;
int PLAYSTATE = 0;
int WINSTATE = 1;
int LOSESTATE = 2;
int Souls = 0;

PImage HORSIE;
PImage WINNING;
PImage Horse;
PImage LOSE;
PImage WON;

void setup()
{
  size(500,500);
  background(255);
  textSize(25);
  frameRate(30);
  
  HORSIE = requestImage("HORSIE.jpg");
  WINNING = requestImage("WINNING.png");
  Horse = requestImage("Horse.png");
  LOSE = requestImage("LOSE.jpg");
  WON = requestImage("WON.jpg");
}



void draw()
{
 if(gamestate == PLAYSTATE)
 {
  timer = timer -(1.0/30.0);
  game1timer= game1timer +(1.0/30.0);
  game2timer= game2timer +(1.0/30.0);
  image(HORSIE,0,0,width,height);
  fill(0);
  text("TIME: " +(int)timer,20,50);
  text("Souls =" + Souls,20,300);
   
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
    if(Horse.width >0)
    {
      image(Horse,game1x,game1y,game1size,game1size);
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
    if(WINNING.width >0)
    {
      image(WINNING,game2x,game2y,game2size,game2size);
    }
    if(timer <0)
    {
      if(Souls>=25)
      {
        gamestate = WINSTATE;
      }
      else
      {
        gamestate= LOSESTATE;
      }
    }
    }
 
if(Souls<0)
{
  gamestate =LOSESTATE;
}
if(gamestate == LOSESTATE)
{
  image(LOSE,0,0,width,height);
  textAlign(CENTER);
 fill(0,0,255);
  text("YOUR SOUL IS LOST IN THE EYE OF A HORSE.",0,0,width,100);
}
if(gamestate == WINSTATE)
{
  
  textAlign(CENTER);
 
   
  image(WON,0,0,width,height);
  fill(0,0,255);
  text("WINNING STRATEGY.",0,0,width,100);
}
}
void mouseReleased()
{
  if(mouseX > game1x
  && mouseY > game1y
  && mouseX <(game1x + game1size)
  && mouseY < (game1y + game1size))
  {
    Souls = Souls -1;
    game1size = game1size *1.05;
    fill(255,0,0);
    text("VOID",30,250);
  }
  if(mouseX> game2x
  && mouseY > game2y
  && mouseX <(game2x + game2size)
  && mouseY< (game2y + game2size))
  {
    Souls = Souls +1;
    game2size = game2size *0.975;
    fill(0,255,0);
    text("WHISPER",300,30);
  }
   
}


