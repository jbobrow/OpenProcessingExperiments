
void setup()
{
  size(500,500);
  smooth();
  
  background(0);
  
}

void draw()
{
  translate(width/2,height/2);
  
  for(int i=1; i<=20; i=i+1)
  {
  noStroke();
  fill(180,20,20,50);
  
  rotate(PI/i);
  rect(0,0,200,200);
  }
   
  
  noLoop();
  
}


