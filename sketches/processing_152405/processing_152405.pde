
final int LENGTH = 286;//number of segments
final float DIST_MAX = 4;//length of each segment
final int GAP = 2;//nunber of segments between each orthogonal line
PVector[] pos;//position of each segment
color[] cols;
MyColor myCol = new MyColor();
final int RAD = 30;


void setup()
{
  size(600, 450, P2D);
  noFill();
  pos = new PVector[LENGTH];
  cols = new color[LENGTH];
  for (int i = 0; i < LENGTH; i++)
  {
    pos[i] = new PVector(i * DIST_MAX, height/2);
    cols[i] = myCol.getColor();
  }
}

void draw()
{
  background(50);
  pos[0] = new PVector(mouseX, mouseY);
  myCol.update();
  cols[0] = myCol.getColor();
  for (int i = 1; i < LENGTH; i++)
  {
    if (PVector.dist(pos[i], pos[i-1]) > DIST_MAX)
    {
      PVector tmp = PVector.sub(pos[i-1], pos[i]);
      tmp.normalize();
      tmp.mult(DIST_MAX);
      pos[i] = PVector.sub(pos[i-1], tmp);
    }
  }

  for (int i = LENGTH-1; i > -1; i--)
  {
    pushMatrix();
    translate(pos[i].x, pos[i].y);
    if(i > 0)
    {
      cols[i] = cols[i-1];  
      if ((i + 1) % GAP == 0)
      {
        rotate(atan2(pos[i].y - pos[i-1].y, pos[i].x - pos[i-1].x) + PI/2);
        stroke(cols[i]);
        strokeWeight(2);
        line(-25, 0, 25, 0);
      }
    }
    stroke(0, 90);
    strokeWeight(1);
    fill(cols[i], 150);
    ellipse(0, 0, abs(map(pos[i].x, 0, width, -RAD, RAD)), 0);
    popMatrix();
  }
}

class MyColor
{
  float R, G, B, Rspeed, Gspeed, Bspeed;
  final static float minSpeed = .2;
  final static float maxSpeed = .8;
  MyColor()
  {
    init();
  }
  
  public void init()
  {
    R = random(255);
    G = random(255);
    B = random(255);
    Rspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Gspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Bspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
  }
  
  public void update()
  {
    Rspeed = ((R += Rspeed) > 255 || (R < 0)) ? -Rspeed : Rspeed;
    Gspeed = ((G += Gspeed) > 255 || (G < 0)) ? -Gspeed : Gspeed;
    Bspeed = ((B += Bspeed) > 255 || (B < 0)) ? -Bspeed : Bspeed;
  }
  
  public color getColor()
  {
    return color(R, G, B);
  }
}
