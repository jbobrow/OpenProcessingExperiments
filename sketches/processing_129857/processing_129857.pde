
int c = 450;

void setup ()
{
  size(900, 900);
  strokeWeight(5);
  stroke(random(255), random(255), random(255));
  background(255);  
}
 
void draw ()
{
  {
  if (mousePressed)
  {
    fill(random(255),random(255),random(255));
    my_own();
  }
  else
  {
    fill (255);
  }
  ellipse (mouseX, mouseY, 80, 80);
  line(c, c, mouseX, mouseY);
  fill(random(255),random(255),random(255));
  ellipse(450, 450, random(150),random(150)); 
  }  
} 
void keyPressed()
{
  background (random(255),random(255),random(255));
  stroke(random(255), random(255), random(255));
   
}
 
void my_own()
{
  
  
  {
  stroke(0);
  stroke(random(255),random(255),random(255));
  }

  rect (random(800-900),random(900),random(100),random(100));
  rect (random(900),random(800-900),random(100),random(100));
  rect (random(100)+800,random(900),random(100),random(100));
  rect (random(900),random(100)+800,random(100),random(100));
  fill (random(255),random(255),random(255));
}



 

