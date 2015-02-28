
//homework #7 - 48257 S'12
//melissa (macy) goh copyright 2012

int count;
int gamePhase;
float x, y, fx, fy, flySize, frogSize;
float xspeed, yspeed, fxspeed, fyspeed;

PImage frog;
PImage fly;
PImage game;

void setup()
{
  size(400, 400);
  fill(255);
  
  frog = loadImage("frog.png");
  imageMode(CENTER);
  
  fly = loadImage("fly.png");
  imageMode(CENTER);
  
  game = loadImage("game.png");
  imageMode(CENTER);
  
  x = random(0, width);
  y = random(0, height);
  frogSize = 50;
  
  fx = random(0, width);
  fy = random(0, height);
  flySize = 25;
  
  xspeed = 1;
  yspeed = 1;
  
  fxspeed = 3;
  fyspeed = 3;
  
  count = 0;
  gamePhase = 0;
}

void draw()
{
  background(0);
  if (gamePhase == 0)
  {
    showInstructions();
  }
  
  else if (gamePhase == 1)
  {
    playGame();
  }
  
  else
  {
    score();
  }
}

void playGame()
{
  drawFly();
  bounceFly();
  drawFrog();
  moveFrog();
  eatFly();
  timer();
  score();
  gameOver();
}

void showInstructions()
{
  textAlign(CENTER);
  textSize(15);
  text("You are the frog. Catch the fly.", width/2, 50);
  text("Click and drag the mouse to move.", width/2, 70);
  text("See what happens when you eat 10 flies.", width/2, 100);
  text("Press any key to begin.", width/2, 200);
}
  
void keyPressed()
{
  if (gamePhase == 0)
  {
    gamePhase = 1;
  }
}

void drawFly()
{
  fill(0, 0, 255);
  image(fly, fx, fy, flySize, flySize);
}

void bounceFly()
{
  fx = fx + fxspeed;
  fy = fy + fyspeed;
  
  if (fx >= width - flySize/2)
  {
    fxspeed = -fxspeed;
  }
  
  else if (fx <= 0 + flySize/2)
  {
    fxspeed = -fxspeed;
  }
  
  if (fy >= height - flySize/2)
  {
    fyspeed = -fyspeed;
  }
  
  else if (fy <= 0 + flySize/2)
  {
    fyspeed = -fyspeed;
  }
}
  
void drawFrog()
{
  fill(0, 0, 255);
  image(frog, x, y, frogSize, frogSize);
}

void moveFrog()
{
  x = x + xspeed;
  y = y + yspeed;
   
  if (x > width + frogSize)
  {
    x = 0;
  }
  
  else if (x < 0 - frogSize)
  {
    x = width;
  }
  
  if (y > height + frogSize)
  {
    y = 0;
  }
  
  else if (y < 0 - frogSize)
  {
    y = height;
  }
}

  
void mouseDragged()
{
  if (mouseX > pmouseX)
  {
    xspeed = xspeed + .1;
  }
  
  else if (mouseX < pmouseX)
  {
    xspeed = xspeed - .1;
  }
  
  if (mouseY > pmouseY)
  {
    yspeed = yspeed + .1;
  }  
    
  else if (mouseX < pmouseX)
  {
    yspeed = yspeed - .1;
  }
}

void eatFly()
{
  float d = dist(x, y, fx, fy);
  if (d < frogSize/2)
  {
    count = count + 1;
    frogSize = frogSize + 20;
     
    x = random(0, width);
    y = random(0, height);

    fx = random(0, width);
    fy = random(0, height);
    
    xspeed = random(0, 5);
    yspeed = random(0, 5);
  
    fxspeed = random(0, 5);
    fyspeed = random(0, 5);
  }
}

void timer()
{
  fill(255);
  textSize(10);
  textAlign(LEFT);
  text("time flown: " + (millis()/1000), 50, 350);
}

void score()
{
  fill(255);
  textSize(10);
  textAlign(LEFT);
  String eat = nf(count, 1);
  text("flies eaten: " + eat, 50, 375);
}

void gameOver()
{
  if (count == 10)
  {
    background(0);
    textSize(30);
    textAlign(CENTER);
    text("BLEH, TOO MANY FLIES", width/2, 50);
    image(game, 200, 200, 200, 200);
    noLoop();
  }
}
    
    

