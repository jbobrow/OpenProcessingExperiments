
int x,y;

void setup()
{
  size(700,400);
  x = width/2;
  y = height/2;
  ellipseMode(CENTER);
  rectMode(CENTER);
  smooth();
}
 
 
void draw()
{
   
  background(0);
  fill(255);
   
 
  float angle = atan2(mouseY-y,mouseX-x);
  
 
   
  fill(255,255,255,200);
   
  
  pushMatrix();
    translate(x,y);
    rotate( angle );
    ellipse(0,0,100,100);
    noStroke();
    rect(0,0,100,2);
  popMatrix();
   
  fill(255,0,0);
  ellipse(x,y,8,8);
  
     
}


