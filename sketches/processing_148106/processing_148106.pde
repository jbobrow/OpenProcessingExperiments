
  float period = 1;
  float amplitude = 20;
  
void setup()
{
  size(200,210);
}

void draw()
{
  background(126,89,61);
  translate(width/2,20);
  float angle = motion();
  rotate(angle);
  pendulum();
}

void pendulum()
{
  stroke(255,222,88);
  strokeWeight(10);
  line(0,0,0,150);
  stroke(255,222,88);
  strokeWeight(8);
  point(0,0);
  ellipseMode(CENTER);
  fill(0);
  stroke(255,222,88);
  ellipse(0,150,40,40);
}



float motion()
{
  float time = norm(millis(),0,2000);
  float fraction = norm(time,0,period);
  float shm = sin(fraction*TWO_PI);
  float angle = amplitude*shm;
  return radians(angle);
}


