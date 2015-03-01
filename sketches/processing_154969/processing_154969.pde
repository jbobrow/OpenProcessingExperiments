
final int NB_FLOWERS_MAX = 200;
final int NB_FLOWERS_MIN = 80;

ArrayList<Flower> flowers;
int nbFlowers = (int)random(NB_FLOWERS_MIN, NB_FLOWERS_MAX);

void setup()
{
  size(750, 400, P2D);
  frameRate(30);
  initialize();
}
 
void initialize()
{
  flowers = new ArrayList<Flower>();
  for(int i = 0; i < nbFlowers; i++)
  {
    flowers.add(new Flower());
  }
}

void draw()
{
  fill(60, 5);
  noStroke();
  //rect(0, 0, width, height);
  //new Flower();
  
  nbFlowers = flowers.size();
  for(int i = 0; i < nbFlowers; i++)
  {
    flowers.get(i).update();
  }
}

void mousePressed()
{
  initialize();
}


class Flower
{
  int nbPetals = (int)random(5, 8);
  float petalLength = random(20, 40);
  float heartRadius = random(3, 5);
  float XfactorUp = random(.3, .9);
  float YfactorUp = random(.2, .7);
  float XfactorDown = random(.1, .25);
  float YfactorDown = random(.1, .5);
  float theta = random(TWO_PI);
  float thetaSpeed = random(1.5) * (random(1) < .5 ? 1 : -1);
  Boolean hasTouchedGround = false;
  PVector speed = new PVector(0, 0);
  PVector pos;
  int state = ON_TREE;
  
  private static final int ON_TREE = 1;
  private static final int FALLING = 2;
  private static final int ON_GROUND = 3;

  Flower()
  {
    stroke(0);
    pos = new PVector(random(width), random(height));
  }

  void update()
  {
    smooth();
    pushMatrix();
    translate(pos.x, pos.y);
    theta += thetaSpeed;
    rotate(theta);

    //petals
    stroke(0);
    noFill();
    for (int i = 0; i < nbPetals; i ++)
    {
      rotate(TWO_PI / nbPetals);
      beginShape();
      vertex(0, 0);
      bezierVertex(-petalLength*XfactorDown, -petalLength*YfactorDown, -petalLength*(1-XfactorUp), -petalLength*(1-YfactorUp), 0, -petalLength);
      bezierVertex(petalLength*(1-XfactorUp), -petalLength*(1-YfactorUp), petalLength*XfactorDown, -petalLength*YfactorDown, 0, 0);    
      endShape();
    }

    fill(200, 200, 200, 50);
    noStroke();
    for (int i = 0; i < nbPetals; i ++)
    {
      rotate(TWO_PI / nbPetals);
      beginShape();
      vertex(0, 0);
      bezierVertex(-petalLength*XfactorDown, -petalLength*YfactorDown, -petalLength*(1-XfactorUp), -petalLength*(1-YfactorUp), 0, -petalLength);
      bezierVertex(petalLength*(1-XfactorUp), -petalLength*(1-YfactorUp), petalLength*XfactorDown, -petalLength*YfactorDown, 0, 0);    
      endShape();
    }

    //heart
    fill(200, 150, 12);
    stroke(0);
    ellipse(0, 0, heartRadius, heartRadius);
    
    popMatrix();
  }
}

