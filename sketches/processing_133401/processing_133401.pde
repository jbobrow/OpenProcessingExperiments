

float x=0,y=0,h=0;
int move1= 0, move2 =0, move3=0;
int ende =0;
int score = 0;
int wtfmode= 0;
int highscore = 0;

PImage wtf;
PImage Pen;

float aa, ab, ba, bb,ca,cb;

void setup()
{
  background(0);
  size(500,700);
   wtf = loadImage("14k.png");
   Pen = loadImage("pen.jpg");
}

void draw()
{ 
  
  
  if (keyPressed){
   if(key == 'r')
   {
  move1= 0;
  move2 =0;
  move3 = 0;
  x=0;
  y=0;
  h=0;
  ende=0;
  score=0;
   }
   
   if(key == 'w') wtfmode = 1;
}
  

if (ende == 1)
{

    if (keyPressed){
   if(key == 'r')
   {
  move1= 0;
  move2 =0;
  move3 = 0;
  x=0;
  y=0;
  h=0;
  ende=0;
  score=0;
   }
   
    }
    return;
}
  background(0);
textSize(50);
fill(255,0,0);
text(score,10,50);

  fill(255);
  if(wtfmode ==0) rect(250,height/2+h,40,40); 

  
  
  
  if(move1 == 1)
  {
  aa = random(0,500);
  ab = aa + 180;
  }
  
  rect(500-move1,0,75,aa);
  rect(500-move1,ab,75,500);
  
  
    
  if(500-move1 < 290 && 500-move1 >165){
if (height/2+h < aa || height/2+h > ab-40){
  textSize(90);
  fill(255,0,0);
  text("Game Over",10,300);
  textSize(50);
  text("highscore:", 10,400);
  text(highscore ,300,400);
  ende=1;
  
}
  }
  if (move1 == 725) move1 = 0;
  move1++;
  
  if (move1 == 250 || move2 == 500) score++;
 
  
  
  
  
  
    if(move2 == 1)
  {
  ba = random(0,500);
  bb = ba + 180;
  }
  
  rect(750-move2,0,75,ba);
  rect(750-move2,bb,75,500);
  
  
    
  if(750-move2 < 290 && 750-move2 >165){
if (height/2+h < ba || height/2+h > bb-40){
  textSize(90);
  fill(255,0,0);
  text("Game Over",10,300);
  textSize(50);
  text("highscore:", 10,400);
  text(highscore ,300,400);
  ende=1;
  
}
  }
  if (move2 == 975)
  {
  move2 = 250;
  ba = random(0,500);
  bb = ba + 180;
  }
  move2++;
  
  
  if (move2== 750) score++;
  
  
      if(move3 == 1)
  {
  ca = random(0,500);
  cb = ca + 180;
  }
  
  rect(1000-move3,0,75,ca);
  rect(1000-move3,cb,75,500);
  
  
    
  if(1000-move3 < 290 && 1000-move3 >165){
if (height/2+h < ca || height/2+h > cb-40){
  textSize(90);
  fill(255,0,0);
  text("Game Over",10,300);
  textSize(50);
  text("highscore:", 10,400);
  text(highscore ,300,400);
  ende=1;
  
}
  }
  if (move3 == 1225)
 {
  move3 = 500;
  ca = random(0,500);
  cb = ca + 180;
 }
  move3++;
 
  
  
  
  
  
 x=x+y;
 
 if(y<30) y++;
 
 h = x/4;
 
 if (y > 40)
 {
   y = 40;
 }
  
   if (y < -30)
 {
   y= -30;
 }
 
 if (wtfmode==1)
 {
   background(0); 
   image(wtf, 250,height/2+h);
   image(Pen, 500-move1,aa+190);
   image(Pen, 500-move1,aa-1150);
   
   image(Pen, 750-move2,ba+190);
   image(Pen, 750-move2,ba-1150);
   
    image(Pen, 1000-move3,ca+190);
   image(Pen, 1000-move3,ca-1150);
   
   

   
   
   
   
 }
 
 
 
 
 
 
  if (score >= highscore) highscore = score; 
 
  text(score,10,50);
}

void mousePressed() {
  
  y-=50;
}


