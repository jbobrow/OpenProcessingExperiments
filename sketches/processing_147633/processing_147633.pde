
class Birdy
{
  final static float BOID_RAD = 2;
  final static float MAX_SPEED = 2;
  final static int LINE_LENGTH = 40;

  int rank;
  PVector acc;
  PVector speed = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
  PVector pos = new PVector(random(SPHERE_W), random(SPHERE_W), random(SPHERE_W));
  PVector[] pts = new PVector[LINE_LENGTH];

  Birdy(int p_rank)
  {
    rank = p_rank;
    for (int i = 0; i < LINE_LENGTH; i++)
    {
      pts[i] = new PVector(SPHERE_W/2, SPHERE_W/2, SPHERE_W/2);
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
    speed.add(acc);
    speed.limit(MAX_SPEED);
    pos.add(speed);

    pushMatrix();
    strokeWeight(1.5);
    stroke(200);
    fill(R, G, B);    

    /////////////////////////
    /////////////////////////
    /*
    PVector p = pos.get();//or use directly pos
     float l = p.mag();
     //p.sub(new PVector(SPHERE_W/2, SPHERE_W/2, SPHERE_W/2));
     p.normalize();
     p.mult(map(l, 0, SPHERE_W*sqrt(3), SPHERE_W*.9/2, SPHERE_W*1.1/2));
     translate(p.x, p.y, p.z);
     */

    PVector p = pos.get();//or use directly pos
    float l = p.mag();
    p.sub(new PVector(SPHERE_W/2, SPHERE_W/2, SPHERE_W/2));
    p.normalize();
    //p.mult(map(l, 0, SPHERE_W*sqrt(3), SPHERE_W*.9/2, SPHERE_W*1.2/2));
    p.mult(SPHERE_W/2);
    PVector.add(p, new PVector(SPHERE_W/2, SPHERE_W/2, SPHERE_W/2), pos);
    translate(p.x, p.y, p.z);
    /////////////////////////
    /////////////////////////

    ellipse(0, 0, BOID_RAD, BOID_RAD);
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
    translate(-SPHERE_W/2, -SPHERE_W/2, -SPHERE_W/2);
    beginShape();
    noFill();
    strokeWeight(1);
    stroke(R, G, B, 0);
    vertex(SPHERE_W/2, SPHERE_W/2, SPHERE_W/2);
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


