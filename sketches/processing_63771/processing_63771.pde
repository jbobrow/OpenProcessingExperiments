
int circlesize;

float r,g,b;

void setup()
{
  size(400,400);
  background(0);
  circlesize = 400;
  frameRate(4);
  strokeWeight(1);
  smooth();
}


void draw()
{
  r = random(255);
  g = random(155);
  b = random(155);
  fill(r,g,b);
  stroke(r,g,b);
  arc(200,200,circlesize,circlesize,0.0,HALF_PI);
  
  r = random(155);
  g = random(255);
  b = random(155);
  fill(r,g,b);
  stroke(r,g,b);
  arc(200,200,circlesize,circlesize,HALF_PI,PI);
  
  r = random(155);
  g = random(155);
  b = random(255);
  fill(r,g,b);
  stroke(r,g,b);
  arc(200,200,circlesize,circlesize,PI,HALF_PI*3);
  
  r = random(255);
  g = random(255);
  b = random(255);
  fill(r,g,b);
  stroke(r,g,b);
  arc(200,200,circlesize,circlesize,HALF_PI*3,2*PI);
  
  circlesize -= random(80);

  if (circlesize <= 0)
  {
    circlesize = 400;
    delay(1500);
  }
}

