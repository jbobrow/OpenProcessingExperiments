
void setup()
{
  size(400,400);
  
  background(1000,1000,1000);
  
  strokeWeight(5);
  line(100,0,100,400);
  
  fill(255,0,0);
 rect(0,0,100,100);
 
 line(0,100,400,100);
 
 noFill();
 arc(100,100,200,100,0,HALF_PI);
 
 fill(0,255,0);
 ellipse(300,300,100,100);
 
 line(300,0,300,400);
 
 fill(0,0,255);
 triangle(0,300,100,250,100,350);
}


