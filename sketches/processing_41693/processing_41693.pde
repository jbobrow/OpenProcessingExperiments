
//homework 8
//copyright Andrew Viny, Carnegie Mellon University, Sept 2011, Pittsburgh, Pa
float x, y, a, xRef, yRef, speedX, speedY, dia, Tx, Ty, Tdia, TxRef, TyRef, xCol, yCol, TxSpeed, TySpeed, minDist;
int numCol;
boolean col;
PImage treasure;
PImage Pirate;
int colCounter;

void setup()
{
  size(400,400);
  minDist = width/10;
  numCol = 0;
  x = 0;
  y = 0;
  a = .5;
  Tx = 0;
  Ty = 0;
  col = false;
  xCol = 0;
  yCol = 0;
  colCounter = 0;
  TxSpeed = 1;
  TySpeed = 1;
  Tdia = width/8;
  dia = width/8;
  xRef = width/2;
  yRef = height/2;
  TxRef = random(0,400);
  TyRef = random(0,400);
  speedX = 0;
  speedY = 0;
  smooth();
  background(255);
  noStroke();
  fill(255,0,0);
  textAlign(CENTER,CENTER);
  imageMode(CENTER);
  treasure = loadImage ("treasure.png");//image made by andrew viny
  Pirate = loadImage ("Pirate.png");//image taken by andrew viny
  frameRate(60);
}

void draw()
{ 
  background(255);
  info();
  collision();
  if(col == true)
  {
    if(col == true)
    {
    fill(255,0,0);
    background(255,0,50);
    rect(0,0,width,height);
    fill(0);
    text("ARG!\n The pirate got the Treasure!", width/4, height / 4);
  
    if(xRef < width && xRef > 0 && yRef < height && yRef > 0)
    {
    if(key == ' ')
    {
      numCol++;
    }
    }
    TxRef = random(0,400);
    TyRef = random(0,400);
    xRef = width/2;
    yRef = height/2;
    speedX = 0;
    speedY = 0;
    
    colCounter += 1;
    
    if(colCounter > 80)
    {
    col = false;
    colCounter = 0;
    }
    }
  }
  else
  {
  drawInitials(xRef, yRef, dia);
  //resetDrawSomething();
  drawSomething(TxRef,TyRef,Tdia);
  moveInitials();
  resetInitials();
  warning();
  }
}

void drawInitials(float x, float y, float dia)
{ 
  //Pirate
  noStroke();
  image (Pirate,x,y,dia,dia*1.35);
  
  if(col == true)
  {
    col = false;
  }
}

void moveInitials()
{ 
  xRef = xRef + speedX;
  yRef = yRef + speedY;
}

void resetInitials()
{
  if(col == true || key == ' ')
  {
    xRef = width/2;
    yRef = height/2;
    speedX = 0;
    speedY = 0;
  }
}
 
void keyPressed()
  {
    if (keyCode == DOWN)
    {
      speedY = speedY + a;
    }
  
    if (keyCode == UP)
    {
       speedY = speedY - a;
    }
  
    if (keyCode == LEFT)
    {
       speedX = speedX - a;
    }
  
    if (keyCode == RIGHT)
    {
       speedX = speedX + a;
    }
  }
  
void warning()
{
  if(xRef < -.5*dia || xRef > width+.5*dia || yRef < -.5*dia || yRef > height+.5*dia)
  {
    stroke(255,0,0);
    strokeWeight(3);
    line(width/2, height/2, xRef, yRef);
    fill(0);
    text("WARNING\n The pirate is\n off the screen by\n" + (int)(dist(width/2,height/2,xRef,yRef) - width/2) + " Pixels", width/2, 350);
  }
}

void drawSomething(float Tx, float Ty, float Tdia)
  {
    noStroke();
    image (treasure,Tx,Ty,Tdia,Tdia/1.25);
    
    TxRef = TxRef + TxSpeed;
    TyRef = TyRef + TySpeed;
    
    if((TxRef > width) || (TxRef < 0))
    {
      TxSpeed = TxSpeed * -1;
    }
    
    if((TyRef > width) || (TyRef < 0))
    {
      TySpeed = TySpeed * -1;
    }
      
  }

void collision()
{
  if(dist(xRef,yRef,TxRef,TyRef) < minDist)
  {
    col = true;
    x = (width / 2) - (minDist / 2);
    y = (height / 2) - (minDist / 2);
    speedX = 0;
    speedY = 0;
    xCol = 0;
    yCol = 0;
    xCol = random(2, 4) + (numCol/10);
    yCol = random(2, 4) + (numCol/10);
    
    }
  }

void info()
{
  fill(0,0,0);
  text("Horizontal Speed\n" + (int)speedX, .5*width/4, .25*height/4);
  text("Collisions\n" + numCol, 2*width/4 , .25*height/4);
  text("Vertical Speed\n" + (int)speedY*-1, 3.5*width/4 , .25*height/4);
  text("Time\n" + millis() / 1000, width/4, 3.75*height/4);
  text("Level: " + (int)(numCol/2), 3*width/4, 3.75*height/4);
}
