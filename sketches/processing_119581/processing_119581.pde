
//Colleen Clifford Homework 8
//Copyright Colleen Clifford, Pittsburgh PA Oct. 2013

float tx, ty, twd, tht, tSpeed;
float cx, cy, cwd, cht, cSpeed;
float px, py, pwd, pht, pxSpeed, pySpeed;
PImage p, t, c;
int collision;


void setup()
{
 //road and grass
 size(600, 600);
 rectMode (CENTER); 
 background(157, 242, 170);
 fill (50);
 noStroke();
 pushMatrix();
 shearY(PI/6);
 rect(width/2, height*.25, width, height);
 popMatrix();
 frameRate(50); 
 
 c=loadImage("car.png");
 t= loadImage("truck.png");
 p = loadImage("pig.png");
 
 cx= width;
 cy= height;
 px= 0;
 py= height*.75;
 pxSpeed = 3;
 pySpeed = 3;
 collision = 0;
 
}

void draw()
{ 
  prepScreen();
  countDown();
  moveTruck();
  truck(); 
  moveCar();
  car();
  movePig();
  pig ();
  checkCollision();
  showStats();
}

void showStats()
{
  text ("score:", width*.75, height*.15);
  text ("time left: ", width*.75, height*.2);
  text ( 30-frameCount/50, width*.87, height*.2);
  text (100- collision, width*.85, height*.15);
  
  if (100- collision <= -1)
  {
    noLoop();
    textSize(48);
    text( "YOU LOSE GAME OVER", width/2, height/2);
  }
  
  if (frameCount == 1500)
  {
    noLoop();
    text( "CONGRATS! YOU WON", width/2, height/2);
  }
}

void checkCollision()
{
float d = dist (px, py, cx, cy);
float d2 = dist (px, py, tx, ty);
  if (d < pwd*.25 + cwd*.5)
  {
    px= px-6;
    py= py+3;
    collision ++;
  }
  
  if (d2 < pwd*.25 + twd*.5)
  {
    px= px+3;
    py= py+4;
    collision ++;
  }
}
  
void countDown()
{
  fill(0);
  stroke(0);
  textSize(60);
  if (frameCount < 50)   text ( "3", width/2, height/2);
  else if (frameCount >50 && frameCount <100)   text( "2", width/2, height/2);
  else if (frameCount >100 && frameCount <150)   text( "1", width/2, height/2);
  
  textSize(20);
  textAlign(CENTER);
  if (frameCount < 150)  
  {
    text ( "Use the 't' key to slow down the blue truck", width/2, height*.75);
    text ( "and 'c' to slow down the red car", width/2, height*.8);
    text ( "so that the pig can cross the road", width/2, height*.85);
  }
}

void keyPressed()
{
  if (key== 't')
  {
    tSpeed= tSpeed*.1;
  }
  
  if (key== 'c')
  {
    cSpeed= cSpeed*.1;
  }
}

void movePig()
{
  if (frameCount > 150)
  {
    px= px+pxSpeed;
    py= py-pySpeed;
    
    if (px > width- pwd*.5 || px < -pwd*.5)  
    {
     pxSpeed= -pxSpeed; 
     //px+= pxSpeed;
     //py+= pySpeed;
    }
    if (py > height- pht*.5 || py < -pht*.5)  
    {
     pySpeed= -pySpeed;
     //px+= pxSpeed;
     //py+= pySpeed;
    }
  }
}

void moveCar()
{
  cx= cx - cSpeed;
  cy= cy - cSpeed;
  cSpeed= random (7, 12);
  if (cx < 0)
  {
    cx= width;
    cy= random(height*.5, height*1.5);
  }
  if (cy < 0)
  {
    cy= random(height*.5, height*1.5);
    cx= width;
  }
}

void moveTruck()
{
  tx= tx+ tSpeed;
  ty= ty+ tSpeed;
  tSpeed= random (7, 12);
  if (tx > width)
  {
    tx= 0;
    ty= random(-height*.25, height*.5);
  }
  if (ty > height)
  {
    ty= random(-height*.25, height*.5);
    tx= 0;
  }
}

void car()
{
  cwd= width/6;
  cht= height/6;
  image(c, cx, cy, cwd, cht);
}

void truck()
{
  twd= width/6;
  tht= height/6;
  image(t, tx, ty, twd, tht);

}

void pig()
{
  pwd= width/4;
  pht= height/4; 
  image(p, px, py, pwd, pht);
}

void prepScreen()
{
 noStroke();
 background(157, 242, 170);
 pushMatrix();
 fill (100, 200);
 shearY(PI/4);
 translate(0, -120);
 rect(width/2, height*.25, width, height); 
 popMatrix();
 
}



