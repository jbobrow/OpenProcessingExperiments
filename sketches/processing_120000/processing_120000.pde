
void setup()
{
  size(500,500);
}

void draw()
{
  background(255);
  {
    
  int sec= second()*8;
  fill(247,52,235);
  noStroke();
  rect(0,0,sec,60);
   
  int min= minute()*8;
  fill(200);
  noStroke();
  rect(0,60,min,120);
  
  
  int h= hour()*20;
  fill(0);
  noStroke();
  rect(0,180,h,360);
  }
  
  
    for (int x=0; x<480; x+=20)
    { 
     fill(200);
     stroke(0);
     rect(x,492,20,8);
  }
  
    for (int x=0; x<480; x+=8)
    { 
     fill(200);
     stroke(0);
     rect(x,180,8,8);
  }
  
  
 }
