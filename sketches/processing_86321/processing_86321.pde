
void setup()
{
  size(500,500);
  smooth();
  
  background(0);
  
}

void draw()
{
 for(int X=10; X<=500; X=X+60)
 for(int Y=10; Y<=500; Y=Y+60)
  { 

  translate(X,Y);
  
  //rotation du carré
  for(int i=1; i<=20; i=i+1)
  {
  noStroke();
  fill(180,20,20,50);
  
  rotate(PI/i);
  rect(0,0,40,40);
  }
   
  }
  
  noLoop();
  
}


