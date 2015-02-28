
void draw ()
{
  background (200);
  float t =norm(millis(),0,1000);
  float f = norm(t,0,15);
  float x = lerp(5,95,f);
  ellipse(x,10,5,5);
}



