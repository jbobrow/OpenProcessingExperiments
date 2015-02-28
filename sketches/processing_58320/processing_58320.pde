
color c1;
color c2;
float maxradius = 4000;
    
void setup ()
{
  size(1740, 540);
  background(#111E16);
  colorMode(RGB, 100);
  noFill();
  strokeWeight(2);
  c1 = color(random(1), 255, random(1));
  c2 = color(random(255), 255, random(255));
  
 
}


void draw()
{
   pushMatrix();
   translate(0, -2069);   
   for (int dmeter = 0; dmeter < maxradius; dmeter++)
     {
      float n = map(dmeter, 0, maxradius, 0, 1);
      color newcircle = lerpColor(c1, c2, n);
      stroke(newcircle);
      ellipse(width/2, height/2, dmeter, dmeter);
      }
    popMatrix();
    
    pushMatrix();
   translate(0, 2069);   
   for (int dmeter = 0; dmeter < maxradius; dmeter++)
     {
      float n = map(dmeter, 0, maxradius, 0, 1);
      color newcircle = lerpColor(c1, c2, n);
      stroke(newcircle);
      ellipse(width/2, height/2, dmeter, dmeter);
      }
    popMatrix();
}


