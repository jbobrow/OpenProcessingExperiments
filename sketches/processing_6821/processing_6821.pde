
final int RANDOM = -1;
final int VERT = 1;
final int ROUGE = 0;
final int BLEU= 2;

final int NB_BALLES_MAX = 350;
balle boule[] = new balle[NB_BALLES_MAX];

void setup()
{
  strokeWeight(2);
  stroke(10,120);
  background(235,240,255);
  smooth();
  size(400,300);
  for (int i = 0; i < NB_BALLES_MAX; i++)
    boule[i] = new balle(floor(random(2.99))); 
}

void draw()
{
 
  for(int j = 0; j < NB_BALLES_MAX-1; j++)
    for(int i = j + 1; i < NB_BALLES_MAX; i++)
    {
      collisionBalle(boule[j],boule[i]);
    }
    
  for (int i = 0; i < NB_BALLES_MAX; i++)
    boule[i].updatePos();
}

class balle
{
  float rayon;
  float x, y;
  float velX, velY;
  float r,g,b;
  
  balle derniereBoule, derniereBoule2;

  balle(int col)
  {
    switch (col)
    {
    case 0:
    r = round(random(260) + 95);
    g = round(random(50));
    b = round(random(50));
    break;
    case 1:
    r = round(random(50));
    g = round(random(260) + 95);
    b = round(random(50));
    break;
    case 2:
    r = round(random(50));
    g = round(random(50));
    b = round(random(260) + 95);
    break;
    default:
    r = round(random(255));
    g = round(random(255));
    b = round(random(255));
    break;
    }
    
    x = random(width);
    y = random(height);
    
    velX = random(3) + 2;
    velY = random(3) + 2;
    
    rayon = random(20) + 10;
  }
  
  void updatePos()
  {
    x += velX;
    y += velY;
    
    if (x > width || x < 0)
      velX *= -1;
    if (y > height || y < 0)
      velY *= -1;
      
    if ((x-width) > 20)
      x = random(width);
    else if (x < -20)
      x = random(width);
    if (y-height > (height + 20))
      y = random(height);
    else if (y < -20)
      y = random(height);
    
    fill(r,g,b,100);
    ellipse(x,y,rayon,rayon);
  }
  
  void changeVit()
  {
    velX += (random(2) - 1.5);
    velY += (random(2) - 1.5);
    
    if (velX >= 5)
      velX = 2.5;
    if (velY >= 5)
      velY = 2.5;  
  }
};

void collisionBalle(balle boule1,balle boule2)
{
  float distance;
  float xTmp,yTmp;
  float rayonTmp;
  
  rayonTmp = (boule1.rayon + boule2.rayon)/2;
  xTmp = boule1.x - boule2.x;
  yTmp = boule1.y - boule2.y;
  
  distance = sqrt(pow(xTmp,2) + pow(yTmp,2));
  
  if (rayonTmp > distance)
  {
    if (boule1.derniereBoule != boule2 && boule1.derniereBoule2 != boule2 && boule2.derniereBoule2 != boule1)
    {
      boule1.derniereBoule2 = boule1.derniereBoule;
      boule2.derniereBoule2 = boule2.derniereBoule;
      boule1.derniereBoule = boule2;
      boule2.derniereBoule = boule1;
      
      boule1.changeVit();
      boule2.changeVit();
      
      boule1.velX *= -1;
      boule1.velY *= -1;
      boule2.velX *= -1;
      boule2.velY *= -1;
      

    }
  }
}

