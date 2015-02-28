
PVector pos, posA, vel, velA, velB;
int rad;

void setup()
{
  size(400, 400);

  pos = new PVector (width/4, height/2);
  posA = new PVector (width/2, height/2);
  vel = new PVector (0, 0);
  velA = new PVector (-2, 0);
  rad = 20;

  //vel = new PVector (.1, 0);
  //velA = new PVector (-1, 0);

  velB = new PVector (0, 0);
}

void draw()
{
  background(150);

  if ( PVector.dist(pos, posA)<rad)
  {
    velB.add(velA);
    velA.mult(0);
    velA.add(vel);
    vel.mult(0);
    vel.add(velB);
    velB.mult(0);

    //momentum is preserved
    //work on implementing mass into mix
  }

  border();
  borderA();

  pos.add(vel);
  posA.add(velA);


  ellipse(pos.x, pos.y, rad, rad);

  ellipse(posA.x, posA.y, rad, rad);
}

void border()
{
  if (pos.x > width)
  {
    vel.x = -vel.x;
  }
  if (pos.x < 0)
  {
    vel.x = -vel.x;
  }
  if (pos.y > height)
  {
    vel.y = -vel.y;
  }
  if (pos.y < 0)
  {
    vel.y = -vel.y;
  }
}

void borderA()
{
  if (posA.x > width)
  {
    velA.x = -velA.x;
  }
  if (posA.x < 0)
  {
    velA.x = -velA.x;
  }
  if (posA.y > height)
  {
    velA.y = -velA.y;
  }
  if (posA.y < 0)
  {
    velA.y = -velA.y;
  }
}



