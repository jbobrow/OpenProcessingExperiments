
//Copyright Talha Aamir 2014

float x, y;
float wd, ht;
float easingCoef;
float xDist, yDist;
float diameter;

float hatR;
float hatG;
float hatB;

//bullet
float bulletX, bulletY;
float bulletWidth, bulletHeight;

//missile
float missileX, missileY;
float bodyWidth, bodyHeight;

//boomerang
float boomX, boomY;
float boomWidth;
float boomCoef;

//bomb
float bombX, bombY;
float bombDiameter;
int bombR;
int bombG;
int bombB;

boolean cannonShoot;
boolean missileShoot;
boolean boomerangThrow;
boolean bombPlace;

int cycle;
int index;
int time;
int wait;

void setup()
{
  size(400, 400);
 // noCursor();
  easingCoef = .05;
  boomCoef = .1;
  background(255); //can fix later
  wd = 100;
  ht = 100;  
  diameter = 55;
  
  cannonShoot = false;
  missileShoot = false;
  boomerangThrow = false;
  bombPlace = false;

  bulletWidth = .2*wd;
  bulletHeight = .2*ht;
  
  bodyWidth = .25*wd;
  bodyHeight = .1*ht;
  
  boomWidth = .1*wd;
  
  bombDiameter = 75;
  
  cycle = 1;
  
  index = 0;
  
  //time = millis();
  wait = 750;
  
  bombR = 0;
  bombG = 0;
  bombB = 0;
  
  hatR = 0;
  hatG = 0;
  hatB = 255;
}

void draw() 
{
  background(255);
  noStroke();
  fill(255);
  rect(0, 0, width, height);
  //x = mouseX;
  //y = mouseY;
  xDist = mouseX-x;
  yDist = mouseY-y;
  x = x + xDist*easingCoef;
  y = y + yDist*easingCoef;
  
  //character
  stroke(0);
  //hat
  fill(hatR, hatG, hatB);
  triangle(x - .2*wd, y - .4*ht, x, y - .6*ht, x + .2*wd, y - .4*ht);
    
  //head
  fill(255);
  rect(x - .2*wd, y - .4*ht, .4*wd, .4*ht);

  //body
  rect(x - .1*wd, y, .2*wd, .4*ht);
  
  //arm
   rect(x, y + .1*ht, .2*wd, .1*ht);
   
   //cannon
   rect(x + .2*wd, y + .05*ht, .23*wd, .2*ht);
   
   //shooter
   rect(x + .43*wd, y + .1*ht, .075*wd, .1*ht);
  
  //wheel tire
  ellipse(x, y + .65*ht, diameter, diameter);
  
  //shooting cannon
  if(cannonShoot == true)
  {
    //draw bullet
    ellipse(bulletX, bulletY, bulletWidth, bulletHeight);
    
    //move bullet
    bulletX = bulletX + 10;
  }
  
  //shooting missile
  if(missileShoot == true)
  {
    //draw missile
    //body
    rect(missileX, missileY, bodyWidth, bodyHeight);
    //head
    triangle(missileX + bodyWidth, missileY - .05*ht, missileX + bodyWidth + .2*wd, missileY + .05*ht, missileX + bodyWidth, missileY + .15*ht);
    
    //move missile
    missileX = missileX + 15;
  }
  
  //throwing boomerang **NEED TO FIX**
  if(boomerangThrow == true)
  {
    //draw boomerang
    quad(boomX, boomY -.05*ht, boomX + boomWidth, boomY + .05*ht, boomX, boomY + .15*ht, boomX + .5*boomWidth, boomY+.05*ht);
    
    if(index < 25) //while
    {
      boomX = boomX + 5;
      index++;
    }
    if(index >= 25)
    {
      boomX = boomX + xDist*boomCoef;
      //boomX = boomX-5; //x + .5*wd
      boomY = boomY + yDist*boomCoef;
      //index = 0;
     // println(index);
      if(boomX == mouseX && boomY == mouseY)
      {
        index = 0;
        println("SUCCESS");
      }
    }
    
  }
  
  //placing bomb
  if(bombPlace == true)
  {
    //draw bomb
    fill(bombR, bombG, bombB);
    ellipse(bombX, bombY, bombDiameter, bombDiameter);
    //time = millis();
    
    //timer and explode
    if(millis() - time >= wait)
    {
      bombR = 255;
      bombG = 255;
      fill(bombR, bombG, bombB);
      ellipse(bombX, bombY, bombDiameter, bombDiameter); 
      //time = millis();
    }
    if(millis() - time >= wait*2) 
    {
      bombR = 255;
      bombG = 0;
      fill(bombR, bombG, bombB);
      ellipse(bombX, bombY, bombDiameter, bombDiameter);
    }
    
    if(millis() - time >= wait*3)
    {
      background(255, 0, 0);
      bombPlace = false;
      //time = millis();
    }
  
  }
}

//shoots cannon
void mousePressed()
{
  cannonShoot = true;
  
  //location tethered to shooter
  bulletX = x + .5*wd;
  bulletY = y + .175*ht;
  
}

//shoots secondary weapon
void keyPressed()
{
  //secondary items and locations tethered
  if(cycle == 1) //missile
  {
    missileShoot = true;
    boomerangThrow = false;
    bombPlace = false;
    
    missileX = x + .5*wd;
    missileY = y + .115*ht;
  }
  
  if(cycle == 2) //boomerang
  {
    missileShoot = false;
    boomerangThrow = true;
    bombPlace = false;
    
    boomX = x + .5*wd;
    boomY = y + .115*ht;
  }
  
  if(cycle == 3) //bomb
  {
    missileShoot = false;
    boomerangThrow = false;
    bombPlace = true;
    
    bombX = x + .65*wd;
    bombY = y + .6*ht;
    
    time = millis();
    
  }
}

void mouseWheel(MouseEvent event)
{
  float e = event.getAmount();
  //println(e); //prints 1 for down one, -1 for up one
  cycle = cycle + (int) e;
  
  if(cycle > 3)
  {
    cycle = 1;
  }
  else if(cycle < 1)
  {
    cycle = 3;
  } 
  
  //changes color of hat
  if(cycle == 1) //missile
  {
    hatR = 0;
    hatG = 0;
    hatB = 255;
  }
  
  if(cycle == 2) //boomerang
  {
    hatR = 0;
    hatG = 255;
    hatB = 0;
  }
  
  if(cycle == 3) //bomb
  {
    hatR = 255;
    hatG = 0;
    hatB = 0;
  }
  
  println(cycle); //to test cycle
}


