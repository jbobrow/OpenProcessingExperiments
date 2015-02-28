
// Keith O'Hara <kohara@bard.edu>
// Feb 3 2010
// CMSC 117

void setup()
{
  size(400, 400);
  smooth(); 
  strokeWeight(3);
  background(196);
  stroke(64);
  fill(64);
}

void draw()
{  
   if (key == 'e')
   {
     background(196);
   }
   if (key == 'l')
   {
     line(pmouseX, pmouseY, mouseX,  mouseY);
   }
   if (key == 'k')
   {
     line(pmouseX, pmouseY, 
          mouseX + random(-15, 15), 
          mouseY + random(-15, 15));
   }
   if (key == 'p')
   {
     point(mouseX, mouseY);
   }
   if (key == 'c')
   {
     float r = random(-25, 25);
     ellipse(mouseX, mouseY, r, r);
   }

}

