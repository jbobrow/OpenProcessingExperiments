
void setup()
{
  size(512, 512, JAVA2D);
  frameRate(12);
  smooth();
}

void draw()
{
  background(0);


  stroke(224);
  strokeWeight(1);
  pushMatrix();
  translate(width / 2, height / 2);

  for (int i = 0; i < 6; i++)
  {
    rotate(radians(30));
    line(-width/3, 0, width/3, 0);
  }

  fill(0);
  ellipse(0, 0, width/8, width/8);

  rotate(radians(180));
  fill(255);
  textAlign(CENTER);

  if (hour() < 12)
    text("AM", 0, 4);
  else
    text("PM", 0, 4);

  noFill();

  popMatrix();
  strokeCap(SQUARE);
  strokeWeight(width / 16);


  stroke(160, 0, 0);
  printClock((width / 4) * 3, hour() % 12 * 30);

  stroke(0, 160, 0);
  printClock((width / 4) * 2, minute() * 6);

  stroke(0, 0, 160);
  printClock((width / 4) * 1, second() * 6);
}

void printClock(float clockRadius, float angle)
{
  arc(width / 2, height / 2, clockRadius, clockRadius, radians(-90.0), radians(angle - 90.0));
}


