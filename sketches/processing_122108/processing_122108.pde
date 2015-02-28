
float period = 2;
float amplitude = 20;

void setup()
{
  size(400,300);
}

void draw()
{
  background(#FA0000);
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
  strokeWeight(5);
  point(0,0);
  stroke(100);
  strokeWeight(10);
  ellipseMode(CENTER);
  ellipse(0,150,100,100);

}

float motion()
{
  float time = norm(millis(),0,1000);
  float fraction = norm(time,0,period);
  float shm = sin(fraction*TWO_PI);
  float angle = shm*amplitude;
  return radians(angle);
}
