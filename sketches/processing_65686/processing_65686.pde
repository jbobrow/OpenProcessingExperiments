
PImage backGroundImg;
PImage black;
PImage ship1;
PImage ship2;
PImage wallE;
PImage white;

PFont titleFont;

//title prop
int titleZ = 200;

//ship2 prop
float ship2Scale = 1;
float ship2Angle = 0;
float ship2X = 600;
float ship2Y = -50;
float ship2Speed = 1;
float ship2Velocity = 4;

//ship1 prop
float ship1Scale = 1;
float ship1Angle = PI/4;
float ship1X = 0;
float ship1Y = 0;
float ship1Speed = 50;
float ship1Velocity = -5;

//black
float blackX = -50;
float blackY = -10;
float blackAngle = 0;
float blackSpeed = 0;
float blackVelocity = 1.2;

//wallE
float walleX = 700;
float walleY = 180;
float walleScale = 0;
float walleAngle = 0;
float walleSpeed = 0;

//white
float whiteX = -150;
float whiteY = 100;
float whiteSpeed = 0;

void setup()
{
  size(600,300,P3D);
  smooth();
  
  backGroundImg = loadImage("background.png");
  
  black = loadImage("black.png");
  ship1 = loadImage("ship1.png");
  ship2 = loadImage("ship2.png");
  wallE = loadImage("wallE.png");
  white = loadImage("white.png");
  
  titleFont = loadFont("AbadiMT-CondensedExtraBold-48.vlw");
  textFont(titleFont);
  
  frameRate(60);
}

void draw()
{
  background(0);
  
  image(backGroundImg,0,0);
  
  int timeCount = millis();
  
  //title animation 1s-5s
  
  if (timeCount <= 5000)
  {
    pushMatrix();
    translate(width/2,height/2);
    
    rotateX(PI/3);
    
    pushStyle();
    
    int textAlpha;
    
    if (timeCount>3000)
    {
      textAlpha = round(map(5000-timeCount,0,2000,0,255));
    }else{
      textAlpha = 255;
    }
    
    fill(#B49619,textAlpha);
    
    text("Long long time ago...",-190,titleZ,0);
    
    popStyle();
    
    popMatrix();
    
    titleZ--;
  }
  
  //ship2 animation 3s - 5s
  
  if (timeCount > 3000 && timeCount <= 4000)
  {
    pushMatrix();
    
    translate(ship2X,ship2Y);
    
    rotate(ship2Angle);
    
    scale(ship2Scale);
    
    image(ship2,-130,-50,250,150);
    
    popMatrix();
    
    ship2X -= ship1Speed;
    ship2Y += 10;
    ship2Speed += ship1Velocity;
    ship2Scale += .05;
    ship2Angle += PI/180;
  }
  
  //ship1 animation 4s - 7s
  
  if (timeCount > 3500 && timeCount <= 5500)
  {
    pushMatrix();
    
    translate(ship1X,ship1Y);
    
    rotate(ship1Angle);
    
    scale(ship1Scale);
    
    image(ship1,-350/4,-200/4,200,150);
    
    popMatrix();
    
    ship1X += 25;
    ship1Y += ship1Speed;
    ship1Speed += ship1Velocity;
    
    ship1Angle -= PI/2/20;
    ship1Scale = 1+ship1Y/1000;
  }
  
  
  //black
  if (timeCount >5000 && timeCount <= 15000)
  {
    pushMatrix();
    
    if(timeCount <= 5500)
    {
      blackX += 10;
      blackY += blackSpeed;
      blackSpeed += blackVelocity;
      
      blackAngle += 2*PI*(timeCount-5000)/5000;
    }
    
    if (timeCount > 5500 && timeCount<=10000)
    {
      blackAngle = 2*PI;
      
      blackSpeed = 0;
    }
    
    if (timeCount > 5500 && timeCount <= 5800)
    {
      translate(random(-2,2),random(-2,2));
    }
    
    if (timeCount > 10000 && timeCount <= 10600)
    {
      blackX += blackSpeed;
      blackSpeed += 1.3;
    }
    if (timeCount >10600 && timeCount <= 10800)
    {
      blackX -= blackSpeed;
      blackSpeed -= 2.5;
    }
    
    if (timeCount >11500)
    {
      blackX += blackSpeed;
      blackSpeed += 2;
    }
    
    translate(blackX,blackY);
    
    rotate(blackAngle);
    
    image(black,-85/2,-135/2,200/2,267/2);
    
    popMatrix();
    
  }
  
  //wall E
  if (timeCount > 6000 && timeCount <= 20000)
  { 
    pushMatrix();
    
    if (timeCount < 10000)
    {
        walleX -= abs(3*sin(walleSpeed));
        walleSpeed +=.05;
    }
    
    if (timeCount > 10600 && timeCount <= 15000)
    {
      walleX += 10;
      walleY -= 10;
      walleAngle += PI/10;
    }
    
    translate(walleX,walleY);
    rotate(walleAngle);
    
    
    image(wallE,-290/4,-300/4,600/4,700/4);
    
    popMatrix();
  }
  
  if (timeCount > 12000)
  {
    pushMatrix();
    
    translate(whiteX,whiteY);
    
    whiteX += 5;
    
    whiteY -= 5*sin(whiteSpeed)+random(-2,2);
    whiteSpeed += .5;
    
    image(white,0,0,150,200);
    
    popMatrix();
  }
  
}

