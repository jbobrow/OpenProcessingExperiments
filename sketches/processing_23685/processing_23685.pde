

void setup()
{
  size(400,200);
  background(255);
  smooth();
  stroke(1,1,1,125);
  noFill();
  for(int i=0;i<=width;i+=20)
  {
    for(int j=0;j<=height;j+=20) 
   { 
      strokeWeight(random(6));
      ellipse(i,j, 40,40);
   }
  }
}

                
                
