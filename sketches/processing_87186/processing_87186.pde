
// Ethan Frier
// copywrite 2013
// Class 1/24/13


float x1, y1, x2, y2, x3, y3, x4, y4 ;

void setup()
{
  size(400, 400);
  smooth();
  
  background(255);
  
}


void draw () 
{
  fill (255, 3);
  rect (0, 0, width, height);
  
  
  noFill();
  noStroke();
  
  x1 = mouseX - random(10, 50);
  y1 = mouseY + random(10, 50);
  
  x2 = mouseX + random(10, 50);
  y2 = mouseY + random(10, 50);
  
  x3 = mouseX + random(10, 50);
  y3 = mouseY - random(10, 50);
  
  x4 = mouseX - random(10, 50);
  y4 = mouseY - random(10, 50);
 
 
}


void mousePressed() {
 
  fill(random(0, 255), random(0, 255), random(0, 255));
  
   beginShape();
    vertex(x1, y1);
    vertex(x2, y2);
    vertex(x3, y3);
    vertex(x4, y4);
  endShape(CLOSE);
 

  
}


