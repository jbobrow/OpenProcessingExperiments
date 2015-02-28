
void setup()
{
  size (200,200);
}
void draw()
{
  background(200);
  float t = norm(millis(),0,1000);
  float f = norm(t,0,1);
  f=constrain(f,0,1);
  float p;
  /*if(f<0.5) p = map(f, 0,0.5, 0.1);
  else        p = map(f, 0.5,1, 1,0); */
  p = 3*f*f - 2*f*f*f;
  line(5,50,95,50);
  float x = lerp(5,95,f);
  ellipse(x,50,10,10);
}




