
float angle = 0;
float s = 1;
float scaleSpeed = 0.1;
float timer = 0.0;

void setup()
{
  size(500, 500);
  background(255, 240, 165);
}

void draw()
{
  timer++;
  if (timer < 180)
  {
    part1();
  }
  if (timer > 180 && timer < 360)
  {
    part2();
  }
  if (timer > 360 && timer < 540)
  {
    part3();
  }
  if (timer == 540)
  {
    timer = 0;
  }

  angle += 0.1; //speed to rotate
  s += scaleSpeed; //scaleSpeed
  if ( s > 3 || s < 0)
  {
    scaleSpeed = -scaleSpeed;
  }
}
void part1()
{

  rectMode(CENTER);

  pushMatrix(); //before transform

  translate(width/2, height/2); //first
  rotate(angle);  //second
  scale(s);  //third
  noStroke();
  fill(255, 176, 59, 5);
  rect(0, 0, 100, 100);  //last

  popMatrix(); // after transform
}

void part2()
{

  ellipseMode(CENTER);

  pushMatrix();

  translate(width/2, height/2);
  scale(s/2);
  fill(182, 73, 38);
  float ellipseY = (height / 2) + cos(radians(angle)) * height / 2;
  ellipse(0, 100, 100, 100);
  ellipse(100, 0, 100, 100);

  popMatrix();
}

void part3()
{

  pushMatrix();

  translate(width/2, height/2);
  rotate(radians(45));
  noFill();
  stroke(142, 40, 0, 100);
  ellipse(0, 0, 50, 50);

  popMatrix();
}



