
/*
 Hunting Carrots
 Sandy Chen
 11/18/10
 */
 
 
 boolean wPressed, aPressed, sPressed, dPressed;
boolean upPressed, leftPressed, downPressed, rightPressed;
int x, y;
int u, v;
float carrotsX, carrotsY,carrotsX1,carrotsY1;
int screenNumber;
int aScore, bScore;
int speed;
PFont font;
PImage carrots,bunnyfamily,bunny,panda,bunnywin,lines,pandawin;


void setup()
{
  size(900, 700);
  smooth();
  rectMode(CENTER);
  noStroke();
  font = loadFont("Papyrus-Regular-48.vlw");
  lines = loadImage("lines.gif");
  panda= loadImage("panda.gif");
  bunnyfamily=loadImage("bunnyfamily.gif");
  pandawin  = loadImage("pandawin.gif");
  bunny=loadImage("bunnies.gif");
  bunnywin=loadImage("bunnywin.gif");
  carrots = loadImage("carrots.gif");
  textFont(font, 45);
  x = y = width/5;
  u = v = 3*width/5;
  carrotsX = carrotsY = width/2;
  
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
    image(lines,0,0); 
    movePlayers();
    drawPlayers();
    
    checkPrize();
    drawPrize();
    
    checkPlayerOverlap();
    setSpeedLevel();
    displayScore();
    prize();
  }
  else if (screenNumber == 3)
  {
      displayWinner();
  }
  else if(screenNumber ==4)
  {
    displaywinner();
  }
    
}


  
void displayWinner()
{
  aScore = 0;
  bScore = 0;
  fill(0, 200, 0);
  text("MWHAHA!I'm awesome!SLOWPOKE!!", 10, 100);
  image(bunnywin,200,150);
  if (mousePressed) screenNumber = 0;
}

void displaywinner()
{
  aScore = 0;
  bScore = 0;
  fill(0, 200, 0);
  text("In ur FACE bunny! I'm faster than you!", 10, 100);
  image(pandawin,200,150);
  if (mousePressed) screenNumber = 0;
}


void displayInstructions()
{
  fill(255);
  text("Let see who can catch 20 flying carrots faster!",10,50);
  image(bunnyfamily,250,200);
  fill(160,32,240);
  text("Clicky and start!", 200, 130);
  fill(240,128,128);
  text("Bunny's Carrot Hunting! ", random(50,100), random(200,100));
  if (mousePressed) screenNumber = 1;
}

void displayScore()
{
  fill(255,0,0);
  text("goal = 20" ,250,100);
  fill(255);
  text("Team Panda : " + aScore, 10, 60);
  text("Team Bunneh: " + bScore, 450, 60);
}

void setSpeedLevel()
{
  speed = 10;
  if(aScore>5 || bScore>5) speed = 8;
  if(aScore>10 || bScore>10) speed = 6;
  if(aScore>15 || bScore>15) speed = 4;
  if(aScore>20 || bScore>20) speed = 2;
}

void checkPlayerOverlap()
{
  if (dist(x,y, u,v) < 20)
  {
    aScore--;
    bScore--;
  }
}

void drawPrize()
{
  image(carrots, carrotsX-5, carrotsY-5);
  image(carrots,carrotsX1,carrotsY1);
}

void checkPrize()
{
  if(abs(x - carrotsX) < 15 && abs(y - carrotsY) < 15)
  {
    aScore += 3;
    placePrizeRandomly();
    if(aScore > 19)
    { 
      screenNumber=4;
    }
   
  }
  if(abs(u - carrotsX) < 15 && abs(v - carrotsY) < 15)
  {
    bScore += 3;
    placePrizeRandomly();
    if(bScore > 19)
    {
      screenNumber=3;
    }
  }
}

void placePrizeRandomly()
{
  
  carrotsX = random(width);
  carrotsY = random(height);
  carrotsX1=random(width);
  carrotsY1=random(height);
}

void drawPlayers()
{
  fill(128);
  image(panda,x,y, 60,60);
  image(bunny,u,v, 80,70);
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



