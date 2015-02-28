



void setup ()

{
  size(400, 600);

  background (255, 0, 255);

  smooth();

  frameRate(random (60));
}

void draw ()
{
  textSize(30);

  fill(random (255), random (255), random(255));



  strokeWeight(random(7));
  for (int i=1;i<40;i++)
    ellipse  (random(width), random(height), mouseX, mouseY);

  stroke(random(255), random(255), random(255));

  fill(random(255), random (200), random (200), random(200)) ;
}

