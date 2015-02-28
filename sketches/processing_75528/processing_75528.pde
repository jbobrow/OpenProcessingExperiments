
float desiredspeed = 45;       // mph
float accelperf = 2.9/60./60.; // hours
float breakperf = 100./5280.;  // miles
float destination = 20 ;        // miles
float timestep = 1./60./60.;
void setup()
{
  size(320,100);
}

float speed= 0;
float distance=0;
float stopdist = map(desiredspeed,0,60,0,breakperf);
float breakat=0;
float time=0;
void draw()
{
  background(120);
  translate(10,90);
  
 time += timestep;
  
  if(speed<desiredspeed) speed = map(time,0,accelperf, 0,60);

  if(distance>(destination-stopdist))
  {
    if (breakat==0) breakat = distance;
    speed = map(distance-breakat, 0, stopdist, desiredspeed,0);
  }
  distance += speed * timestep;
  
  car(map(distance,0,30,0,300), 0);
  
}
void car(float x, float y)
{
  rect(x,y, 20, -20);
}


