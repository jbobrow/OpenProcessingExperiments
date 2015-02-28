
float timer = 10;
float squaretimer = 0;
float squarex = 0;
float squarey = 0;
float squaresize = 100;

int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;
int clickcount = 30;

PImage smile;

void setup()
{
  size(500, 500);
  textSize(50);
  frameRate(30);
  smile = requestImage("smile.png");
}

void draw()
{
  if (gamestate == PLAY_STATE)
  {
    background(255);
    timer = timer - (1.0 / 30.0);
    squaretimer = squaretimer + (1.0 / 30.0);
    
    if (squaretimer < .75)
    {
      if (squarex < width - squaresize)
      {
        squarex = squarex + (5 * squaretimer);
      }
      if (squarey > 0)
      {
        squarey = squarey - 2;
      }
    }
    else
    {
      if (squarex > 0)
      {
        squarex = squarex - 2;
      }
      if (squarey < height - squaresize)
      {
        squarey = squarey + (5 * squaretimer);
      }
    }
    
    // randomly change square position every 1.5 seconds
    if (squaretimer > 1.5)
    {
      squaretimer = 0;
      squarex = random(width - squaresize);
      squarey = random(0, height - squaresize);
    }
    
    //fill(random(255), random(255), random(255));
    //rect(squarex, squarey, squaresize, squaresize);
    if (smile.width > 0)
    {
      image(smile, squarex, squarey, squaresize, squaresize);
    }
    
    fill(0);
    text("TIME: " + (int)timer, 200, 200);
    text("CLICKS: " + clickcount, 200, 400);
  
    if (timer < 0)
    {
      if (clickcount <= 0)
      {
        gamestate = WIN_STATE;
      }
      else
      {
        gamestate = LOSE_STATE;
      }
    }
  }
  if (gamestate == LOSE_STATE)
  {
      background(255, 0, 0);
      textAlign(CENTER);
      text("YOU LOST SUCKA!!!", 0, 0, width, 100);
  }
  if (gamestate == WIN_STATE)
  {
      background(0, 255, 0);
      textAlign(CENTER);
      text("YOU WON PLAYA!!!", 0, 0, width, 100);
  }
}

void mouseReleased()
{
  if (clickcount > 0)
  {
    if (mouseX > squarex 
      && mouseY > squarey 
      && mouseX < (squarex + squaresize)
      && mouseY < (squarey + squaresize))
    {
      clickcount = clickcount - 1;
      squaresize = squaresize * 0.95;
    }
  }
}


