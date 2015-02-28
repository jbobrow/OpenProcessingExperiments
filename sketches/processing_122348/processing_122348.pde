
float period = 3;
float amplitude = 30;

void setup()
{
  size(500,640);
}

void draw()
{
  background(200);
  translate(width/2,300);
  float angle = motion();
  rotate(angle);
  pendulum();
}

void pendulum()
{
  stroke(255,0,0);
  strokeWeight(20);
  line(0,-280,0,280);
  quad(-50,-200,50,-200,50,200,-50,200);
  stroke(255,0,0);
  strokeWeight(12);
  ellipse(0,0,50,45);
  rect(-25,-290,50,45,5);
  rect(-25,280,50,45,5);
}

float motion()
{
  float time = norm(millis() ,0,1000);
  float fraction = norm(time,0,period);
  float shm = sin(fraction*TWO_PI);
  float angle = amplitude*shm;
  return radians(angle);
}


