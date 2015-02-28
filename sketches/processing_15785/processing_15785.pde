
ArrayList<Platform> platforms = new ArrayList<Platform>();
Player guy;

boolean wPressed, aPressed, sPressed, dPressed;

int x, y;
int u, v;

float prizeX, prizeY;
float spikesX, spikesY;
int screenNumber;

int aScore, bScore;
int speed;
PFont font;

PImage star;
PImage spikes;

void setup()
{
  size(600, 600);
  smooth();
  noStroke();
  rectMode(CENTER);
  font = loadFont("LucidaSans-32.vlw");
  
  textFont(font, 32);

  x = y = width/4;
  u = v = 3*width/4;
  prizeX = prizeY = width/2;
  
  screenNumber = 0;
  size(600,600);
  for(int i=0; i<25; i++)
  {
    Platform p = new Platform( (int)random(1,width/10)*10,
                               (int)random(1,width/25)*25,
                               (int)random(1,3)*50,
                               10);
    platforms.add( p );
  }
  
  Platform p1 = new Platform(150, 150, 200, 10);
  platforms.add( p1 );
  
  guy = new Player(300,0,10);
  speed = 1;
}

void draw()
{ 
   background(0);

   

   if (screenNumber == 1)
   background(255);
  {
    movePlayers();
    
    checkPrize();
    drawPrize();
    
    drawPlatforms();
  movePlayer();
  checkPlayerOverlap();
  guy.display();
  drawPrize();
    
    if (guy.x < 10 && guy.x > 30 && guy.y > 300 && guy.y < 10 )
screenNumber = 2; 
  }
   if (screenNumber == 2)
  {
    displayWinner();
    checkPrize();
    drawPrize();
    drawPlatforms();
  movePlayer();
  guy.display();
  drawPrize();
    
  }
}

void drawPrize()
{
  fill(0,200,0);
  rect(prizeX, prizeY, 20, 20);
  
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






void movePlayer()
{
  guy.y += 2;

  if (wPressed) guy.y -= speed;
  if (aPressed) guy.x -= speed;
  if (sPressed) guy.y += speed;
  if (dPressed) guy.x += speed;

  for(Platform p: platforms)
  {
    if(p.below(guy))
    {
      guy.y = p.y - guy.s;
    }
  }

  if (guy.y > height)
  { 
    
    guy.y = -100;
  }  
}

void drawPlatforms()
{
  for(Platform p: platforms)
  {
    p.display();
  }
  
}






