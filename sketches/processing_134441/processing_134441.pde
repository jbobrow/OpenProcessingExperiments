
//credit to the in-class tutorial
//inspiration comes from thirst

PImage RC;
PImage coke;
PImage pepsi;
PImage miku;
PImage bgimg;


float timer = 10;
float squaretimer = 0;
float squarex = 0;
float squarey = 0;
float squaresize = 100;

float squarex2 = 0;
float squarey2 = 0;
float squaresize2 = 100;

int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;
int scorecounter = 10;



void setup()
{
  size(900, 900);
  textSize(50);
  frameRate(30);
  miku = requestImage("miku1.png");
  RC = requestImage("Rccolauslogo.jpg");
  coke = requestImage("coke.png");
  pepsi = requestImage("pepsi.png");
  bgimg = requestImage("nuka_cola_poster.png");
}

void draw()
{

  if (gamestate == PLAY_STATE)
  {
    background(255);
    image(bgimg, 0, 0, width, height);



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
      if (squarex2 < width - squaresize)
      {
        squarex2 = squarex2 + (5 * squaretimer);
      }
      if (squarey2 > 0)
      {
        squarey2 = squarey2 - 2;
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
      if (squarex2 > 0)
      {
        squarex2 = squarex2 - 2;
      }
      if (squarey2 < height - squaresize)
      {
        squarey2 = squarey2 + (5 * squaretimer);
      }
    }

    // randomly change square position every 2 seconds
    if (squaretimer > 2)
    {
      squaretimer = 0;
      squarex = random(width - squaresize);
      squarey = random(0, height - squaresize);
      squarex2 = random(width - squaresize);
      squarey2 = random(0, height - squaresize);
    }


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
      if (squarex2 < width - squaresize)
      {
        squarex2 = squarex2 + (5 * squaretimer);
      }
      if (squarey2 > 0)
      {
        squarey2 = squarey2 - 2;
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

      if (squarex2 > 0)
      {
        squarex2 = squarex2 - 2;
      }
      if (squarey2 < height - squaresize)
      {
        squarey2 = squarey2 + (5 * squaretimer);
      }
    }

    imageMode(CORNER);
    if (pepsi.width > 0)
    {
      image(pepsi, squarex, squarey, squaresize, squaresize);
    }

    imageMode(CORNER);
    if (coke.width > 0)
    {
      image(coke, squarex2, squarey2, squaresize, squaresize);
    }

    fill(#FFFFFF);
    text("TIME: " + (int)timer, 25, 50);
    text("CLICKS: " + scorecounter, 25, 100);


    if (timer < 0)
    {
      if (scorecounter <= 0)
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
    image(RC, 0, 0, width, height);
    textAlign(CENTER);
    text("You Lose, Rc is Superior", 0, 0, width, 100);
  }
  if (gamestate == WIN_STATE)
  {
    image (RC, 0, 0, width, height);
    textAlign(CENTER);
    text("You Win, but RC is Superior", 0, 0, width, 100);
  }
}

void mouseReleased()
{
  if (scorecounter > 0)
  {
    if (mouseX > squarex
      && mouseY > squarey
      && mouseX < (squarex + squaresize)
      && mouseY < (squarey + squaresize))
    {
      scorecounter = scorecounter - 1;
      squaresize = squaresize * 0.95;
    }
  }
  if (squaresize > 0)
  {
    if (mouseX > squarex2
      && mouseY > squarey2
      && mouseX < (squarex2 + squaresize2)
      && mouseY < (squarey2 + squaresize2))
    {
      squaresize2 = squaresize2 * 1.1;
      scorecounter = scorecounter + 1;
      textMode(CENTER);
      text("Hit The Pepsi!", width/2, 50);
    }
  }
}



