
/*Eat It! by Martin Plondaya*/
boolean wPressed, aPressed, sPressed, dPressed;
boolean upPressed, leftPressed, downPressed, rightPressed;
int x, y;
int u, v;
float prizeX, prizeY;
float prizeX2,prizeY2;
float prizeX3, prizeY3;
float prizeX4, prizeY4;
int screenNumber;
int aScore, bScore;
int speed;
PFont font;
PImage face;
PImage guy;
PImage cookie;

void setup()
{
  size(700, 600);
  smooth();
  noStroke();
  rectMode(CENTER);
  imageMode(CENTER);
  font = loadFont("LucidaSans-32.vlw");
  textFont(font, 32);
 face = loadImage( "face.gif");
 guy = loadImage ( "guy.gif");
 cookie = loadImage ("cookie.gif");

  x = y = width/4;
  u = v = 3*width/4;
  prizeX = prizeY = width/2;
  prizeX2= prizeY2= width/3;
  prizeX3= prizeY3= width/4;
  prizeX4=prizeY4=width/5;
  
  screenNumber = 0;
}
void draw()
{ 
  background(0);
  if (screenNumber == 0)
  {
    displayInstructions();
  }
  else if (screenNumber == 1)
  {
    movePlayers();
    drawPlayers();
    
    
    checkPrize();
    drawPrize();
    drawPrize2();
    drawPrize3();
    drawPrize4();
    drawBorders();
    checkPlayerOverlap();
    setSpeedLevel();
    displayScore();
  }
  else if (screenNumber == 2)
  {
    displayWinner1();
  }
  else if (screenNumber == 3)
  {
    displayLoser();
  }
  else if (screenNumber == 4)
  {
    displayWinner2();
  }

}
void displayWinner2()
{
   aScore = 100;
  bScore = 100;
  fill(0,200,0);
  text("Red ate all the cookies!!!",50,100);
  if (mousePressed)
 {
   aScore = 0;
   bScore = 0;
    x = y = width/4;
  u = v = 3*width/4;
   screenNumber = 0;
 }
}  
void displayLoser()
{
  aScore = -50;
  bScore = -50;
  fill (255,0,0);
  text (" Game Over U Guys  Lose", 50,100);
  if (mousePressed)
 { 
  aScore = 0;
   bScore = 0;
    x = y = width/4;
  u = v = 3*width/4;
   screenNumber = 0;
 }
}
void displayWinner1()
{
 
  aScore = 100;
  bScore = 100;
  fill(0,200,0);
  text("Blue ate all the cookies!!!",50,100);
  if (mousePressed)
 {
   aScore = 0;
   bScore = 0;
    x = y = width/4;
  u = v = 3*width/4;
   screenNumber = 0;
 }
} 

void drawBorders()
{
  if( x < 30)
  {
    x = 30;
  }
  if(x > 680)
  {
    x = 680;
  }
  if(u < 30)
  {
    u = 20;
  }
  if(u > 680)
  {
    u = 680;
  }
  if(y < 30)
  {
    y = 30;
  }
  if(y > 580)
  {
    y = 580;
  }
  if(v < 30)
  {
    v = 30;
  }
  if(v > 580)
  {
    v = 580;
  }
}
void displayInstructions()
{
  fill(0, 200, 0);
  text("Eat Cookie!", 50, 100);
  fill(255);
  text("click to start playing", 50, 200);
  if (mousePressed) screenNumber = 1;
}
void displayScore()
{
  fill(255);
  text("Player 1: " + aScore, 10, 40);
  text("Player 2: " + bScore, 400, 40);
  if(aScore > 100)
  {
    screenNumber = 2;
  }
  if(bScore > 100)
  {
    screenNumber = 4;
  }
  if(aScore < -5)
  {
    screenNumber = 3;
  }
  if(bScore < -5)
  {
    screenNumber = 3;
  }
}

void setSpeedLevel()
{
  speed = 2;
  if(aScore>50 || bScore>40) speed = 3;
  if(aScore>100 || bScore>100) speed = 4;
  if(aScore>200 || bScore>200) speed = 5;
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
 image (cookie, prizeX,prizeY);
}

void drawPrize2()
{
  fill(0,200,0);
 image (cookie, prizeX2,prizeY2);
}
void drawPrize3()
{
  fill(0,200,0);
 image (cookie, prizeX3,prizeY3);
}
void drawPrize4()
{
  fill(0,200,0);
 image (cookie, prizeX4,prizeY4);
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

  if(abs(x - prizeX2) < 15 && abs(y - prizeY2) < 15)
  {
    aScore += 10;
    placePrize2Randomly();
  }
  if(abs(u - prizeX2) < 15 && abs(v - prizeY2) < 15)
  {
    bScore += 10;
    placePrize2Randomly();
  }
  if(abs(x - prizeX3) < 15 && abs(y - prizeY3) < 15)

  {
    aScore += 10;
    placePrize3Randomly();
  }
  if(abs(u - prizeX3) < 15 && abs(v - prizeY3) < 15)
  {
    bScore += 10;
    placePrize3Randomly();
  }
   if(abs(x - prizeX4) < 15 && abs(y - prizeY4) < 15)

  {
    aScore += 10;
    placePrize4Randomly();
  }
  if(abs(u - prizeX4) < 15 && abs(v - prizeY4) < 15)
  {
    bScore += 10;
    placePrize4Randomly();
  }
}

void placePrizeRandomly()
{
  prizeX = random(width);
  prizeY = random(height);
}


void placePrize2Randomly()
{
  prizeX2 = random(width);
  prizeY2 = random(height);
}
void placePrize3Randomly()
{
  prizeX3 = random(width);
  prizeY3 = random(height);
}
void placePrize4Randomly()
{
  prizeX4 = random(width);
  prizeY4 = random(height);
}
void drawPlayers()
{
  fill(128);
  image(face,x,y);
  image(guy,u,v);
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



