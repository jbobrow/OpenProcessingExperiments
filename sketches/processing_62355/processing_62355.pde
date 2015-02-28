


void setup ()
{
  size(500, 500 );
  background( (255), random(255), random(255));
  smooth();
  frameRate(60);
}


void  draw  ()
{
  ellipse (mouseX, mouseY, 40, 40);

  strokeWeight(2);
  stroke (500, 300, 20);
  point (random(width), random(height));
}



