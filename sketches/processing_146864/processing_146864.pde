
final int NB_BIRDIES_MAX = 750;
final int NB_BIRDIES_MIN = 20;
final static float minDist = 1;
float maxDist;
final static float minStrength = 0.00;
final static float maxStrength = 2;

final float[] EXCLUDE_STRENGTH = {
  .3, .4, .1, 1.5, 1.67, 1.31
};
final float[] INCLUDE_STRENGTH = {
  .2, .15, 2, .1, .43, 1.52
};
final float[] MIME_STRENGTH = {
  .1, .1, .3, .2, 1.24, 1.85
};
final float[] EXCLUDE_ZONE = {
  80, 20, 100, .100, 290, 56
};
final float[] INCLUDE_ZONE = {
  70, 70, 40, 50, 107, 33
};
final float[] MIME_ZONE = {
  50, 50, 50, 50, 310, 27
};

int nbBirdies = 200;//(int)random(NB_BIRDIES_MIN, NB_BIRDIES_MAX);
float excludeStrength = EXCLUDE_STRENGTH[1];
float includeStrength = INCLUDE_STRENGTH[1];
float mimeStrength = MIME_STRENGTH[1];
float excludeZone = EXCLUDE_ZONE[1];
float includeZone = INCLUDE_ZONE[1];
float mimeZone = MIME_ZONE[1];
int profile = 0;
Boolean isColorAlive = true;


int bgColor = 55;
float R, G, B, Rspeed, Gspeed, Bspeed;
Birdy[] birdies;

final int SLIDER_WIDTH = 100;
final int SLIDER_HEIGHT = 10;

void setup()
{
  size(720, 530, OPENGL);
  maxDist = sqrt(width * width + height * height) / 4;
  rectMode(CENTER);
  birdies = new Birdy[NB_BIRDIES_MAX];
  initialize(); 
  sphereDetail(3);
}

void initialize()
{
  background(bgColor);
  for (int i = 0; i < NB_BIRDIES_MAX; i++)
  {
    birdies[i] = new Birdy(i);
  }
  generateColors();
}

void draw()
{
  lights();
  background(120);
  translate(width/2, height/2);
  rotateX(map(mouseY, 0, height, 0, TWO_PI));
  rotateY(map(mouseX, 0, width, 0, TWO_PI));

  for (int i = 0; i < nbBirdies; i++)
  {
    birdies[i].behave();
  }
  for (int i = 0; i < nbBirdies; i++)
  {
    birdies[i].display();
    birdies[i].drawLines();
  }

  stroke(2);
  fill(0, 125, 0, 10);
  box(Birdy.BOX_W, Birdy.BOX_W, Birdy.BOX_W);

  if (isColorAlive)
  {
    Rspeed = ((R += Rspeed) > 255 || (R < 0)) ? -Rspeed : Rspeed;
    Gspeed = ((G += Gspeed) > 255 || (G < 0)) ? -Gspeed : Gspeed;
    Bspeed = ((B += Bspeed) > 255 || (B < 0)) ? -Bspeed : Bspeed;
  }
}

void generateColors()
{
  R = random(255);
  G = random(255);
  B = random(255);
  Rspeed = (random(1) > .5 ? 1 : -1) * random(.5, 1.2);
  Gspeed = (random(1) > .5 ? 1 : -1) * random(.5, 1.2);
  Bspeed = (random(1) > .5 ? 1 : -1) * random(.5, 1.2);
}

void keyPressed()
{
  println(keyCode);
  switch(keyCode)
  {
  case 97://1
  case 98://2
  case 99://3
  case 100://4
  case 101://5
  case 102://6
    excludeStrength = EXCLUDE_STRENGTH[keyCode-97];
    includeStrength = INCLUDE_STRENGTH[keyCode-97];
    mimeStrength = MIME_STRENGTH[keyCode-97];
    excludeZone = EXCLUDE_ZONE[keyCode-97];
    includeZone = INCLUDE_ZONE[keyCode-97];
    mimeZone = MIME_ZONE[keyCode-97];
    println("chosen profile: nÃ�Â° " + (keyCode-97));
    break;
  case 96://0
      excludeStrength = random(minStrength, maxStrength);
      includeStrength = random(minStrength, maxStrength);
      mimeStrength = random(minStrength, maxStrength);
      excludeZone = random(minDist, maxDist);
      includeZone = random(minDist, maxDist);
      mimeZone = random(minDist, maxDist);
      println("random profile:");
      println(excludeStrength+"\n"+includeStrength+"\n"+mimeStrength+"\n"+excludeZone+"\n"+includeZone+"\n"+mimeZone);
    break;
  case 67://C
    isColorAlive = !isColorAlive;
    break;
  default:
    break;
  } 
}
class Birdy
{
  final static float RAD = 2;
  final static float BOUNCE = -.7;
  final static float MAX_SPEED = 4;
  final static float MIN_Z = -500;
  final static float MAX_Z = -500;
  final static int BOX_W = 250;
  final static int Z = 200;
  final static int LINE_LENGTH = 35;
  
  int rank;
  PVector acc;
  PVector speed = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
  PVector pos = new PVector(random(width), random(height), random(0, BOX_W));
  PVector[] pts = new PVector[LINE_LENGTH];

  Birdy(int p_rank)
  {
    rank = p_rank;
    for (int i = 0; i < LINE_LENGTH; i++)
    {
      pts[i] = new PVector(BOX_W/2, BOX_W/2, BOX_W/2);
    }
  }

  void behave()
  {
    acc = new PVector(0, 0, 0);
    int countExclude = 0;
    int countInclude = 0;
    int countMime = 0;
    PVector exclusion = new PVector(0, 0, 0);
    PVector inclusion = new PVector(0, 0, 0);
    PVector mime = new PVector(0, 0, 0);

    for (int i = 0; i < nbBirdies; i++)
    {
      if (i != rank)
      {
        Birdy nextBirdy = birdies[i];
        float dist = PVector.dist(pos, nextBirdy.pos);
        /////////////////////////////////////////////////
        //exculsion
        if (dist < excludeZone)
        {
          PVector diff = pos.get();          
          diff.sub(nextBirdy.pos);
          diff.normalize();
          exclusion.add(diff);
          countExclude ++;
        }        
        /////////////////////////////////////////////////
        //inclusion
        if (dist < includeZone)
        {

          inclusion.add(nextBirdy.pos);
          countInclude ++;
        }
        /////////////////////////////////////////////////
        //mime
        if (dist < mimeZone)
        {
          mime.add(nextBirdy.speed);
          countMime ++;
        }
      }
    }
    if (countExclude > 0)
    {
      exclusion.div(countExclude);
      exclusion.mult(excludeStrength);
      acc.add(exclusion);
    }
    if (countInclude > 0)
    {
      inclusion.div(countInclude);
      inclusion.sub(pos);
      inclusion.normalize();
      inclusion.mult(includeStrength);
      acc.add(inclusion);
    }
    if (countMime > 0)
    {
      mime.div(countMime);
      mime.mult(mimeStrength);
      acc.add(mime);
    }
  }

  void display()
  {
    Boolean hasCrossed = false;
    speed.add(acc);
    speed.limit(MAX_SPEED);
    pos.add(speed);
    
    if (pos.x < 0)
    {
      pos.x = 0;//BOX_W;
      hasCrossed = true;
      speed.x *= BOUNCE;
    }
    else if (pos.x > BOX_W)
    {
      pos.x = BOX_W;
      hasCrossed = true;
      speed.x *= BOUNCE;
    }
    if (pos.y < 0)
    {
      pos.y = 0;
      hasCrossed = true;
      speed.y *= BOUNCE;
    }
    else if (pos.y > BOX_W)
    {
      pos.y = BOX_W;
      hasCrossed = true;
      speed.y *= BOUNCE;
    }
    if (pos.z < 0)
    {
      pos.z = 0;
      speed.z *= BOUNCE;
    }
    else if (pos.z > BOX_W)
    {
      pos.z = BOX_W;
      speed.z *= BOUNCE;
    }
    
    pushMatrix();
    noStroke();
    fill(R, G, B);        
    translate(pos.x-BOX_W/2, pos.y-BOX_W/2, pos.z-BOX_W/2);
    sphere(RAD/2);
    popMatrix();    
  }
  
  void drawLines()
  {
    for (int i = LINE_LENGTH-1; i > 0; i--)
    {
      pts[i] = pts[i-1].get();
    }
    pts[0] = pos.get();
    pushMatrix();
    translate(-BOX_W/2, -BOX_W/2, -BOX_W/2);
    beginShape();
    noFill();
    strokeWeight(RAD);
    for (int i = 1; i < LINE_LENGTH; i++)
    {
      float colorAlter = map(i, 0, LINE_LENGTH-1, 100, 0);
      float colrAlpha = map(i, 0, LINE_LENGTH-1, 255, 0);
      stroke(R - colorAlter, G - colorAlter, B - colorAlter, colrAlpha);
      vertex(pts[i-1].x, pts[i-1].y, pts[i-1].z);
      vertex(pts[i].x, pts[i].y, pts[i].z);
    }
    endShape();
    popMatrix();
  }
}

