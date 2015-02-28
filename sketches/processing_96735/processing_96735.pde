
color hot= color(255, 254, 0);
color cold= color(100,0,0);
color night= color(16,16,112);
int age = 0;
int life= 200;
void draw()
{
  background(night);
  noStroke();
  if(age<life)
  {
    fill(age--);
  ellipse(50, 50, 50, 50);
    }

}


