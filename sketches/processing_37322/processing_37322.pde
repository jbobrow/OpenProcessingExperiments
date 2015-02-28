
//Click and hold to draw a line


void setup()
{
  size(700,700);
  background(230);

}

void draw()
{
  if(mousePressed==true)
  {
    line(mouseX, mouseY, pmouseX, pmouseY);
    smooth();
    stroke(0);
   
   }
  
  if(mousePressed==false)
  {
    ellipse(mouseX,mouseY,10,10);
    fill(random(0,300),random(0,300),random(0,300));
    noStroke();
    smooth();
    
  }
  
  
  
 }
  

