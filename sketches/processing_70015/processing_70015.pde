
float circleX = 50;
float circleY = 50;

float t1 = 2;
float t2 = 3;

void setup()
{
  size(400, 400);
  background(250);
  smooth();
}

void draw()
{
  fill(255, 20);
  rect(0, 0, width, height);

  fill(t1*10, t2*50, 210, 50);
  noStroke();
  ellipse(circleX, circleY, 10, 10);

  circleX = circleX + (random(t1*1));
  circleY = circleY + (random(t2*2));

  if ((circleX > width - 5) || (circleX < 5)) {
    t1 = t1 * - 1;
  }

  if ((circleY > height - 5) || (circleY < 5)) {
    t2 = t2 * - 1;
  }

}


