
float counter = 0;

void setup()
{
  smooth();
  size(600, 400);
  colorMode(HSB, 360, 100, 100);
  background(0, 1, 52);
  ellipseMode(CENTER);
}

void draw()
{

  background(0, 1, 52);
  float amp = map(sin(counter), -1, 1, 0, 50);
  float counter_Mouse = map(mouseX, 0, width, 0.01, 0.05);
  float pos1 = 50+amp;
  float pos2 = -50+amp;

  translate(width/2, height/2);
  noStroke();
  fill(0);
  ellipse(0, 0, 300, 300);

  pushMatrix();
  fill(264, 2, 73);
  ellipse(50+amp, -20, 50, 10);
  popMatrix();

  pushMatrix();
  fill(264, 2, 73);
  ellipse(-50+amp, -20, 50, 10);
  popMatrix();

  //Träne
  pushMatrix();
  fill(216, 53, 96);
  ellipse(pos2, -20+frameCount*2, 10, 10);
  popMatrix();

  //Träne
  pushMatrix();
  fill(216, 53, 96);
  ellipse(pos1, -20+frameCount*2, 10, 10);
  popMatrix();

  counter += counter_Mouse;

  if ( frameCount > 150)
  {
    frameCount = 0;
  }
}

