
void setup ()
{
  size (400,400); // Size of background
  background (255,255,255); // Background color
  smooth (); // Improve edge smoothness
}
 
void draw ()
{
  fill (random (87) ,random (20), random (10)); // Color of circle
  ellipse (random(400),random(400), 15, 15); // Constraint of where circles appear and size of circles
}

