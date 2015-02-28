
//Dette er Classen sat i main

class Meteor
{
  float x = random(50, 650);
  float y;
  float fart;

  Meteor()
  {
    y = -10;
    fart = random(10, 20);
  }

  void ShowMeteor()
  {
    fill(0, 0, 0);
    ellipse(x, y, 50, 50);
  }

  void fall()
  {
    y = y + fart;

    if ( y > 700)
    {
      y = -10;
      x = random(50, 650);
    }
  }
}

//Dette er Main

Meteor Met1;

void setup()
{
  size(700, 700);
  Met1 = new Meteor();
}

void draw()
{
  background(255, 255, 255);
  Met1.ShowMeteor();
  Met1.fall();
}


