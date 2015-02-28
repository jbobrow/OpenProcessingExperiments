
void setup ()
{
  size(600, 600);
  background (255, 255, 255);
  smooth();
  frameRate(10);
  }
  void draw ()
  {
    strokeWeight (6);
    stroke(161, 229, 60);
    rect(random(500), random (500), random (500), random (500));
    image(loadImage("wreath.jpg"), 50, 50);
    fill (random (255), 0, 0);
    ellipse (random (100, 180), random (150, 400), 15, 15);
    ellipse (random (100, 180), random (150, 400), 15, 15);
    ellipse (random (100, 180), random (150, 400), 15, 15);
    ellipse (random (100, 180), random (150, 400), 15, 15);
    ellipse (random (100, 180), random (150, 400), 15, 15);
    
    ellipse (random (400, 500), random (150, 400), 15, 15);
    ellipse (random (400, 500), random (150, 400), 15, 15);
    ellipse (random (400, 500), random (150, 400), 15, 15);
    ellipse (random (400, 500), random (150, 400), 15, 15);
    ellipse (random (400, 500), random (150, 400), 15, 15);
    
    ellipse (random (150,450 ), random (400, 475), 15, 15);
    ellipse (random (150,450 ), random (400, 475), 15, 15);
    ellipse (random (150,450 ), random (400, 475), 15, 15);
    ellipse (random (150,450 ), random (400, 475), 15, 15);
    ellipse (random (150,450 ), random (400, 475), 15, 15);
  }
void mousePressed ()
{ 
  fill (random (255), 0, 0);
  ellipse (mouseX, mouseY, 15, 15);
}


