
void setup ()
{
size (400,400);

}
void draw ()
{
  
  background (0);
  fill (255);
  triangle (60,30,100,15,60,0);
  rect  (0,0,20,200);
  rect (20,0,40,30);
  rect (20,170,40,30);
  triangle (60,200,100,185,60,170);
  triangle (20,115,80,100,20,85);
  

}

void mousePressed (){
  
  if (mouseButton == LEFT) 
  { fill (random (0,255),random (0,255), random (0,255));rect (100,182,400,5);
  rect (100,12,400,5);}
  
  else {fill (0);rect (100,182,400,5);
  rect (100,12,400,5);}
}
