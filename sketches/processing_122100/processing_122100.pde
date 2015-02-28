
float period = 4;
float amplitude = 20;

void setup()
{
  size(400,300);
}
void draw()
{
  background(168,214,170);
  translate(width/2,20);
  float angle = motion();
  rotate(angle);
  pendulum();
}

void pendulum()
{
  stroke(80,34,34);
  strokeWeight(10);
  line(0,0,0,150);
  stroke(0);
  strokeWeight(8);
  point(0,0);
  stroke(250);
  ellipse(0,150,30,30);
  }
  float motion()
  {
    float time = norm(millis(),0,1000);
    float fraction = norm(time,0,period);
    float shm = sin(fraction*TWO_PI);
    float angle = amplitude*shm;
    return radians(angle);
  }


