

// NeoHockey 
// Olga Varlamova
// S2846424
// Programming 2, Assignment 3
// 07/09/2012

PFont font, font1;

PowerUps powerUp; //PowerUps class

//hold pucks
Puck puck1;
Puck puck2;
Puck puck3;

//Player player; // player

// ScreenTitle screenTitle;
//ScreenWin screenWin;
//ScreenLose screenLose;

//game states
boolean showTitle;
boolean showGame;
boolean showWin;

boolean AIdelay;

//respawn powerups
boolean ffwSpawn = true;
boolean rwSpawn = true;

PImage bg, title, player1, player2, puckImg, ffw, rw;

int w = 1200;
int h = w/2;

//starting point to draw 
float wS = 0;

// diameter of player and puck
float d = w*0.06;

//player start positions
float p1x, p1y, p2x, p2y;

// scores
int p1Score = 0;
int p2Score = 0;

void setup()
{
  println ("NeoHockey");
  println ("Olga Varlamova");
  println ("s2846424");
  println ("Programming 2, Assignment 3");

  font = loadFont ("Leelawadee-Bold-200.vlw");
  font1 = loadFont ("HanzelExtendedNormal-48.vlw");

  size (w, h);

  smooth();

  puck1 = new Puck(w/2, h/2);
 

  //  load images
  bg = loadImage("bg.png");
  bg.resize(w, h); //resizes background to scale
  title = loadImage("title.png");
  title.resize(w, h);

  player1 = loadImage("play1.png");
  player1.resize(round(d), round(d));

  player2 = loadImage("play2.png");
  player2.resize(round(d), round(d));

  puckImg = loadImage("puck.png");
  puckImg.resize(round(d), round(d));

  ffw = loadImage("ffw.png");
  ffw.resize(round(d), round(d));

  rw = loadImage("rw.png");
  rw.resize(round(d), round(d));

  imageMode(CENTER);

  // start game at the titlescreen
  EnterTitle();
}

void draw()
{
  // py = h/2; // -----------------------------------------------------------------------for DEBUG


  imageMode(CORNER);

  if (showTitle)
  {
    screenTitle();
  }

  if (showGame)
  {
    drawCourt();
    drawPlayer();
    puck1.draw();
    if (puck2 !=null) puck2.draw();
    if (puck3 !=null) puck3.draw();
    checkScore();
    createPowerUp();
    if (powerUp != null)
    {
      powerUp.draw();
    }
  }

  if (showWin)
  {
    screenWin();
  }
}


void EnterWin()
{ 
  showGame = false;
  showWin = true;
  showTitle = false;
}


void EnterTitle()
{
  showGame = false;
  showWin  = false;
  showTitle = true;
}


void EnterPlay ()
{
  showGame = true;
  showWin  = false;
  showTitle = false;

  restart();
}


void createPowerUp()
{
  if (powerUp == null)
  {

    //----------------randomise chance of power up
    float powerChance = random(0, 1);
    if (powerChance < 0.0025) //chance of powerUp appearing
    {
      powerUp = new PowerUps ();
    }
  }
}

// system keyboard handling interface to allow for multiple keypress

static final int MAX_KEYS = 256;
boolean[] keyState = new boolean[256];
void keyPressed() { 
  if (key < 256) keyState[key] = true;
}
void keyReleased() { 
  if (key < 256) keyState[key] = false;
}


