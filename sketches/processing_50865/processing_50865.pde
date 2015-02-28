
// Homework #5 48-257
// Humaira Tasnim htasnim Copyright 2012

void setup()
{ 
  size (400, 400);
  smooth ();
  noStroke ();
  background (255);
}

void draw()
{ 
}

void mousePressed()
{
  drawInitials (mouseX, mouseY, 150);
}

void drawInitials (float x, float y, float diameter)
{
  // Ellipse
  noStroke();
  fill (random(220,255), random(30,255), random(30,255), 90);
  ellipse (x, y, diameter, diameter);
  
  // Initials
  noFill();
  strokeWeight (2);
  stroke (2, 78, 104);
   
  // h
  beginShape ();
    vertex (x - (0.25 * diameter), y - (0.25 * diameter));
    vertex (x - (0.25 * diameter), y + (0.25 * diameter));
    curveVertex (x - (0.25 * diameter), y);
    curveVertex (x - (0.25 * diameter), y);
    curveVertex (x - (0.05 * diameter), y - (0.06 * diameter));
    curveVertex (x - (0.025 * diameter), y + (0.45 * diameter));
    curveVertex (x - (0.025 * diameter), y + (0.45 * diameter));
  endShape ();
   
  // t
  beginShape();
    curveVertex (x + (0.025 * diameter), y - (0.45 * diameter));
    curveVertex (x + (0.025 * diameter), y - (0.45 * diameter));
    curveVertex (x + (0.025 * diameter), y + (0.05 * diameter));
    curveVertex (x + (0.1 * diameter), y + (0.25 * diameter) + (0.06 * diameter));
    curveVertex (x + (0.25 * diameter), y + (0.25 * diameter));
    curveVertex (x + (0.25 * diameter), y + (0.25 * diameter));
  endShape();
   
  beginShape();
    vertex (x + (0.025 * diameter), y - (0.2 * diameter));
    vertex (x + (0.2 * diameter), y - (0.2 * diameter)); 
  endShape();
}

void keyPressed()
{
  background (255);
}

