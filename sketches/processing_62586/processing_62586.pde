
void setup()
{
  size(800, 600);
  background(0, 0, 0);
  smooth();
  frameRate(60);
}

void draw()
{
  background(0, 0, 0);
  fill(0, 255, 0);
  strokeWeight(40);
  stroke(255, 0, 0);
  line(800, 600, width-mouseX, height-mouseY);
  strokeWeight(30);
  stroke(255, 255, 255);
  line(800, 600, width-mouseX, height-mouseY);
  strokeWeight(40);
  stroke(0, 255, 0);
  line( 0, 600, mouseX, mouseY );
  strokeWeight(30);
  stroke(255, 255, 255);
  line( 0, 600, mouseX, mouseY);
}


