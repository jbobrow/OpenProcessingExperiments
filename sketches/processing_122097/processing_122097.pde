
float peroid = 8;
float amplitude = 15;

void setup()
{
  size(400,300);
}

void draw()
{
  background(200);
  translate(width/2,20);
  float angle = motion();
  rotate(angle);
  pendulum();
}

void pendulum()
{
  stroke(100);
  strokeWeight(10);
  line(0,0,0,150);
  stroke(250);
  strokeWeight(0);
  point(0,0);
  ellipse(0,200,100,100);
  fill(0,0,0);
}

float motion()
{
  float time = norm(millis(),0,1000);
  float fraction = norm(time,0,peroid);
  float shm = sin(fraction*TWO_PI);
  float angle = amplitude*shm;
  return radians(angle);
}

