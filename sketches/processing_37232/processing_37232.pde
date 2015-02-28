
boolean mouseIsDown = false;

void setup()
{
  size(500, 500);
  background(255, 255, 255);
  smooth();
  frameRate(15);
}

void draw()
{
  //noStroke();
  //fill(random(256), 255, random(256), 50);
  
  if (mouseIsDown == true)
  {
   strokeCap(SQUARE);
   stroke(random(256), 56, random(256), 50); 
   strokeWeight(random(100));
   line(mouseX, mouseY, pmouseX, pmouseY);
   //ellipse(random(256), mouseY, pmouseX, pmouseY);
  }
}

void mousePressed()
{
  mouseIsDown = true;
}

void mouseReleased()
{
  mouseIsDown = false;
}

                
                                
