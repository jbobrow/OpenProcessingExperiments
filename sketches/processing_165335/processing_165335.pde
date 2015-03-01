
PImage spritePic;
float xSprite;
float ySprite;


float xPrize;
float yPrize;


float xPrize2;
float yPrize2;

float xPrize3;
float yPrize3;


PFont font ;
float score;

float xBad;
float yBad;

float xBad2;
float yBad2;

float xBad3;
float yBad3;

void setup(){
  size (800 ,800 );
 
  spritePic = loadImage("alien.png");
  xSprite= 0;
  ySprite= 0;
  
  xPrize = random (20 , width-20 );
  yPrize = height ;
  xPrize2 = random (20 , width-20 );
  yPrize2 = height ;
  font =loadFont ("CharterBT-Bold-48.vlw");
  textFont(font , 32);
  score = 0;
  
  yBad=height;
  xBad=random(20,width-20);
  
  yBad2=height;
  xBad2=random(20,width-20);
  
  yBad3=height;
  xBad3=random(20,width-20);
  
}

void draw (){
  background(111,219,245);
  drawSprite();
  moveSprite();
  drawPrize();
  movePrize();
  collision();
  drawScore();

  drawPrize2();
  movePrize2();
  
  
  drawPrize3();
  movePrize3();

  drawBad();
  moveBad();
  collisionBad();

  drawBad2();
  moveBad2();
    drawBad2();
  moveBad2();
    drawBad2();
  moveBad2();
    drawBad3();
  moveBad3();
  
}

void drawSprite (){
  image(spritePic, xSprite, ySprite , 100,100);
  
  
}

void moveSprite (){
  xSprite = mouseX;
  if (xSprite > width )
  {
    xSprite = 0;
  }
  ySprite =mouseY;
}

void drawPrize (){
  fill(8 , 33 , 253 );
  ellipse (xPrize , yPrize ,50,50);
}

void movePrize(){
yPrize = yPrize -6; 
if( yPrize < 0 )
{
  yPrize = height ;
  xPrize = random ( 20 , width -20 );
  
} 
}

void movePrize2(){
yPrize2 = yPrize2 -10; 
if( yPrize2 < 0 )
{
    yPrize2 = height ;
  xPrize2 = random ( 20 , width -20 );
  
} 
}

void drawPrize3 (){
  fill(8 , 33 , 253 );
  ellipse (xPrize3 , yPrize3 ,50,50);
}

void movePrize3(){
yPrize3 = yPrize3 -6; 
if( yPrize3 < 0 )
{
  yPrize3 = height ;
  xPrize3 = random ( 20 , width -20 );
  
} 
}
  
void collision(){
  if(abs (xSprite-xPrize)<40
  &&
  abs(ySprite-yPrize)<40)
{
  yPrize = height ;
  xPrize = random (20 , width - 20 );
score=  score +1;
}

  if(abs (xSprite-xPrize2)<40
  &&
  abs(ySprite-yPrize2)<40)
{
  yPrize2 = height ;
  xPrize2= random (20 , width - 20 );
score=  score +1;
}
if(abs (xSprite-xPrize3)<40
  &&
  abs(ySprite-yPrize3)<40)
{
  yPrize3 = height ;
  xPrize3 = random (20 , width - 20 );
score=  score +1;
}}

void drawScore(){
  text("Mr.bob Prizeee"+  score , 30 ,30);
}

void drawPrize2 (){
  fill(96 , 166 , 222 );
  rect (xPrize2 , yPrize2 ,60,60 );
}

void drawBad() {
  fill(0,0,0);
  ellipse(xBad, yBad, 14,10);
}

void drawBad2(){
fill(0,0,0);
  ellipse (xBad2 , yBad2 , 14,10 );
}
void drawBad3(){
fill(0,0,0);
  ellipse (xBad3 , yBad3 , 14,10 );
}

void moveBad (){
  yBad =yBad -2;
  if (yBad <0)
{
yBad =height ;
xBad = random (20,width - 20);
}
}
  
  void moveBad2 (){
  yBad2 =yBad2 -5;
  if (yBad2 <0)
{
yBad2 =height ;
xBad2= random (20,width - 20);
}
}
  void moveBad3 (){
  yBad3 =yBad3-5;
  if (yBad3 <0)
{
yBad2 =height ;
xBad2= random (20,width - 20);
}
  }
  
  void collisionBad(){
   if (abs(xSprite - xBad )<40
  &&
  abs(ySprite-yBad)<40)
  {
    yBad = height;
    xBad=random(20,width - 20);
    score=score -1;
  }

  if (abs(xSprite - xBad2 )<40
  &&
  abs(ySprite-yBad2)<40)
  {
    yBad2 = height;
    xBad2=random(20,width - 20);
    score=score -1;
  }
 if (abs(xSprite - xBad3 )<40
  &&
  abs(ySprite-yBad3)<40)
  {
    yBad3 = height;
    xBad3=random(20,width - 20);
    score=score +1;
  }
  }
  

 


