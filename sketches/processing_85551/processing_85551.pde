
void setup()
{
size(300,300); 
background(255); 
smooth();
}

void draw() 
{
  noFill();
  
  for (int i = 25; i<300; i=i+50)
  {ellipse(i,25,50,50);}
  
  for (int i = 10; i<300; i=i+20)
  {ellipse(i,70,10,10);}
  
  for (int i = 15; i<300; i=i+30)
  {ellipse(i,100,30,30);}
  
  
  noLoop();
}


