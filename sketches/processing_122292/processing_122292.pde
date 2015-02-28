
float period = 50;
float amplitude = 150;

void setup()
{
  size(500, 400);
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
  stroke (100);
  strokeWeight (10);
  line(0,0,0, 225);
  stroke (250);
  strokeWeight (8);
  point(0,0);
}

float motion()
{
  float time = norm(millis(), 0, 10000);
  float fraction = norm(time,0,period);
  float shm = sin(fraction*TWO_PI);
  float angle = amplitude*shm;
  return angle;
}


