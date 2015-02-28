
void setup()
{
  size(600, 400);
  background(14, 137, 29);
  smooth();
  frameRate(10);
}

void draw()
{
  fill(12, 61, 155);
  rect(0, 0, width, 150);
  strokeWeight(3);

  line(100, 275, 110, 350);

  line(110, 350, 130, 375);
  line(110, 350, 95, 380);

  line(85, 270, 130, 340);
  line(110, 270, 90, 350);

  fill(0, 0, 0);
  ellipse(100, 270, 50, 50);

if (key == 'r')
{
  noStroke();
  fill(121, 184, 250);
  ellipse(random(width), random(height), 7, 7);
}


if (key =='u')
{
  line(100, 275, 110, 350);

  line(110, 350, 130, 375);
  line(110, 350, 95, 380);

  line(85, 270, 130, 340);
  line(110, 270, 90, 350);

  strokeWeight(3);
  stroke(0, 0, 0);

  line(125, 350, 125, 230);
  fill(random(255), random(255), random(255));
  ellipse(125, 230, 60, 15);

  fill(0, 0, 0);
  ellipse(100, 270, 50, 50);

  noStroke();
  fill(121, 184, 250);
  ellipse(random(width), random(height), 7, 7);
}

}
