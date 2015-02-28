
float period = 2;
float amplitude = 90;

void setup()
{
  size(400,300);
}

void draw()
{
  background(96,213,232);
  translate(width/2,20);
  float angle = motion();
  rotate(angle);
  pendulum();
}

float motion()
{
  float time = norm(millis(),0,1000);
  float fraction = norm(time,0,period);
  float shm = sin(fraction*TWO_PI);
  float angle = shm*amplitude;
  return radians(angle);

}

void pendulum()
{
  stroke(28,28,28);
  strokeWeight(10);
  line(0,0,0,150);
  stroke(250);
  strokeWeight(8);
  point(0,0);
}


