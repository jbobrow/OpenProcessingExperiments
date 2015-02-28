
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
  stroke(100);
  strokeWeight(20);
  point(0,0);
  stroke(100);
  strokeWeight(8);
  ellipse(0,150,45,45);
}

float period = 0.5;
float amplitude = 70;

float motion()
{
  float time = norm(millis(),0,1000);
  float fraction = norm(time,0,period);
  float shm = sin(fraction*TWO_PI);
  float angle = amplitude*shm;
  return radians(angle);
}


