
//Homework8, October 2011
//Copyright Manuela Kind, CMU Pittsburgh PA

//----------variables--------------

float x;    //position x
float y;    //position y
float dia;  //diameter
float dirX; //directionBubbleX
float dirY; //directionBubbleY
float posX; //positionNeedleX
float posY; //positionNeedleY
float velX; //velocityNeedleX
float velY; //velocityNeedleY

float tooclose;
int countCollision;

color col;

PImage plopp;
//----------setup------------------

void setup()
{
  size (400, 400);
  x = random(width);
  y = random(height);
  dia = 50;
  dirX = 3;
  dirY = 3;
  posX = width/2;
  posY = height/2;  
  col = color(200, 200, 100, 90);
  velX= 0;
  velY= 0;
  countCollision = 0;
  plopp = loadImage("PLOPP_BIG.png");
  smooth();
}

//----------draw-------------------

void draw()
{
  backgr();
  frameSpeed();
  circle();
  moveCircle();
  needle();
  moveNeedle();  
  speed();
  keyPressed();
  warning();
  collision();
  reset();
}

//-------frameSpeed-----------
void frameSpeed()
{
frameRate(50);
}


//---------Collisions-----------
void collision()
{
  if (dist(x,y,posX,posY) < dia)
  {
    countCollision = countCollision + 1;
    x=random(width);
    y=random(height);
    posX=(width/2) - (dia/2);
    posY=(height/2) - (dia/2);
    dirX = random(0,10);
    dirY = random(0,10);
    velX = 0;
    velY = 0;
    frameRate(1);
    background(75, 100, 255, 20);
    imageMode(CENTER);
    image(plopp,width/2, height/2, 150, 150);
  }
}

//-------Warning-Quit---------------

void warning()
{
  if (posX > width || posY > height || posX < 0 || posY < 0)
  {
    stroke(200, 200, 255, 50);
    line (width/2, height/2, posX, posY);
    textAlign(CENTER,CENTER);
    text("Ouch! The needle has escaped the safe space!", 
    width/2, height/2);
    
    fill(255);
    textAlign(LEFT);
    text ("Distance: " + 
         (int)(dist(posX - dia/2, posY - dia/2, width/2, height/2) ), 
    210, 320);
  }
}

//--------background---------------

void backgr()
{
  background(75, 100, 255, 20);
}

//----------circle----------------
void circle()
{
  fill(col);
  stroke(255, 120);
  ellipse(x, y, dia, dia);
}

//---------moveCircle--------------
void moveCircle()
{
  x = x + dirX;
  if (x > width)
  {
  dirX = -dirX;
  }
  else if (x < 0)
  {
  dirX = -dirX;
  }
  y = y + dirY;
  if (y > height)
  {
  dirY = - dirY;
  }
  else if (y < 0)
  {
  dirY = -dirY;
  }
}

//----------showSpeed------------

void speed()
{
  fill(255);
  textAlign(LEFT);
  text("Time: " + millis()/1000, 10, 360);
  text("Collisions: " +   countCollision, 10, 380);
  text("Vertical Speed: " + (int)(velY), 210, 360);
  text("Horizontal Speed: " + (int)(velX), 210, 380);
}

//-------------Needle------------

void needle()
{
  stroke(200, 200, 200);
  line(posX, posY, posX+20, posY+20);
  fill(255, 20, 20);
  stroke(255, 50, 50);
  ellipse(posX, posY, dia/5, dia/5);
}

//-------moveNeedle-------------
void moveNeedle()
{
  posX = posX + velX;
  posY = posY + velY;
}

//---------controlNeedle------------
void keyPressed()
{  
  if (key == CODED)
  { 
    if (keyCode == RIGHT)
    {
      velX   = velX + 0.05;
    }

    else if (keyCode == LEFT)
    {
      velX = velX - 0.05;
    }
    else if (keyCode == UP)
    {
      velY = velY - 0.05;
    }
    else if (keyCode == DOWN)
    {
      velY = velY + 0.05;
    }
    ////-----------Reset---------------
    
  }
}

void reset()
{
    if (keyCode == ' ')
    {
      background(75, 100, 255, 20);
      posX = width/2;
      posY = height/2;
      velX = 0;
      velY = 0;
      countCollision = 0;
    }
}

