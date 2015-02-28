


void setup()
{
  size(400, 400);
  frameRate(5);
}

void draw()
{

  rectMode(CENTER);
  strokeWeight(random(50));
  rect(200, 200, random(400), random(400));
  rect(200, 200, random(300), random(300));
  rect(200, 200, random(200), random(200));
  rect(200, 200, random(200), random(100));
}

