
/**
 * Snatch That Ish
 * by Lao De Lozada
 * 10/26/10
 */

// keypress tracking
boolean wPressed, aPressed, sPressed, dPressed;
boolean upPressed, leftPressed, downPressed, rightPressed;

// coordinates
int x, y;
int u, v;
float prizeX, prizeY;

// other stuff
int screenNumber;
int aScore, bScore;
int speed;
PFont font;
PImage ishh;
PImage Main;
PImage warp;
PImage blob;
PImage spark;
PImage loser;
void setup()
{
  size(700, 700);
  smooth();
  noStroke();
  rectMode(CENTER);
  font = loadFont("Bauhaus93-48.vlw");
  spark = loadImage("spark.gif");
  blob = loadImage("blob.gif");
  ishh   = loadImage("ishh.gif");
  Main = loadImage("Main.gif");
  warp = loadImage("warp.gif");
  loser = loadImage("loser");
  textFont(font, 48 );

  x = y = width/4;
  u = v = 3*width/4;
  prizeX = prizeY = width/2;

  screenNumber = 0;
}

void draw()
{ 
  if (screenNumber == 0)
  {
    background(Main);
    displayInstructions();
  }
  else if (screenNumber == 1)
  {
    background(warp);
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
   
    displayWinner();
  }
}

void displayWinner()
{
  aScore = 0;
  bScore = 0;
  fill(0, 200, 0);
  text("You win!", 50, 100);
  if (mousePressed) screenNumber = 0;
}

void displayInstructions()
{
  fill(0, 200, 0);
  text("Snatch that Ish", 50, 100);
  fill(255);
  text("click to start playing", 50, 200);
  if (mousePressed) screenNumber = 1;
}

void displayScore()
{
  fill(255);
  text("Circle: " + aScore, 10, 40);
  text("Square: " + bScore, 400, 40);
}

void setSpeedLevel()
{
  speed = 2;
  if(aScore>50 || bScore>40) speed = 6;
  if(aScore>75 || bScore>100) speed = 7;
  if(aScore>100 || bScore>200) speed = 7;
  if(aScore>30 || bScore>30) screenNumber = 2;
}

void checkPlayerOverlap()
{
  if (dist(x,y, u,v) < 15)
  {
    aScore--;
    bScore--;
  }
}

void drawPrize()
{
  fill(0,200,0);
  image(ishh, prizeX, prizeY);
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
}

void placePrizeRandomly()
{
  prizeX = random(width);
  prizeY = random(height);
}

void drawPlayers()
{
 image(blob,x,y);
 image(spark,u,v);

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
}


