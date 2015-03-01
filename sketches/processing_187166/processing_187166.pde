
int a = 255;
PImage DOGE1,DOGE2,DOGE3,fly; 

void setup()
{
  size(432,720);
  noCursor();
  String DOGE1url = "http://i.imgur.com/HqSRYM9.png";
  String DOGE2url = "http://i.imgur.com/FIweWsY.png";
  String DOGE3url = "http://i.imgur.com/o9qSseu.png";
  String flyurl = "http://i.imgur.com/H4PHVDa.png";
  DOGE1 = loadImage(DOGE1url);
  DOGE2 = loadImage(DOGE2url);
  DOGE3 = loadImage(DOGE3url);
  fly = loadImage(flyurl);
  
}

void draw()
  {
     background(255);
     imageMode(CORNER); image(DOGE1,-1,-1);
     
     fly();
  }
void mouseReleased()
  { 
    if (mouseButton==LEFT)
      {
        background(255);
        
        imageMode(CORNER);
        image(DOGE2,0,0);
      }
   }
  
void mouseMoved()
  {
    imageMode(CORNER);
    image(DOGE3,0,0);    
  }

void fly()
{
  imageMode(CENTER); image(fly,mouseX,mouseY);
}
