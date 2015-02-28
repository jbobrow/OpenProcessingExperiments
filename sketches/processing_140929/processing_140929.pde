
// Original Code: http://processing.flosscience.com/processing-for-android/macul-2012/simple-game-code.
int xPos;                      
int speed=1;                   
int xDir=1;                    

int score=0;                   
int lives=5;                   

float timer = 1;

boolean lost=false;            

void setup()                  
{
size (400,400);
smooth();
xPos=width/2;                             
textSize(13);                
}
void draw()                                      
{
background (0);                                
ellipse(xPos, height/2,40,40);                  
xPos=xPos+(speed*xDir);                        
  if (xPos > width-20 || xPos<20)                
  {
  xDir=-xDir;                                  
  }
  text("score = "+score,10,10);                 
  text("lives = "+lives,width-80,10);            
  text("TIME: " + (int)timer, 180, 10);  
  timer = timer - (1.0 / 30.0);  
    if (lives<=0)                               
    {
    textSize(20);
    text("You've Lost. Click to Restart", 100,100);
    noLoop();                                   
    lost=true;
    textSize(13);
    }
      if (score>=100)                               
      {
      textSize(20);
      text("You've Won! Click to Restart", 100,100);
      noLoop();                                   
      lost=true;
      textSize(13);
    }
        if (timer == 1)
        {
        timer = timer + .1 / 30.0;
        }
          if (timer <= -30)
          {
          textSize(20);
          text("You've Lost. Click to Restart", 100,100);
          noLoop();                                   
          lost=true;
          textSize(13);
          }
            if (score==55)                               
            {
            textSize(20);          
            text("BONUSSS", 100,300);
            textSize(13);
            score=score+1;
            lives=lives+1;
            speed=speed-4;
            }            
}

void mousePressed()                              
{
  if (dist(mouseX, mouseY, xPos, 200)<=20)      
  {
  score=score+speed;                          
  speed=speed+1;                              
  {
  rect(0, 0, 400, 400);
  fill(0, 255, 0);
  }
}  
  else                                           
  {
    if (speed<1)                                 
    {
    speed=speed-1;
    }
    lives=lives-1;                              
    {
    rect(0, 0, 400, 400);
    fill(255, 0, 0);
    } 
   } 
      if (lost==true)                               
      {
      fill (255,255,255);
      timer=0;
      speed=1;                                    
      lives=5;
      score=0;
      xPos=width/2;
      xDir=1;
      lost=false;
      loop();                                     
      }
}


