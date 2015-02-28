
class Flower
{
  Seed [] smallSeeds = new Seed[17];
  Seed [] medianSeeds = new Seed[17];
  Seed [] bigSeeds = new Seed[17];
  color c;
  float fX;//center of the flower
  float fY;
  float fL;


  Flower(float flowerX, float flowerY, float flowerL)
  {
    fX = flowerX;
    fY = flowerY;
    fL = flowerL;
    c = color(random(125, 240), random(125, 240), 
    random(125, 240), 125);
    for (int i = 0; i <  bigSeeds.length; i++)
    {
      bigSeeds[i] = new Seed(fX, fY, fL, i * PI / 8.0);
      medianSeeds[i] = new Seed(fX, fY, 2 * fL / 3, i * PI / 8.0 + PI / 16.0);
      smallSeeds[i] = new Seed(fX, fY, fL / 3, i * PI / 8.0 + PI / 12.0);
    }
  }

  void display()
  {
    float r;
    for (int i = 0; i < 17; i++)
    {
      bigSeeds[i].display();
      medianSeeds[i].display();
      smallSeeds[i].display();
    }
    noFill();
    stroke(255);
    r = 380-fY;// for the calculation the stem
    arc(fX + 0.5 * r, fY + 0.5 * r, 
    r *1.41, r * 1.41, 0.75 * PI, 1.25 * PI);   //the stem
  }

  void move()
  {
    for ( int a = 0; a <17; a++)
    {
      if (bigSeeds[a].touch(mouseX, mouseY))
      {
        float x = mouseX;
        float y = mouseY;
        fill(c);
        beginShape();
        vertex(x - 30, y - 50);
        bezierVertex(x - 15, y - 100, x + 20, y - 100, x + 30, y - 50);
        for (int b = 25; b > -25; b += -15)
        {
          bezierVertex(x + b, y - 55, x + b - 5, y - 55, x + b - 10, y - 50);
        }
        
        endShape();
        for (int i = -30; i < 40; i += 15)
        {
          line(x, y, x + i, y - 50);
        }
      }
      else if (medianSeeds[a].touch(mouseX, mouseY))
      {
        medianSeeds[a].back();
      }
      else
      {
        bigSeeds[a].move();
        medianSeeds[a].move();
      }
    }
  }

  void initialize()

  {
    for ( int a = 0; a <17; a++)
    {
      bigSeeds[a].initialize();
      medianSeeds[a].initialize();
    }
    c = color(random(125, 240), random(125, 240), 
    random(125, 240), 125);
  }
}


