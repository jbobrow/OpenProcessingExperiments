
/**
 * Space Servers
 * based on ContinuousKeys
 * by Lizzy Graham
 * 10/26/10
 */
Seeker a,bb,cc,d,e,f,g,h,i,j,k;
// keypress tracking
boolean wPressed, aPressed, sPressed, dPressed;
boolean upPressed, leftPressed, downPressed, rightPressed;

// coordinates
int x, y;
int u, v;
float q, w;
float c,b;

float prizeX, prizeY;

// other stuff
int screenNumber;
int aScore, bScore;
int speed;
PFont font;
PImage back2;
PImage burger;
PImage ima;
PImage bot1;
PImage bot2;
PImage boot2;





void setup()
{
  size(600, 600);
  
   a = new Seeker();
  a.r = 10;
  a.v = 1;
   a.c = width/1;
    a.b = width/1;
    
     bb = new Seeker();
  bb.r = 20;
  bb.v = 2;
   bb.c = width/2;
    bb.b = width/2;
    
     cc = new Seeker();
  cc.r = 30;
  cc.v = 3;
   cc.c = width/3;
    cc.b = width/3;
    
     d = new Seeker();
  d.r = 40;
  d.v = 4;
   d.c = width/4;
    d.b = width/4;
    
     e = new Seeker();
  e.r = 50;
  e.v = 5;
   e.c = width/5;
    e.b = width/5;
    f = new Seeker();
  f.r = 35;
  f.v = 1;
   f.c = width/5;
    f.b = width/5;
    g = new Seeker();
  g.r = 32;
  g.v = 2;
   g.c = width/7;
    g.b = width/7;
    h = new Seeker();
  h.r = 25;
  h.v = 3;
   h.c = width/3;
    h.b = width/3;
    i = new Seeker();
  i.r = 30;
  i.v = 3;
   i.c = width/4;
    i.b = width/4;
    j = new Seeker();
  j.r = 39;
  j.v = 3;
   j.c = width/5;
    j.b = width/5;
    k = new Seeker();
  k.r = 40;
  k.v = 3;
   k.c = width/2;
    k.b = width/2;
    
   a = new Seeker();
  a.r = 10;
  a.v = 1;
   a.q = width/1;
    a.w = width/1;
    
     bb = new Seeker();
  bb.r = 20;
  bb.v = 2;
   bb.q = width/2;
    bb.w = width/2;
    
     cc = new Seeker();
  cc.r = 30;
  cc.v = 3;
   cc.q = width/3;
    cc.w = width/3;
    
     d = new Seeker();
  d.r = 40;
  d.v = 4;
   d.q = width/4;
    d.w = width/4;
    
     e = new Seeker();
  e.r = 50;
  e.v = 5;
   e.q = width/5;
    e.w = width/5;
    f = new Seeker();
  f.r = 35;
  f.v = 1;
   f.q = width/5;
    f.w = width/5;
    g = new Seeker();
  g.r = 32;
  g.v = 2;
   g.q = width/7;
    g.w = width/7;
    h = new Seeker();
  h.r = 25;
  h.v = 3;
   h.q = width/3;
    h.w = width/3;
    i = new Seeker();
  i.r = 30;
  i.v = 3;
   i.q = width/4;
    i.w = width/4;
    j = new Seeker();
  j.r = 39;
  j.v = 3;
   j.q = width/5;
    j.w = width/5;
    k = new Seeker();
  k.r = 40;
  k.v = 3;
   k.q = width/2;
    k.w = width/2;
  smooth();
  noStroke();
  rectMode(CENTER);
  font = loadFont("ForteMT-30.vlw");
back2 = loadImage("back2.gif");
  burger = loadImage("burger.gif");
   bot1 = loadImage("alien1.gif");
   bot2 = loadImage("alien2.gif");
  ima = loadImage("images.jpeg");
  boot2 = loadImage("fire2.gif");
 
 
  fill(134,140,90);
  textFont(font, 22);

  x = y = width/2;
  u = v = width/2;
  prizeX = prizeY = width/2;
  
  screenNumber = 0;
}

void draw()
{ 
  image(burger,100,100);
  background(123,245,230);
  image(back2,0,0);
  a.move();
  a.show();
  bb.move();
  bb.show();
  cc.move();
  cc.show();
  d.move();
  d.show();
  e.move();
  e.show();
  f.move();
  f.show();
  g.move();
  g.show();
  h.move();
  h.show();
  i.move();
  i.show();
  j.move();
  j.show();
  k.move();
  k.show();
  
  fill(12,140,140);
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
  text("You win!Click to play again =)", 50, 100);
  if (mousePressed) screenNumber = 0;
}

void displayInstructions()
{
  fill(255);
  text("Space Servers!", 50, 80);
  fill(255);
  text("(2 Player Game)Use arrow keys & A S D W." , 100, 100);
  text("Stay inside boundaries, first to 180 wins!" , 100, 120);
  text("Click ->[  ]<- to begin & leave mouse here. ", 15, 165);
  if (mousePressed) screenNumber = 1;
}


void displayScore()
{
  fill(250,190,80);
  text("Green: " + aScore, 10, 40);
  text("Red: " + bScore, 400, 40);
}

void setSpeedLevel()
{
 
 speed = 2;
  if(aScore>40 || bScore>40) speed = 3;
  if(aScore>60 || bScore>60) speed = 4;
  if(aScore>80 || bScore>80) speed = 9;
  if(aScore>140 || bScore>140) speed = 13;
  if(aScore>180 || bScore>180) screenNumber = 2;

  
}

   {}




void drawPrize()
{
  fill(0,200,0);
 // rect(prizeX, prizeY, 10, 10);
 image(burger,prizeX,prizeY);
 
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
  fill(134,24,190);
  image(bot1,x,y);
  fill(10,90,190);
  image(bot2,u,v);
  
  
}

void movePlayers()
{
  if (wPressed) y -= speed*3;
  if (aPressed) x -= speed*3;
  if (sPressed) y += speed*3;
  if (dPressed) x += speed*3;
  if (rightPressed) u += speed*3;
  if (leftPressed)  u -= speed*3;
  if (upPressed)    v -= speed*3;
  if (downPressed)  v += speed*3;
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
class Seeker
{
  float c, b;
  float q, w;
  int r; // size (r for radius)
  int v; // velocity


  void show()
  {
    image(boot2,c,b);
    image(boot2,q,w);
  }

  void move()
  {
    c += ( width/3 - mouseX  ) * 0.002* v;
    b += (height/3 -  mouseY ) * 0.002* v;
     q += ( width/3 - mouseX ) * 0.002* v;
    w += ( height/3 - mouseY ) * 0.002* v;
  }
}
void checkPlayerOverlap()
{
  if (dist(x,y, a.c,a.b) < 15)
  {
    fill(134,149,0);
    aScore--;
    
  }
  if (dist(x,y, bb.c,bb.b) < 15)
    {
    fill(134,149,0);
    aScore--;
 
  }
  if (dist(x,y, cc.c,cc.b) < 15)
    {
    fill(134,149,0);
    aScore--;
   
  }
  if (dist(x,y, d.c,d.b) < 15)
    {
    fill(134,149,0);
    aScore--;
   
  }
  if (dist(x,y, e.c,e.b) < 15)
    {
    fill(134,149,0);
    aScore--;
    
  }
  if (dist(x,y, f.c,f.b) < 15)
    {
    fill(134,149,0);
    aScore--;
    
  }
  if (dist(x,y, g.c,g.b) < 15)
    {
    fill(134,149,0);
    aScore--;
    
  }
  if (dist(x,y, h.c,h.b) < 15)
    {
    fill(134,149,0);
    aScore--;
   
  }
  if (dist(x,y, i.c,i.b) < 15)
    {
    fill(134,149,0);
    aScore--;

  }
  if (dist(x,y, j.c,j.b) < 15)
    {
    fill(134,149,0);
    aScore--;

  }
  if (dist(x,y, k.c,k.b) < 15)
    {
    fill(134,149,0);
    aScore--;
 
  }
 
    if (dist(u,v, a.q,a.w) < 15)
     {
    fill(134,149,0);
   
    bScore--;
  }
   if (dist(u,v, bb.q,bb.w) < 15)
     {
    fill(134,149,0);
    
    bScore--;
  }
    if (dist(u,v, cc.q,cc.w) < 15)
     {
    fill(134,149,0);
    
    bScore--;
  }
    if (dist(u,v, d.q,d.w) < 15)
     {
    fill(134,149,0);
   
    bScore--;
  }
   if (dist(u,v, e.q,e.w) < 15)
     {
    fill(134,149,0);
   
    bScore--;
  }
     if (dist(u,v, f.q,f.w) < 15)
     {
    fill(134,149,0);
    
    bScore--;
  }
   if (dist(u,v, g.q,g.w) < 15)
     {
    fill(134,149,0);
    
    bScore--;
  }
    if (dist(u,v, h.q,h.w) < 15)
      {
    fill(134,149,0);
    
    bScore--;
  }
    if (dist(u,v, i.q,i.w) < 15)
      {
    fill(134,149,0);
   
    bScore--;
  }
    if (dist(u,v, j.q,j.w) < 15)
      {
    fill(134,149,0);
    
    bScore--;
  }
    
      if (dist(u,v, k.q,k.w) < 15)       
  {
    fill(134,149,0);
    
    bScore--;
  }
}


