
float BY = 0;   //controls Batman's coordinates
float BX = 0; 

float JY = 0;   //controls Joker's coordinates
float JX = 0; 

float HY = 0;   //controls Harley's coordinates
float HX = 0; 

float GY = 0;   //controls Gordon's coordinates
float GX = 0;

float SY = 0;   //controls Scarecrow's coordinates
float SX = 0;

int numFrames = 13;
int frame = 0;

PImage Gordon;
PImage Joker;
PImage Harley;
PImage Scarecrow;
PImage Batman;
PImage Gotham;

float BMoveY;   //controls Batman's movements
float BMoveX; 

float SMoveY;   //control's Scarecrow's movements
float SMoveX; 

float GMoveY;   //controls Gordon's movements
float GMoveX; 

float JMoveY;   //controls Joker's movements
float JMoveX; 

float HMoveY;   //controls Harley's movements
float HMoveX; 

float maxSpeed = 3.0;   //speed
float radius = 30.0;   //range

boolean wary = false;   //Batman's wariness factor
boolean attract = false;   //Enemy attraction factor

void setup () 
{
  Gotham = loadImage ("gotham.jpg");
  //size(Gotham.width, Gotham.height);   //use for Java
  size(615, 465);   //use for JavaScript

  Gordon = loadImage("gordon.png");
  Joker = loadImage ("joker.png");
  Harley = loadImage ("harley.png");
  Scarecrow = loadImage("scarecrow.png");
  Batman = loadImage ("batman.png");
  
  BMoveX = random(-maxSpeed, maxSpeed);   //Batman's speed
  BMoveY = random(-maxSpeed, maxSpeed); 
  BX = random(radius*2, width-radius*2);   //Batman's starting position
  BY = random(radius*2, height-radius*2);
  
  SMoveX = random(-maxSpeed, maxSpeed);   //Scarecrow's speed
  SMoveY = random(-maxSpeed, maxSpeed);  
  SX = random(width-radius);   //Scarecrow's starting position
  SY = random(height-radius); 
  
  GMoveX = random(-maxSpeed, maxSpeed);   //Gordon's speed
  GMoveY = random(-maxSpeed, maxSpeed); 
  GX = random(width-radius);   //Gordon's starting position
  GY = random(height-radius); 
  
  JMoveX = random(-maxSpeed, maxSpeed);   //Joker's speed
  JMoveY = random(-maxSpeed, maxSpeed);
  JX = random(width-radius);   //Joker's starting position
  JY = random(height-radius);  
  
  HMoveX = random(-maxSpeed, maxSpeed);   //Harley's speed
  HMoveY = random(-maxSpeed, maxSpeed); 
  HX = random(width-radius);   //Harley's starting position
  HY = random(height-radius); 

  smooth(); 
  noStroke(); 
}

void draw () 
{
  background(Gotham);

  //Harley's logic
  HX += HMoveX; 
  HY += HMoveY;
  
  if (HX > width-radius || HX < radius) 
  { 
    //if Harley moves offscreen, reverse her direction
    HMoveX =- HMoveX;
  }
  
  if (HY > width-radius*8 || HY < radius) 
  {
    HMoveY =- HMoveY;
  }
  
  if (dist(JX, JY, HX, HY) < radius*7)
  {
    //if Harley is near Joker, she starts to follow him
    HX -= JMoveX;
    HY -= JMoveY;
  }
  
  if (HY > 460 || HY < -10)
  {
    HY = random(100,200);
  }
  
  if (HX > 610 || HX < -10)
  {
    HX = random(100,200);
  }
  
  image(Harley, HX, HY, radius*2, radius*2);
  //end Harley's logic
  
  //Gordon's logic
  GX += GMoveX;
  GY += GMoveY;
  
  if (GX > width-radius || GX < radius) 
  { 
    //if Gordon moves offscreen, reverse his direction
    GMoveX =- GMoveX;
  }
  
  if (GY> width-radius*8 || GY < radius) 
  {
    GMoveY =- GMoveY;
  }
  
  image(Gordon, GX, GY, radius*2, radius*2);
  //end Gordon's logic

  //Joker's logic
  JX += JMoveX; 
  JY += JMoveY;
  
  if (JX > width-radius || JX < radius) 
  { 
    //if Joker moves offscreen, reverse his direction
    JMoveX =- JMoveX;
  }
  
  if (JY > width-radius*8 || JY < radius) 
  {
    JMoveY =- JMoveY;
  }
  
  image (Joker, JX, JY, radius*2, radius*2);
  //end Joker's logic

  //Scarecrow's logic
  SX += SMoveX;
  SY += SMoveY;
  
  if (SX > width-radius || SX < radius) 
  { 
    //if Scarecrow moves offscreen, reverse his direction
    SMoveX =- SMoveX;
  }
  
  if (SY > width-radius*8 || SY < radius) 
  {
    SMoveY =- SMoveY;
  }
  
  if (SY > 470 || SY< -10)
  {
    SY = random(200,300);
  }
  
  if (SX > 610 || SX < -10)
  {
    SX = random(200,300);
  }
  
  if (dist(GX, GY, SX, SY) < radius*7)
  {
    //if Scarecrow is near Gordon, he starts to follow him
    SX -= GMoveX;
    SY -= GMoveY;
  }
  
  image (Scarecrow, SX, SY, radius*2, radius*2);
  //end Scarecrow's logic
 
  //Batman's logic
  BX += BMoveX;
  BY += BMoveY;
  
  if (BX > width-radius || BX < radius/2) 
  { 
    BMoveX =- BMoveX;
  }
  
  if (BY > width-radius*8 || BY < radius) 
  {
    BMoveY =- BMoveY;
  }
  
  if (dist(HX, HY, BX, BY) < radius*2 || dist(JX, JY, BX, BY) 
        < radius*2 || dist(SX, SY, BX, BY) < radius*2) 
  { 
    //check if Batman is near an enemy
    if (wary == false) 
    {
      //if Batman is near an enemy, reverse his direction
      BMoveY =- BMoveY; 
      BMoveX =- BMoveX;
      wary = true;
    }
  }
  else 
  {
    //Batman will remain wary until he's not near an enemy
    wary = false; 
  }
 
  image (Batman, BX, BY, radius*2, radius*2);
  //end Batman's logic

  if (frame >= numFrames) 
  {
    frame = 0;
  }
}

