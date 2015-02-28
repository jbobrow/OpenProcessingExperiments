
int millisRolloverTime;
int prevSec;
PImage base;

void setup()
{
  size(800,800);
  smooth();
  base = loadImage("base.png");
  noStroke();

}
 
void draw()
{
  background(#414141);
  image(base,0,0);
    
  int mil = millis()-millisRolloverTime;
  int s = second();
  int m = minute();
  int h = hour();
  
  //millisecond correction------------------------------
  if (prevSec != s) 
  {
    millisRolloverTime = millis();
  }
 
  prevSec = s;
  //----------------------------------------------------
  
  float milisMap = map(mil%1000,0, 1000,0, 800);
  float sMap = map(second(), 0, 60, 0, 100) ;
  float mMap = map(minute(), 0, 60, 0, 150);
  float hMap = map(hour() % 12, 0, 12, 0, 200);
  
  //Seconds---------------------------------------------
  
  if(s%2!=0)
  {
    fill(#FF1F5B);
    rect(406,587-mil/50,33,mil/50);
  }
  
  if(s%2==0)
  {
    fill(#FF1F5B);
    rect(406,567+mil/100,33,20-(mil/100));
  }
  
  //Minutes---------------------------------------------
  fill(#52c299);
  rect(297,578-m*2,60,m*2);
  for(int i = 0; i<m+26; i++)
  {
    fill(82-i,194-i,153);
    rect(297,(578-m*2)+i,60,1);
  }
  
  //Hours-----------------------------------------------
 
  fill(#99cc66);
  rect(102,573-h*16,129,h*16);
  
  for(int i = 0; i<h*16; i++)
  {
    fill(153-i,204-i,102-i/3);
    rect(102,(573-h*16)+i,129,1);
  }
  
  //Event-----------------------------------------------
    fill(100+mil/10,200+mil/10,210);
 
 
  ellipse(598,515,180,180);
  fill(#2b3138);
  rect(538,582,125,5);
  
  //Bubbles--------------------
  float x = round(random(580,600));
  float y = round(random(m*2,590-m*2));
  float sz = round(random(2, 25));
  fill(#DDFFB2);
  ellipse(x,y,sz,sz);
  fill(255);
  ellipse(x+1,y-1,sz/2,sz/2);
  
  //highlights------------------
   fill(#D0E5E3);
  rect(220,250,3,220);
  rect(220,480,3,20);
  
  rect(353,440,3,100);
  rect(353,550,3,10);
  
  rect(437,565,2,15);
  rect(437,584,2,3);
  
}

