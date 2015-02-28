
void setup ()
{
  size(400,400);
  background(255);
  smooth();
  
  
  
}

void draw ()
{
  whileSomething();  
}

void whileSomething()
{
  int lookAtMe = width/2;
  

  noStroke();
  
  while(lookAtMe<= width )
  {
   fill(random(255),random(255),random(255));
   ellipse(lookAtMe,lookAtMe,10,10); 
   lookAtMe = lookAtMe + 20;
   
  }
  
 
}


 

