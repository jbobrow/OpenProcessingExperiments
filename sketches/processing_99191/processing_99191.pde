
void setup()
{
  size(500, 500);
  background(0);
  smooth();
}

void draw()
{
  fill(0, 255, 0);
  triangle(250, 150, 125, 400, 375, 400);
  fill(90, 42, 14);
  rect(225, 400, 55, 50);
  stroke(255, 255, 0);
  point(random(500), random(500));
  fill(255, 255, 255);
  ellipse(random(500), random(500), 3, 3);
  fill(255, 255, 255);
  rect(0, 450, 500, 450);
  fill(random(255), random(255), random(255));
  fill(255, 255, 0);
  triangle(250, 130, 220, 160, 280, 160); 
  triangle(220, 145, 280, 145, 250, 175);
}

void keyPressed()
{
  if (key=='s');
  fill(255, 255, 255);
  ellipse(100, 425, 70, 70);
  fill(255, 255, 255);
  ellipse(100, 380, 50, 50);
  fill(255, 255, 255);
  ellipse(100, 350, 30, 30);
}
