
final float FLOWER_ALPHA = 255;//flowers transparency
final int NB_FLOWERS_MAX = 120;
final int NB_FLOWERS_MIN = 50;
final color BG_COLOR = color(52, 145, 62);//background color
final float DISAPEAR_MARGIN = .23;//portion of stage where flowers disappear

color petalColor;
float heartRadiusMin;
float heartRadiusMax;
float XfactorUp;//used for the petals' shape
float YfactorUp;//used for the petals' shape
float XfactorDown;//used for the petals' shape
float YfactorDown;//used for the petals' shape

ArrayList<Flower> flowers;
int nbFlowers = (int)random(NB_FLOWERS_MIN, NB_FLOWERS_MAX);
Boolean firstLoadBug = true;

Wind wind = new Wind();
Tree tree;

void setup()
{
  size(950, 420, P2D);
  frameRate(30);
  tree = new Tree();
}

void initialize(Boolean p_firstTimeBug)
{
  petalColor = color(random(255), random(255), random(255));
  heartRadiusMin = random(1, 3.5);
  heartRadiusMax = random(4, 8);
  XfactorUp = random(.3, .9);
  YfactorUp = random(.2, .7);
  XfactorDown = random(.1, .25);
  YfactorDown = random(.1, .5);
  flowers = new ArrayList<Flower>();
  for (int i = 0; i < nbFlowers; i++)
  {
    flowers.add(new Flower(true, p_firstTimeBug));
  }
}

void draw()
{
  background(BG_COLOR);
  if(!tree.imagesLoaded)
  {//if images are not loaded yet, then check again
    if(tree.initialize())
    {//if images are finally loaded, then flowers can be created
      initialize(firstLoadBug);
    }
  }else
  {
    image(tree.img, (width - tree.imageW) / 2, height - tree.imageH);
  
    wind.update();  
    giveBirth();
    giveDeath();
  
    nbFlowers = flowers.size();
    for (int i = nbFlowers-1; i > 0; i--)
    {
      if (!(flowers.get(i).update()))
      {
        flowers.remove(i);
      }
    }
  }
}

void giveBirth()
{
  if (flowers.size() < NB_FLOWERS_MAX && random(1) < .11)
    flowers.add(new Flower(false, firstLoadBug));
}

void giveDeath()
{
  int nb = flowers.size();
  if (nb > NB_FLOWERS_MIN && random(1) < .05)
    (flowers.get(nb-1)).fall();
}

void mousePressed()
{
  if (mouseButton == RIGHT)
  {
    nbFlowers = flowers.size();
    for (int i = nbFlowers-1; i > 0; i--)
    {
      flowers.get(i).fall();
    }
  } else if (mouseButton == LEFT)
  {
    if(firstLoadBug) firstLoadBug = false;
    tree.initialize();
    initialize(false);
  }
}

void keyPressed()
{
  switch(key)
  {
  case 'c':
    petalColor = color(random(255), random(255), random(255));
    break;
  case 'f':
    if (flowers.size() < NB_FLOWERS_MAX)
    {
      for (int i = 0; i < 10; i++)
      {
        flowers.add(new Flower(false, false));
      }
    }
    break;
  }
}

class Flower
{
 private final static float BOUNCE = -.38;
  private final static float GRAVITY = .34;
  private final static float FRICTION = .25;
  private final static float PETAL_LENGTH_MAX = 14;
  private final static float PETAL_LENGTH_MIN = 3;
  private final static float AGE_MAX = 520;
  private final PVector SPEED_MAX = new PVector(10, 10);
  
  Boolean onTree = true;
  int nbPetals = (int)random(5, 8);
  float petalLength = PETAL_LENGTH_MIN;
  float heartRadius;
  float theta = random(TWO_PI);
  float thetaSpeed = random(.12) * (random(1) < .5 ? 1 : -1);
  Boolean hasTouchedGround = false;
  PVector speed = new PVector(0, random(1, 9));
  PVector pos;
  int age;
  int fadeOut = 0;

  Flower(Boolean isFirstTime, Boolean p_firstTimeBug)
  {
    stroke(0);    
  
    age = isFirstTime ? (int)random(AGE_MAX) : 0;
    speed = new PVector(0, 0);

    if(p_firstTimeBug)
    {
      pos = new PVector((int)random(width), (int)random(0, height * .6));      
    }else
    {
      Boolean found = false;
      while (!found)
      {
        int x = (int)random(width);
        int y = (int)random(0, height * .75);
        color tmpCol = tree.myPixels[y * width + x];
        if (red(tmpCol) < 20 && green(tmpCol) < 20 && blue(tmpCol) < 20)
        {
          pos = new PVector(x, y);
          found = true;
        }
        //println("r: " + red(tmpCol) + "   g: " + green(tmpCol) + "   b: " + blue(tmpCol));
      }
    }
  }

  Boolean update()//returns whether the flower is still visible or not
  { 
    if (onTree)
    {
      age ++;
      petalLength = map(age, 0, AGE_MAX, PETAL_LENGTH_MIN, PETAL_LENGTH_MAX);
      heartRadius = map(age, 0, AGE_MAX, heartRadiusMin, heartRadiusMax);
      if (age > AGE_MAX)
      {
        onTree = false;
      }
    }
    if(!onTree)
    {
      speed.x += FRICTION * wind.speed * petalLength / (2*PETAL_LENGTH_MAX);
      speed.y += GRAVITY * petalLength / (2*PETAL_LENGTH_MAX);
      speed.x = constrain(speed.x, -SPEED_MAX.x, SPEED_MAX.x);
      speed.y = constrain(speed.y, -SPEED_MAX.y, SPEED_MAX.y);
      pos.add(speed);

      if (pos.y + petalLength > height)
      {
        pos.y = height - petalLength;
        speed.y *= BOUNCE; 
        hasTouchedGround = true;
      }
      if (hasTouchedGround)
      {
        thetaSpeed = speed.x / petalLength / PI * 2;
      }
    }

    theta += thetaSpeed;
    if (hasTouchedGround && fadeOut == 0 && (pos.x < DISAPEAR_MARGIN*width || pos.x > width*(1-DISAPEAR_MARGIN)))
    {
      fadeOut = 1;
    }
    Boolean isAlive = true;
    if (fadeOut > 0)
    {
      fadeOut+=3;
      if (fadeOut > FLOWER_ALPHA)
      {
        isAlive = false;
      }
    }
    if(isAlive)
    {
      display();
    }
    return isAlive;
  }

  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);

    //petals
    stroke(200, FLOWER_ALPHA - fadeOut);
    noFill();
    fill(petalColor, FLOWER_ALPHA - fadeOut);
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
    fill(220, 170, 12, FLOWER_ALPHA - fadeOut);
    stroke(20, FLOWER_ALPHA - fadeOut);
    ellipse(0, 0, heartRadius, heartRadius);

    popMatrix();
  }

  void fall()
  {
    onTree = false;
  }
}

/* @pjs preload="tree1.png"; */
/* @pjs preload="tree2.png"; */
/* @pjs preload="tree3.png"; */
/* @pjs preload="tree4.png"; */
/* @pjs preload="tree5.png"; */
/* @pjs preload="tree6.png"; */
/* @pjs preload="tree7.png"; */
/* @pjs preload="tree8.png"; */

class Tree
{
  PGraphics pg;
  PImage[] loadImgs;
  PImage img;
  int imageW, imageH;
  final int nbTrees = 8;
  final color treeColor = color(0, 0, 0);
  color[] myPixels;//prevents from calling pg.loadPixels() too often
  int treeNb;
  Boolean imagesLoaded = false;
  
  Tree()
  {
    pg = createGraphics(width, height, P2D);
    myPixels = new color[width * height];
    loadImgs = new PImage[nbTrees];
    for (int i = 0; i < nbTrees; i++)
    {
      loadImgs[i] = requestImage("tree" + str(i+1) + ".png");
    }
  }

  Boolean initialize()
  {
    treeNb = (int)random(1, nbTrees);
    img = loadImgs[treeNb].get();
    imageW = img.width;
    imageH = img.height;
    imagesLoaded = (imageW > 0) && (imageH > 0);
    if (imagesLoaded)
    {
      float maxRatio = max((float)imageW/width, (float)imageH/height);
      if (maxRatio > 1)
      {
        imageW /= maxRatio;
        imageH /= maxRatio;
        img.resize(imageW, imageH);
      }

      pg.beginDraw();
      pg.fill(255);
      pg.noStroke();
      pg.rect(0, 0, width, height);
      pg.image(img, (width - imageW) / 2, height - imageH);
      pg.endDraw();
      pg.loadPixels();
      arrayCopy(pg.pixels, myPixels);
      pg.updatePixels();
    }
    return imagesLoaded;
  }
}

class Wind
{
  final float SPEED_MAX = 2;
  float speed = random(-SPEED_MAX, SPEED_MAX);
    
  float update()
  {
    float sign = random(1) < .5 ? 1 : -1;
    if(random(1) > .7)
    {
      speed += sign * .45 * random(1);//increase
    }else
    {
      speed -= sign * .29 * random(1);//decrease
    }
    speed = constrain(speed, -SPEED_MAX, SPEED_MAX);
    return speed;
  }
}



