
color hot= color (225, 254, 0);
color cold = color (100, 0, 0);
color night = color (16, 16, 112);
int age = 0;
int life = 200;
void draw ()
{
  background(night);
  noStroke();
  age++;
  if (age<life)
  {
    float f = norm(age,0,life);
    color c = lerpColor(hot,cold,f);
  fill(c);
  ellipse(50,50,50,50);
  }
}


