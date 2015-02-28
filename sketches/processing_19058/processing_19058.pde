
// BRINGING IN CONDITIONALS
void setup()
{
   size(300,300);
   smooth();
   noStroke();
}
void draw()
{
  background(210);
  //upperleft 
  if((mouseX <=width/2) && (mouseY <=width/2))
  {
     fill(255,0,0, 200);
     rect(0,0,width/2,height/2); 
  }
  //lower left
  else if( (mouseX <=width/2) && (mouseY >=width/2))
  {
     fill(0,255,0, 200);
     rect(0,height/2,width/2,height/2); 
  }
  //upper right
  else if( (mouseX >=width/2) && (mouseY <=width/2))
  {
     fill(0,0,255, 200);
     rect(width/2,0,width/2,height/2); 
  }
  //upper right
  else{
     fill(255,255,0, 200);
     rect(width/2,height/2,width,height/2); 
  }
}



