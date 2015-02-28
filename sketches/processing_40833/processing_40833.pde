
//make a circle that shirnks and grows


void setup ()
{
  size (400, 400);
  background (100);
  smooth();
}

float wide = 30;
int moreOrLess = 0;

void draw ()
{
  //background (100);

  //check the width of the circle
  if (wide <= 30)
  {
    moreOrLess = 0;
  }
  else if (wide > 100)
  {
    moreOrLess = 1;
  }

  if (moreOrLess == 0)
  {
    wide += 1;
  }
  else if (moreOrLess == 1)
  {
    wide -=1;
  }

 stroke(50);
  ellipse (mouseX, mouseY, wide, 30);
}




