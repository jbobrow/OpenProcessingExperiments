
void setup()
{
  size(500,300);
  background(#FFFFFF);
  noFill(); 
  smooth();
  strokeWeight(5);
}

void draw ()
{
  background(#FFFFFF);
  stroke(#3299CC);
  ellipse(50,50,70,70);
  
  stroke(#000000);
  ellipse(110,50,70,70);
  
  stroke(#FF0000);
  ellipse(mouseX+30,mouseY+30,70,70);
  
  stroke(#FFFF00);
  ellipse(90,100,70,70);
  
  stroke(#00FF00);
  ellipse(150,100,70,70);
  
}  

