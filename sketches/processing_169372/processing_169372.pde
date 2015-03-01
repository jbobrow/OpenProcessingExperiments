

final int nbWeeds = 80;
SeaWeed[] weeds;
PVector rootNoise = new PVector(random(123456), random(123456));
int mode = 1;

void setup()
{
  size(600, 450, P2D);
  strokeWeight(1);
  weeds = new SeaWeed[nbWeeds];
  for (int i = 0; i < nbWeeds; i++)
  {
    weeds[i] = new SeaWeed(map(i, 0, nbWeeds, -20, width+20), 0, (int)map(i, 0, nbWeeds, 110, 35));
  }
}

void draw()
{
  background(50);
  rootNoise.add(new PVector(.01, .01));
  for (int i = 0; i < nbWeeds; i++)
  {
    weeds[i].update();
  }
}

void keyPressed()
{
  mode = (mode + 1) % 2;
}


class MyColor
{
  float R, G, B, Rspeed, Gspeed, Bspeed;
  final static float minSpeed = .6;
  final static float maxSpeed = 1.8;
  final static float minR = 220;
  final static float maxR = 255;
  final static float minG = 70;
  final static float maxG = 120;
  final static float minB = 0;
  final static float maxB = 40;
  
  MyColor()
  {
    init();
  }
  
  public void init()
  {
    R = random(minR, maxR);
    G = random(minG, maxG);
    B = random(minB, maxB);
    Rspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Gspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Bspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
  }
  
  public void update()
  {
    Rspeed = ((R += Rspeed) > maxR || (R < minR)) ? -Rspeed : Rspeed;
    Gspeed = ((G += Gspeed) > maxG || (G < minG)) ? -Gspeed : Gspeed;
    Bspeed = ((B += Bspeed) > maxB || (B < minB)) ? -Bspeed : Bspeed;
  }
  
  public color getColor()
  {
    return color(R, G, B);
  }
}
class SeaWeed
{
  final static float DIST_MAX = 4;//length of each segment
  final static float maxNbSeg = 100;//max number of segments
  final static float minNbSeg = 35;//min number of segments
  final static float maxWidth = 50;//max width of the base line
  final static float minWidth = 11;//min width of the base line
  final static float FLOTATION = -3.5;//flotation constant
  float mouseDist;//mouse interaction distance
  int nbSegments;// = (int)random(minNbSeg, maxNbSeg);//number of segments
  PVector[] pos;//position of each segment
  color[] cols;//colors array, one per segment
  float[] rad;
  MyColor myCol = new MyColor();
  float x, y;//origin of the weed

  SeaWeed(float p_x, float p_y, int p_nbSegments)
  {
    nbSegments = p_nbSegments;
    pos = new PVector[nbSegments];
    cols = new color[nbSegments];
    rad = new float[nbSegments];//map(nbSegments, minNbSeg, maxNbSeg, minWidth, maxWidth)* cos(map(i, 0, nbSegments - 1, 0, HALF_PI))
    x = p_x;
    y = p_y;
    mouseDist = map(nbSegments, minNbSeg, maxNbSeg, 22, 50);
    for (int i = 0; i < nbSegments; i++)
    {
      pos[i] = new PVector(x, i * DIST_MAX);
      cols[i] = myCol.getColor();
      rad[i] = 3;
    }
  }

  void update()
  {
    PVector mouse = new PVector(mouseX, mouseY);

    pos[0] = new PVector(x, y);
    for (int i = 1; i < nbSegments; i++)
    {
      float n = noise(rootNoise.x + .002 * pos[i].x, rootNoise.y + .002 * pos[i].y);
      float noiseForce = (.4 - n) * 4;
      pos[i].x += noiseForce;
      pos[i].y -= map(i, 1, nbSegments, FLOTATION, .6*FLOTATION);

      //mouse interaction
      float d = PVector.dist(mouse, pos[i]);
      if (d < mouseDist)// && pmouseX != mouseX && abs(pmouseX - mouseX) < 12)
      {
        PVector tmpPV = mouse.get();       
        tmpPV.sub(pos[i]);
        tmpPV.normalize();
        tmpPV.mult(mouseDist);
        tmpPV = PVector.sub(mouse, tmpPV);
        pos[i] = tmpPV.get();
      }

      PVector tmp = PVector.sub(pos[i-1], pos[i]);
      tmp.normalize();
      tmp.mult(DIST_MAX);
      pos[i] = PVector.sub(pos[i-1], tmp);
    }

    updateColors();

    if (mode == 0)
    {
      stroke(0, 100);
    }     
    beginShape();
    noFill(); 
    for (int i = 0; i < nbSegments; i++)
    { 
      float r = rad[i];
      if (mode == 1)
      {
        stroke(cols[i]);
        vertex(pos[i].x, pos[i].y);
        //line(pos[i].x, pos[i].y, pos[i+1].x, pos[i+1].y);
      } else
      {
        fill(cols[i]);
        ellipse(pos[i].x, pos[i].y, r, r);
      }
    }
    endShape();
  }

  void updateColors()
  {
    myCol.update();
    cols[0] = myCol.getColor();
    for (int i = nbSegments-1; i > 0; i--)
    {
      cols[i] = cols[i-1];
    }
  }
}



