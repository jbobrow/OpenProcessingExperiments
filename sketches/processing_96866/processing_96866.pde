
color hot =color(133, 254, 0);
color cold =color(100, 0, 0);
color night = color(32, 32, 112);
int age = 0;
int life = 500;
void draw()
{
  background(night);
  noStroke();
  age++;
  if (age<life)
  {
    float f = norm(age,0,life);
    color c = lerpColor(hot,cold,f);
    fill(c);
    ellipse(50, 50, 50, 50);
  }
}


