
float period = 4;
float amplitude = 1;

void setup()
{
size(400,300);
}
void draw()
{
background(200,100,200);
translate(width/2,20);
float angle = motion();
rotate(angle);
pendulum();
}
void pendulum()
{stroke(0);
strokeWeight(10);
line(0,0,0,150);
stroke(100);
strokeWeight(10);
point(0,0);
stroke(0,255,0);
strokeWeight(30);
point(0,150);
}

float motion()
{
  float time = norm(millis(),0,1000);
  float fraction = norm(time,0,period);
  float shm = sin(fraction*TWO_PI);
  float angle = amplitude*shm;
  return angle;
}


