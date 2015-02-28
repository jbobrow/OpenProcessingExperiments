
int score=0;
int timer=10;
int timeLast = 0;
int i=0;
 
void setup() 
  {
    size(1000, 600);
    smooth();
    timeLast=second();
  }
 
void draw() 
  {
    if (timer>0) 
    {
      game();
    }
  }
 
void game() 
{
  if (second()!=timeLast) 
  {
      timeLast=second();
      timer-=1;
  }
    
  if(i==0)
  {
    rect(350,150,300,300);
    line(500,200,500,400);
    line(500,200,600,350);
    line(500,200,400,350);
      
      if(keyCode==UP)
      {
        i=1;
        score = score + 1;
      }
  }
  else if(i==1)
  {
    rect(350,150,300,300);
    line(500,200,500,400);
    line(500,400,600,250);
    line(500,400,400,250);
      
      if(keyCode==DOWN)
      {
        i=0;
        score = score + 1;
        
      }
  } 
  
  fill(255,255,0);
  rect(0,0,1000,60);
  fill(0);
  text("Score: "+score, 320, 50);
  text("Timer: "+timer, 520, 50);
  fill(255);
}


