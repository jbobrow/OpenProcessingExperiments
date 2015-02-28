
// By Rada, Paul
// 11.19.2010
// STARBLASTER!!!
boolean wPressed, aPressed, sPressed, dPressed;
boolean upPressed, leftPressed, downPressed, rightPressed;
boolean tPressed, fPressed, gPressed, hPressed;
boolean iPressed, jPressed, kPressed, lPressed;


int x, y;
int u, v;
int c, b;
int e, f;
float prizeX, prizeY;

int screenNumber;
int aScore;
int bScore;
int cScore;
int dScore;
int speed;
PFont font;
PImage Alien;
PImage Space;
PImage StarShot;
PImage StarCluster;
PImage Sun;
PImage Stars;
PImage Beams;
PImage UFO;
PImage StarEater;

void setup()
{
  size(900, 900);
  smooth();
  noStroke();
  
  font = loadFont("HarlowSolid-48.vlw");
  Sun = loadImage("Sun.jpg");
  Space = loadImage("Space.gif");
  Stars = loadImage("Stars.jpg");
  Alien = loadImage("Alien.gif");
  StarShot = loadImage("StarShot.gif");
  StarCluster = loadImage("StarCluster.gif");
  Beams = loadImage("Beams.jpg");
  UFO = loadImage("UFO.gif");
  StarEater = loadImage("StarEater.gif");
  textFont(font, 48);

  x = y = 2*width/20;
  u = v = 3*width/20;
  c = b = 4*width/20;
  e = f = 5*width/20;
  prizeX = prizeY = width/2;

  screenNumber = 0;
}

void draw()
{ 
  if (screenNumber == 0)
  {
     background(Beams);
    displayInstructions();
  }
  else if (screenNumber == 1)
  {
    background(Sun);
    movePlayers();
    drawPlayers();

    checkPrize();
    drawPrize();

    checkPlayerOverlap();
    setSpeedLevel();
    displayScore();
  }
  else if (screenNumber == 2)
  {
    background(Space);
    displayWinner();
  }
}



void displayInstructions()
{
  fill(185,249,255);
  text("STAR BLASTER!", 50, 100);
  fill(255,230,0);
  text("FiGHT FOR YOUR STARSYSTEM!", 70, 150);
  fill(245,115,52);
  text("100 STARCLUSTERS WiNS!", 100, 200);
  fill(220,240,242);
  text("Click Clack!", 50, 700);
  if (mousePressed) screenNumber = 1;
}

void displayWinner()
{
  aScore = 0;
  bScore = 0;
  cScore = 0;
  dScore = 0;
  
  fill(0, 200, 0);
  text("WINNER!", 50, 100);
  if (mousePressed) screenNumber = 0;
}
void displayScore()
{
  fill(0);
  text("Alien: " + aScore, 10, 40);
  text("StarBattler: " + bScore, 200, 40);
  text("UFO: " + cScore, 500, 40);
  text("StarEater: " + dScore, 700, 40);
}

void setSpeedLevel()
{
  speed = 2;
  if(aScore>5 || bScore>5 || cScore>5 || dScore>5) speed = 3;
  if(aScore>10 || bScore>10 || cScore>10 || dScore>10) speed = 4;
  if(aScore>20 || bScore>20 || cScore>20 || dScore>20) speed = 7;
  if(aScore>90 || bScore>90 || cScore>90 || dScore>90) screenNumber = 2;
}

void checkPlayerOverlap()
{
  if (dist(x,y, u,v, c,b) < 15)
  if (dist(e,f, u,v) < 15)
  {
    aScore--;
    bScore--;
    cScore--;
    dScore--;
  }
}

void drawPrize()
{
  fill(0,200,0);
  image(StarCluster, prizeX, prizeY);
}

void checkPrize()
{
  if(abs(x - prizeX) < 15 && abs(y - prizeY) < 15)
  {
    aScore += 10;
    placePrizeRandomly();
  }
  if(abs(u - prizeX) < 15 && abs(v - prizeY) < 15)
  {
    bScore += 10;
    placePrizeRandomly();
  }
  if(abs(c - prizeX) < 15 && abs(b - prizeY) < 15)
  {
    cScore += 10;
    placePrizeRandomly();
  }
   if(abs(e - prizeX) < 15 && abs(f - prizeY) < 15)
  {
    dScore += 10;
    placePrizeRandomly();
  }
}

void placePrizeRandomly()
{
  prizeX = random(width);
  prizeY = random(height);
}

void drawPlayers()
{

  image(Alien, x, y);
  image(StarShot, u, v);
  image(UFO, c ,b);
  image(StarEater , e, f);
}

void movePlayers()
{
  if (wPressed) y -= speed;
  if (aPressed) x -= speed;
  if (sPressed) y += speed;
  if (dPressed) x += speed;
  if (rightPressed) u += speed;
  if (leftPressed)  u -= speed;
  if (upPressed)    v -= speed;
  if (downPressed)  v += speed;
  if (tPressed) b -= speed;
  if (fPressed) c -= speed;
  if (gPressed) b += speed;
  if (hPressed) c += speed;
  if (iPressed) f -= speed;
  if (jPressed) e -= speed;
  if (kPressed) f += speed;
  if (lPressed) e += speed;
}

void keyPressed()
{
  if (key == 'w') wPressed = true;
  if (key == 'a') aPressed = true;
  if (key == 's') sPressed = true;
  if (key == 'd') dPressed = true;
  if (keyCode == RIGHT) rightPressed = true;
  if (keyCode == LEFT)  leftPressed = true;
  if (keyCode == UP)    upPressed = true;
  if (keyCode == DOWN)  downPressed = true;
  if (key == 't') tPressed = true;
  if (key == 'f') fPressed = true;
  if (key == 'g') gPressed = true;
  if (key == 'h') hPressed = true;
  if (key == 'i') iPressed = true;
  if (key == 'j') jPressed = true;
  if (key == 'k') kPressed = true;
  if (key == 'l') lPressed = true;
}

void keyReleased()
{
  if (key == 'w') wPressed = false;
  if (key == 'a') aPressed = false;
  if (key == 's') sPressed = false;
  if (key == 'd') dPressed = false;
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT)  leftPressed = false;
  if (keyCode == UP)    upPressed = false;
  if (keyCode == DOWN)  downPressed = false;
  if (key == 't') tPressed = false;
  if (key == 'f') fPressed = false;
  if (key == 'g') gPressed = false;
  if (key == 'h') hPressed = false;
  if (key == 'i') iPressed = false;
  if (key == 'j') jPressed = false;
  if (key == 'k') kPressed = false;
  if (key == 'l') lPressed = false;
}


