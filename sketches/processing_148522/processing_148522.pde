
void draw ()
{
  background (400);
  float t =norm(millis(),0,250);
  float f = norm(t,0,30);
  float x = lerp(0,100,f);
  ellipse(x,80,40,40);
}


