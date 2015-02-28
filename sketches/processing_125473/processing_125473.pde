

size(500, 500);
background(255);

float x = 200;
float w = 10;

rectMode(CENTER);
noFill();

int steps = 15;
for (int i = 0; i < steps; i ++)
{
  float percent = i / (float)steps;
  strokeWeight((1 - percent) * 10);
  ellipse(250, 250, percent * 500, percent * 500);
}
