
void setup()
{
  size(600,600);
  noFill(); 
  smooth();
 
}

void draw ()
{
  background(250,177,233);
  smooth();
  stroke(27,32,242);
  ellipse(150,250,90,90);
  
  smooth();
  stroke(0);
  ellipse(220,250,90,90);
  
  smooth();
  stroke(245,12,43);
  ellipse(mouseX+20,mouseY+3,90,90);
  
  smooth();
  stroke(248,252,5);
  ellipse(172.5,295,90,90);
  
  smooth();
  stroke(5,252,114);
  ellipse(240,295,90,90);
  
}  

