
float timer = 10;
float bombtimer = 0;
float bombx = 0;
float bomby = 0;
float bombsize = 100;
float matchesx = 0;
float matchesy = 0;
float matchessize = 100;
  
int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;
int clickcount = 15;
  
PImage bomb;
PImage matches;
PImage forest;
PImage losescreen;
PImage winscreen;
  
void setup()
{
  size(500, 500);
  textSize(50);
  frameRate(30);
  bomb = requestImage("bomb.jpg");
  matches = requestImage("matches.jpg");
  forest = requestImage("forest.jpg");
  losescreen = requestImage("losescreen.jpg");
  winscreen = requestImage("winscreen.jpg");
}
  
void draw()
{
  if (gamestate == PLAY_STATE)
  {
  image(forest, 0, 0, width, height);
  timer = timer - (1.0 / 30.0);
  bombtimer = bombtimer + (1.0 / 30.0);      
    if (bombtimer < .75)
    {
      if (bombx < width - bombsize)
      {
      bombx = bombx + (5 * bombtimer);
      }
        if (bomby > 0)
        {
        bomby = bomby - 2;
        }
          if (matchesx < width - matchessize)
          {
          matchesx = matchesx + (5 * bombtimer);
          }
            if (matchesy > 0)
            {
            matchesy = matchesy - 3.0;
             }
    }
    else
    {
      if (bombx > 0)
      {
      bombx = bombx - 2;
      }
        if (bomby < height - bombsize)
        {
        bomby = bomby + (5 * bombtimer);
        }
          if (matchesx > 0)
          {
          matchesx = matchesx - 2;
          }
            if (matchesy < height - matchessize)
             {
             matchesy = matchesy + (5 * bombtimer);
             }
    }
    if (bombtimer > 1.5)
    {
     bombtimer = 0;
     bombx = random(width - bombsize);
     bomby = random(0, height - bombsize);
     matchesx = random(width - matchessize);
     matchesy = random(0, height - matchessize);
     }    
      if (bomb.width > 0)
      {
      image(bomb, bombx, bomby, bombsize, bombsize);
      }
        if (matches.width > 0)
        {
        image(matches, matchesx, matchesy, matchessize, matchessize);
        }
        text("TIME: " + (int)timer, 300, 300);
        text("POINTS: " + clickcount, 200, 400);
    
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
     image(losescreen, 0, 0, width, height);
     textAlign(CENTER);
     text("You've lost.", 0, 0, width, 100);
     }
      if (gamestate == WIN_STATE)
      {
      image(winscreen, 0, 0, width, height);
      textAlign(CENTER);
      text("You've won!", 0, 200, width, 100);
      }
}
  
void mouseReleased()
{
  if (clickcount > 0)
  {
    if (mouseX > bombx
    && mouseY > bomby
    && mouseX < (bombx + bombsize)
    && mouseY < (bomby + bombsize))
    {
    clickcount = clickcount - 1;
    bombsize = bombsize * 0.95;
    }
      if (mouseX > matchesx
      && mouseY > matchesy
      && mouseX < (matchesx + matchessize)
      && mouseY < (matchesy + matchessize))
      {
      clickcount = clickcount + 1;
      matchessize = matchessize * 1.05;
      }
  }
}



