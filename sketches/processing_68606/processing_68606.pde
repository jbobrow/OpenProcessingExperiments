
void setup() {

  size(800, 400);
  background(255);
  smooth();
  frameRate(2); //slowing frame down to see it properly
}

void draw()
{

  fill(random(255), random(255), random(255), random(255));
  beginShape(TRIANGLE_STRIP);
  vertex(random(0, 800), random(0, 400));
  vertex(random(0, 800), random(0, 400));
  vertex(random(0, 800), random(0, 400));
  vertex(random(0, 800), random(0, 400));
  vertex(random(0, 800), random(0, 400));
  vertex(random(0, 800), random(0, 400));
  vertex(random(0, 800), random(0, 400));
  vertex(random(0, 800), random(0, 400));
  ellipse (mouseX, mouseY, abs (100), abs (100));
}


