
int a = 0;
float b = 0;
float c = 0;
int score = 0, highscore;
int round = 0;
int timer = 0;
float now =0,now2=0;
boolean wait = true;

int hit = 0;

int xory=1, ok;

float x,y;

int lifes = 5;

int rot=-90;
void setup()
{
background(0);
  size(720, 720);
  x = random(40);
 smooth();
  y = random(40);
  noCursor();
}

void draw()
{ 
  if (hit ==1) 
  {
             while(wait == true)
       {
         if (now < millis()-1000) wait = false;
       }
  }
  hit=0; 
    
  now = millis();
  
  if (lifes == 0)
 {
  score = 0;
  lifes = 5;
 }
    background(0);
 
 fill(255,0,0);
 
if ( score < 10)
{
  b+=0.01;
  a+=1;
}

if ( score >= 10)
{
  b+=0.02;
  a+=2;
}

if ( score >= 50)
{
  b+=0.04;
  a+=4;
}

  fill(255);
  translate(360,360);
  rotate(radians(a));
  scale(b*b);
  rect(-50,-50,100,100);
  fill(0);
  rect(x,y,10,10);
  
  scale(1/(b*b));
  fill(255,0,0); 
  rotate(radians(-a)); 
  translate(-360,-360);
  
 textSize(50);
 text("Score:",20,50);
 text(score,180,50);
  text("Lifes:",500,50);
 text(lifes,640,50);
  text("Highscore:",20,100);
 text(highscore,300,100);
  ellipse(mouseX,mouseY,30,30);
  translate(360,360);
 rotate(radians(-rot));
 textSize(100);
 
 
 
 
  if (b > 2.69)
  
 
{
  wait = true;
  
  if (round == 0)
  {
   if( mouseX-360 < y*7.2+(5*7.2)-30 || mouseX-360 > y*7.2+(5*7.2)+30 )
     {       
       hit=1;   
       lifes--;
      round++;
if (round == 4) round = 0;
b = 0;
x = random(-40,40);
y = random(-40,40);
rot= rot -90;
return;
       
     }
    if( mouseY-360 < -1*(x*7.2+(5*7.2)) - 30  || mouseY-360 > -1*(x*7.2+(5*7.2)) + 30)
     {
      
      lifes--;
       hit=1; 
      round++;
if (round == 4) round = 0;
b = 0;
x = random(-40,40);
y = random(-40,40);
rot= rot -90;
return;
    }
  }


  if (round == 1)
  {
  if( mouseX-360 < -1*(x*7.2+(5*7.2))-30 || mouseX-360 > -1*(x*7.2+(5*7.2))+30 )
     {
       lifes--;
        hit=1; 
       round++;
if (round == 4) round = 0;
b = 0;
x = random(-40,40);
y = random(-40,40);
rot= rot -90;
return;       
     }
     
    if( mouseY-360 < -1*(y*7.2+(5*7.2)) - 30  || mouseY-360 > -1*(y*7.2+(5*7.2)) + 30)
     {
      
      lifes--;
      hit=1; 
      round++;
if (round == 4) round = 0;
b = 0;
x = random(-40,40);
y = random(-40,40);
rot= rot -90;
return;
    }
  }


  if (round == 2)
  {
   if( mouseX-360 < -1*(y*7.2+(5*7.2))-30 || mouseX-360 > -1*(y*7.2+(5*7.2))+30 )
     {
       lifes--;
       hit=1; 
       round++;
if (round == 4) round = 0;
b = 0;
x = random(-40,40);
y = random(-40,40);
rot= rot -90;
return;
       
     }
    if( mouseY-360 < x*7.2+(5*7.2) - 30  || mouseY-360 > x*7.2+(5*7.2) + 30)
     {
      
     hit=1; 
      round++;
if (round == 4) round = 0;
b = 0;
x = random(-40,40);
y = random(-40,40);
rot= rot -90;
return;
    }
    
  }


  if (round == 3)
  {
   if( mouseX-360 < x*7.2+(5*7.2)-30 || mouseX-360 > x*7.2+(5*7.2)+30 )
     {
       lifes--;
       hit=1; 
       round= 0;
if (round == 4) round = 0;
b = 0;
x = random(-40,40);
y = random(-40,40);
rot= rot -90;
return;
       
     }
    if( mouseY-360 < y*7.2+(5*7.2) - 30  || mouseY-360 > y*7.2+(5*7.2) + 30)
     {
      
      lifes--;
       hit=1; 
      round=0;
if (round == 4) round = 0;
b = 0;
x = random(-40,40);
y = random(-40,40);
rot= rot -90;
return;
    }
  }



round++;
score++;
if (highscore < score) highscore = score;
if (round == 4) round = 0;
b = 0;
x = random(-40,40);
y = random(-40,40);
rot= rot -90;
return;

}  
  
}




