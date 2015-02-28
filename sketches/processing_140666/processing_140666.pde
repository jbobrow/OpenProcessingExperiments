
float timer = 10;
float balltimer = 0;
float ballx = 0;
float bally = 0;
float ballsize = 100;
float deoxysx = 0;
float deoxysy = 0;
float deoxyssize = 100;

int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;
int clickcount = 15;

PImage deoxys;
PImage masterball;
PImage winscreen;
PImage losescreen;
PImage microbackground;

void setup()
{
  size(500,500);
  textSize(50);
  frameRate(30);
  masterball = requestImage("masterball.png");
  winscreen = requestImage("winscreen.jpg");
  losescreen = requestImage("losescreen.jpg");
  deoxys = requestImage("deoxysfinal.jpg");
  microbackground = requestImage("microbackground.png");
  
}

void draw()
{
  if (gamestate == PLAY_STATE)
  {
    image(microbackground, 0, 0, width, height);
    timer = timer - (1.0 / 30.0);
    balltimer = balltimer + (1.0 /30.0);
    
    if (balltimer < .75)
    {
      if (ballx < width - ballsize)
      {
        ballx = ballx + (5 * balltimer);
      }
      if (bally > 0)
      {
        bally = bally - 2;
      }
      if (deoxysx < width - deoxyssize)
      {
        deoxysx = deoxysx + (5 * balltimer);
      }
      if (deoxysy > 0)
      {
        deoxysy = deoxysy - 3.0;
      }
    }
    else
    {
      if (ballx > 0)
      {
        ballx = ballx - 2;
      }
      if (bally < height - ballsize)
      {
        bally = bally + (5 * balltimer);
      }
      if (deoxysx > 0)
      {
        deoxysx = deoxysx - 2;
      }
      if (deoxysy < height - deoxyssize)
      {
        deoxysy = deoxysy + (5 * balltimer);
      }
    }
    
    if (balltimer > 1.5)
    {
      balltimer = 0;
      ballx = random(width - ballsize);
      bally = random(0, height - ballsize);
      deoxysx = random(width - deoxyssize);
      deoxysy = random(0, height - deoxyssize);
    }
    
    if (masterball.width > 0)
    {
      image(masterball, ballx, bally, ballsize, ballsize);
    }
    if (deoxys.width > 0)
    {
      image(deoxys, deoxysx, deoxysy, deoxyssize, deoxyssize);
    }
    
    else
    
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
    image(losescreen, 0, 0, width, height);
    textAlign(CENTER);
    fill(0);
    text("YOU LOSE!!! TRAIN MORE!!", 0, 0, width, 100);
  }
  if (gamestate == WIN_STATE)
  {
    image(winscreen, 0, 0, width, height);
    textAlign(CENTER);
    fill(0);
    text("YOU WIN!", 0, 0, width, 100);
  }
}
void mouseReleased()
{
  if (clickcount > 0)
  {
    if (mouseX > ballx
    && mouseY > bally
    && mouseX < (ballx + ballsize)
    && mouseY < (bally + ballsize))
    {
      clickcount = clickcount -1;
      ballsize = ballsize * 0.99;
    }
    if (mouseX > deoxysx
    && mouseY > deoxysy
    && mouseX < (deoxysx + deoxyssize)
    && mouseY < (deoxysy + deoxyssize))
    {
      clickcount = clickcount +1;
      deoxyssize = deoxyssize * 1.00;
    }
  }
}


