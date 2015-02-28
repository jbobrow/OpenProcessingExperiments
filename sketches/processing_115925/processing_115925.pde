
PImage img; 
PImage img2;
PImage img3;
PImage img4;
PImage img5;

PFont font;

int H= hour ();
int M= minute ();
int S= second ();

int lastSecond;
int lastMinute;
int lastHour;

Boolean awake = false;

void setup()
{
  size(500, 375);
  img = loadImage ("sleep.png");
  img2 = loadImage ("awake.png");
  img3 = loadImage ("work.png");
  img4 = loadImage ("rest.png");
  img5 = loadImage ("pressN.png");
  
  font = loadFont("napfont.vlw");
}

void draw()
{
  background(248, 245, 239);
  imageMode(CENTER);
  image(img5, 250, 50);
  naptime(80, 125);
  worktime(280, 125);
  
  if(awake)
  {
  image(img2, 150, 250);
  image(img3, 350, 250);
  }
  else
  {
  image(img, 150, 250);
  image(img4, 350, 250);
  }
  
  int s = second();
  int m = minute();
  int h = hour();
 
 /*
  if (m != lastMinute)
  {
    lastMinute = m;
    
    if(awake == true)
      {
      M++;
      }
      
      if(M>60)
      M = 0;
 
  }
  */
  
  //if the second was updated then do something once
  if (s != lastSecond)
  {
    
    lastSecond = s;
    
    if(awake == true)
      S++;
    
    if(S>=60)
      {
      S = 0;
      
      M++;
      
      if(M>=60)
        {
          M=0;
          H++;
          
          if(H>12)
            H=0;
        }
      
      }
  }
  
  
  
  
  
      
  
  
  
 /*
if(keyPressed == true)
   {
   if (key == ' ')
   {
   image(img, 150, 250);
   image(img4, 350, 250);
   }
   }*/

}


void keyPressed()
{
  if (key == ' ')
  {

    if (awake == true)
      awake = false;
    else
      awake = true;
  }
}


void naptime (int x, int y)
{
  
  fill (232, 219, 198);
  
  textFont(font, 36);
  text(H + " : " + M + " : " + S, x, y);
}

void worktime(int x2, int y2)
{
  
  fill(232, 219, 198);
  
  textFont(font, 36);
  text(hour() + " : " + minute() + " : " + second(), x2, y2);
}



