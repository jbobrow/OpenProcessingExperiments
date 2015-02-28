
//'e' == up. 's' == left. 'f' == right.
//'d' == down. ENTER for beam.
//Don't know why enemies don't appear.
//In progress of fixing. Anyone analyze and figure out problem plz.
int spaceshipx, spaceshipy, beamx, beamy, box, score;
Enemy enemy = new Enemy();

void setup()
{
  spaceshipx = 480;
  spaceshipy = 900;
  size(1200, 1000);
}

void draw()
{
  beamy -= 20;
  noStroke();
  background(0);
  fill(100, 200, 183);
  rect(0, box, 10, 80);
  rect(width - 15, box, 10, 80); 
  box += 10;
  if (box > height)
  {
    box = 0;
  }
  enemy.drawer();
  fill(500, 500, 500, 200);
  ellipse(spaceshipx + 40, spaceshipy, 80, 80);
  rect(spaceshipx, spaceshipy, 80, 80);
  triangle(spaceshipx, spaceshipy, spaceshipx, spaceshipy + 80, spaceshipx - 50, spaceshipy + 80);
  triangle(spaceshipx + 80, spaceshipy, spaceshipx + 80, spaceshipy + 80, spaceshipx + 130, spaceshipy + 80);
  fill(random(500), random(500), random(200));
  rect(beamx, beamy, 10, 40);
  enemy.update();
  beam();
  move();
}

void beam()
{
  if (key == ENTER)
  {
    beamx = spaceshipx + 35;
    beamy = spaceshipy - 80;
  }
}

void move()
{
  if (key == 'g')
  {
    spaceshipx += 5;
    spaceshipy += 5;
    key = 'h';
  }
  if (key == 'a')
  {
    spaceshipx -= 5;
    spaceshipy += 5;
    key = 'h';
  }
  if (key == 'r')
  {
    spaceshipx += 5;
    spaceshipy -= 5;
    key = 'h';
  }
  if (key == 'w')
  {
    spaceshipx -= 5;
    spaceshipy -= 5;
    key = 'h';
  }
  if (key == 'f')
  {
    spaceshipx += 8;
    key = 'h';
  }
  if (key == 'e')
  {
    spaceshipy -= 8;
    key = 'h';
  }
  if (key == 'd')
  {
    spaceshipy += 8;
    key = 'h';
  }
  if (key == 's')
  {
    spaceshipx -= 8;
    key = 'h';
  }
}
class Enemy
{
  float big, boy, size = 10;
  int  decoy, i, velocityy = 20, velocityx = width / 2;
  ArrayList<Integer> enemyx;
  ArrayList<Integer> enemyy;

  void drawer()
  {
    enemyx = new ArrayList<Integer>();
    enemyy = new ArrayList<Integer>();
    enemyx.add(velocityx);
    enemyy.add(velocityy);
    for (int i = 0; i < enemyx.size(); i++)
    { 
      fill(random(500), random(500), random(500));
      triangle((enemyx.get(i) - 30) + velocityx, (enemyy.get(i)) + velocityy, (enemyx.get(i) + 30) + velocityx, (enemyy.get(i)) + velocityy, (enemyx.get(i)) + velocityx, (enemyy.get(i) + 60) + velocityy);
      decoy = i;
      move();
      big = random(size);
      if (big == 1)
      {
        velocityx = 600;
        velocityy = 20; 
        enemyx.add(velocityx);
        enemyy.add(velocityy);
      }
    }
  }

  void update()
  {
    move();
    hitdetection();
  }

  void hitdetection()
  {
    if ((beamx < enemyx.get(decoy) + 30) && (beamx > enemyx.get(decoy) - 30) && (beamy > enemyy.get(decoy)) && (beamy < enemyy.get(decoy) + 60))
    {
      score += 10;
      enemyx.remove(decoy);
      enemyy.remove(decoy);
    }
    if ((enemyx.get(decoy) + 30) > width || (enemyx.get(decoy) - 30) < 0)
    {
      velocityx = -velocityx;
    }
    if (enemyy.get(decoy) < 0 || (enemyy.get(decoy) + 60) > height)
    {
      velocityy = -velocityy;
    }
  }

  void move()
  {
    boy = random(4);
    if (boy == 1)
    {
      velocityx += 10;
    }
    if (boy == 2)
    {
      velocityx -= 10;
    }
    if (boy == 3)
    {
      velocityy += 10;
    }
    if (boy == 4)
    {
      velocityy -= 10;
    }
  }
}

