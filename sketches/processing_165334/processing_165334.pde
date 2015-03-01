
PImage spritePic;
float xSprite;
float ySprite;


float xPrize;
float yPrize;

PFont font ;
float score;

PImage badPic;
float xBad;
float yBad;

PImage badPic2;
float xBad2;
float yBad2;

PImage badPic3;
float xBad3;
float yBad3;

PImage badPic4;
float xBad4;
float yBad4;

void setup(){
  size (1000 , 1000);
  spritePic = loadImage("apsgames.png");
  xSprite=0;
  ySprite=0;
  
   badPic = loadImage("puisumgame3.png");
  xBad= 0;
  yBad= 0;
  
    badPic4 = loadImage("puisumgame3.png");
  xBad= 0;
  yBad= 0;
  
   badPic2 = loadImage("puisumgame4.png");
  xBad2= 0;
  yBad2= 0;
  
  badPic3 = loadImage("puisumgame4.png");
  xBad2= 0;
  yBad2= 0;
}

void draw (){
  background (203,224,255);
    drawSprite ();
  moveSprite();
 drawBad();
 moveBad();
 drawBad2();
 moveBad2();
 drawBad3();
 moveBad3();
  drawBad4();
 moveBad4();
 
 collisionBad();
 drawScore();
}

void drawSprite (){
image( spritePic , xSprite , ySprite ,100,100 );
}
  
  void moveSprite(){
     if ((keyPressed )&&(key ==CODED)){
    if (keyCode==LEFT){
      xSprite--;
      xSprite--;
      xSprite--;
      xSprite--;
    }
    if (keyCode==RIGHT){
      xSprite++;
      xSprite++;
      xSprite++;
      xSprite++;
      xSprite++;
    }
    if (keyCode==UP){
      ySprite --;
      ySprite --;
      ySprite --;
      ySprite --;
      ySprite --;
    }
    if (keyCode ==DOWN){
    ySprite ++;
    ySprite ++;
    ySprite ++;
    ySprite ++;
    ySprite ++;
    ySprite ++;
    
    }
     }
  }
  
  void drawBad(){
 image (badPic , xBad, yBad ,60,60);
}
 void drawBad2(){
 image (badPic2 , xBad2, yBad2 ,60,60);
}
 void drawBad3(){
 image (badPic3 , xBad3, yBad3 ,60,60);
}
 void drawBad4(){
 image (badPic4 , xBad4, yBad4 ,60,60);
}
void moveBad (){
  yBad =yBad -3;
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
  
void moveBad3(){
  yBad3 =yBad3 -7;
  if (yBad3 <0)
  {
yBad3 =height ;
xBad3= random (20,width - 20);
}
  }
  void moveBad4(){
  yBad4 =yBad4 -7;
  if (yBad4 <0)
  {
yBad4 =height ;
xBad4= random (20,width - 20);
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
   if (abs(xSprite - xBad4 )<40
  &&
  abs(ySprite-yBad4)<40)
  {
    yBad4 = height;
    xBad4=random(20,width - 20);
    score=score +1;
  }
}

    void drawScore(){
      fill(10, 20, 30);
  text("Mr.Pui Prizeee"+  score , 30 ,30);
    }



