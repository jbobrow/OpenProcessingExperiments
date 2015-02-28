
float period = 5;
float amplitude = 0.2;

void setup()
{
size(640,480);
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
strokeWeight(10);
line(0,0,0,200);
strokeWeight(6);
fill(255,0,0);
ellipse(0,200,100,80);
strokeWeight(12);
point(0,0);
}

float motion()
{  
  float time = norm(millis(),0,500);
  float fraction = norm(time,0,period);
  float shm = sin(fraction*TWO_PI);
  float angle = amplitude*shm;
  return angle;
}


