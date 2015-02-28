
PImage pk;
int xPos;                      
int speed=1;                   
int xDir=1;                    
int score=0;                   
int lives=5;                   
boolean lost=false;            

void setup()                   
{
  size (400,400);
  pk = loadImage("http://rlv.zcache.com/boo_a_spooked_pumpkin_photo_sculpture-readc83a5f18546d380185c7cdaf459b1_x7saw_8byvr_324.jpg");
  smooth();
  xPos=200;                
  fill(255,0,0);               
  textSize(13);                
  }

void draw()                                    
{
  background (0);                                
  ellipse(xPos,xPos,40,40);                 
  xPos=xPos+(speed*xDir);                       
  if (xPos > width-20 || xPos<20)                
  {
    xDir=-xDir;      
  }
  text("score = "+score,10,10);                  
  text("lives = "+lives,width-80,10);           
  if (lives<=0)                                  
  {
    image(pk, 40, 40);
    textSize(20);
    text("Click to Restart", 125,100);
    noLoop();                                    
    lost=true;
    textSize(13);
  }
}

void mousePressed()                              
{
  if (dist(mouseX, mouseY, xPos, xPos)<=20)      
  {
    score=score+speed;                          
    speed=speed+1;                             
  }
  else                                           
  {
    if (speed<1)                                 
    {
    speed=speed-1;
    }
    lives=lives-1;                               
  }
  if (lost==true)                                 
  {
    speed=1;                                     
    lives=5;
    score=0;
    xPos=200;
    xDir=1;
    lost=false;
    loop();                                    
  }
}


