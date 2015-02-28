


void setup()
{
 size(300,300); 
 
 smooth();
}



void draw()
{
  float x=random(0,300);
float y=random(0,300);

  background(255,255,255);
  
  stroke(#3891F6);
  strokeWeight(4);
  ellipse(30,30,50,50);
  noFill();
  
  
  stroke(#FDFD0A);
  strokeWeight(4);
  ellipse(60,60,50,50); 
 noFill();
  
  
  stroke(0,0,0);
  strokeWeight(4);
  ellipse(95,30,50,50);
 noFill();
  
  stroke(#2CD232);
  strokeWeight(4);
  ellipse(125,60,50,50);
  noFill();
  
  if(x!=155 && y!=30)
  {
  stroke(#FF0404);
  strokeWeight(4);
  ellipse(x,y,50,50);
 noFill();
  }
 
}

