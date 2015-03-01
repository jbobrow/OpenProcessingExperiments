
void setup()
  {
   
  size (500,500);

 
  smooth();
 
   
  ellipseMode(CENTER);
  }
 
 
void draw()
  {
   
   fill(248, 166, 177);
   rect(0,0,width,height);
  
  fill(random(0,255), random(0,255), random(0,255));
  rect(random(0,width), random(0,height), 40, 40);
  }


