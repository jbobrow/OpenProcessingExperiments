
final int BG_COLOR = 60;

PVector originePoint = new PVector(0, 0);
ArrayList<Tentacle> tabTentacles;
ArrayList<Tentacle> tentaclesToAdd;//tentacles that were born
Boolean doAdd = false;
Boolean rotOn = false;
float rotX, rotY, rx, ry;
PVector mouseClick;
int maxTentacles = 130;

void setup()
{
  size(450, 450, OPENGL);
  tabTentacles = new ArrayList<Tentacle>();
  try {
    PApplet a;
    a = new PApplet();
  }
  catch(Throwable e) {
    maxTentacles = 30;
  }
}

void draw()
{
  background(BG_COLOR);
  lights();
  translate(width/2, height/2);
  if (rotOn)
  {
    rx = rotX + map(mouseClick.y-mouseY, -height, height, -PI, PI);
    ry = rotY + map(mouseClick.x-mouseX, -height, width, PI, -PI);
  } else
  {
    rx = rotX;
    ry = rotY;
  }
  rotateX(rx);
  rotateY(ry);

  //allows to add splitting tentacles from the growing ones
  tentaclesToAdd = new ArrayList<Tentacle>();

  int s1 = tabTentacles.size();
  for (int i = 0; i < s1; i ++)
  {
    tabTentacles.get(i).update(i);
  }

  if (doAdd && s1 < maxTentacles)
  {
    originePoint = new PVector(mouseX-width/2, mouseY-height/2, 0);
    tabTentacles.add(new Tentacle(originePoint, 0, 0));
  }

  int s2 = tentaclesToAdd.size();
  for (int i = 0; i < s2; i ++)
  {
    tabTentacles.add(tentaclesToAdd.get(i));
  }
}

void addTentacles()
{
  tabTentacles = new ArrayList<Tentacle>();
  rx = 0;
  ry = 0;
  rotX = 0;
  rotY = 0;
  doAdd = true;
}

void mousePressed()
{
  rotOn = false;
  addTentacles();
}

void mouseReleased()
{
  doAdd = false;
  mouseClick = new PVector(mouseX, mouseY);
  rotOn = true;
}



class Part
{
  PVector pos = new PVector(0, 0, 0);
  float r;//radius;

  Part(PVector p_pos, float p_rad)
  {
    pos = p_pos.get();
    r = p_rad;
  }
}

class Tentacle
{
  final int MAX_NEW_TENTACLES = 3 - 1;//max nb of new tentacles at a time
  final int NB_CIRCLES_MIN = 18;
  final int NB_CIRCLES_MAX = 75;
  final float DISTANCE_MIN = .25;//min percentage of the radius
  final float DISTANCE_MAX = .4;//max percentage of the radius
  final float DIST_VAR_MAX = .31;//max evolution of the distance
  final float EVOL_RANDOM = .5;//percentage of big/small circles center's moves 
  final int TENTACLE_SIZE_MIN = 18;//min number of circles per tentacle
  final float DISPERTION_RATE = .025;//chance that a tentacle will split
  final float Z_STEP = 2;
  PVector center = new PVector(0, 0);
  PVector prev;//previous position of the circle
  float prevDist = random(DISTANCE_MIN, DISTANCE_MAX);//previous distance between two circles
  int nbCirclesTotal = (int)random(NB_CIRCLES_MIN, NB_CIRCLES_MAX);
  int nbCircles;//current count on the number of circles
  float m_angle = random(TWO_PI);//angle between two circles
  final color m_color = color(235, 0, 158);//color of the circles
  ArrayList<Part> parts;

  Tentacle(PVector p_center, int p_nbCircles, int p_nbCirclesTotal)
  {
    parts = new ArrayList<Part>();
    nbCirclesTotal = p_nbCirclesTotal > 0 ? p_nbCirclesTotal : nbCirclesTotal;
    nbCircles = p_nbCircles;
    center = p_center;
    prev = center.get();
  }

  void update(int p_rank)
  {
    if (nbCircles < nbCirclesTotal)
    {
      if (random(1) < DISPERTION_RATE && (nbCirclesTotal-nbCircles) > NB_CIRCLES_MIN)
      {
        int nbNewTentacles = 1 + (int)random(MAX_NEW_TENTACLES);
        for (int i = 0; i < nbNewTentacles; i++)
        {
          tentaclesToAdd.add(new Tentacle(prev, nbCircles, (int)random(.9*nbCirclesTotal, nbCirclesTotal)));
        }
        return;
      }

      nbCircles++;
      if (prevDist < DISTANCE_MIN + (DISTANCE_MAX - DISTANCE_MIN)/2)
      {
        prevDist = prevDist + DIST_VAR_MAX * random(EVOL_RANDOM) * (random(1) < EVOL_RANDOM ? -1 : 1);
      } else
      {
        prevDist = prevDist + DIST_VAR_MAX * random(EVOL_RANDOM) * (random(1) < EVOL_RANDOM ? 1 : -1);
      }

      m_angle += (random(1) - .5) * PI / 10;
      float l_curDiameter = 2 * sqrt(.8 * (nbCirclesTotal - nbCircles));
      PVector delta = new PVector(l_curDiameter * prevDist * cos(m_angle) / 3, l_curDiameter * prevDist * sin(m_angle) / 3, Z_STEP);
      prev.add(delta);
      parts.add(new Part(prev, l_curDiameter));
    }    

    //stroke(0, 90);
    noStroke();

    for (int i = 0; i < parts.size (); i ++)
    {
      Part p = parts.get(i);
      pushMatrix();
      translate(p.pos.x, p.pos.y, p.pos.z);
      rotate(p.pos.z/16);
      fill(i % 2 == 0 ? m_color : m_color | 0x868686);
      box(p.r, p.r, p.r);
      
      translate(-2*p.pos.x, -2*p.pos.y, -2*p.pos.z);
      rotate(p.pos.z/16);
      fill(i % 2 == 0 ? #DDA5B0 : #CC04A0);
      box(p.r, p.r, p.r);
      popMatrix();
    }
  }
}


