
float v1;
float x1;
float inc1;
float v2;
float x2;
float inc2;

long timer ;

void setup()
{
  size(700, 700);
  // colorMode(HSB,360,100,100,100);

  background(65);
  v1=width/2;
  v2=width/2;
}


void draw()
{
  fill(0, 2);
  rect(0, 0, width, height);

  inc1 = random(0.01, 0.08);
  noiseSeed(1);
  x1 = noise(v1)*(width+200);
  v1+=inc1;

  inc2 = random(0.01, 0.08);
  noiseSeed(5000);
  x2 = noise(v2)*(width+200);
  v2+=inc2;

  stroke(255);

  ellipse(x1, 0, 10, 10);
  ellipse(x2, height, 10, 10);

  if (millis()- timer > 300)
  {

    line(x1, 0, x2, height);

    timer = millis();
  }
}
