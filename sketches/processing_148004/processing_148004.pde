
float period = 5;
float amplitude = 15;

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
   stroke(550);
   strokeWeight(11);
   point(0,0);
 }
 
 float motion()
 {
   float time = norm(millis(),0,300);
   float fraction = norm(time,0,period);
   float shm = sin(fraction*TWO_PI);
   float angle = amplitude*shm;
   return radians(angle);
 }



