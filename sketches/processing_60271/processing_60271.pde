
PVector[] pts;
float camAngle = 0;
int camDist = 280;

void setup()
{
  size(640, 480, P3D);
  
  InitializePoints();
  
  noFill();
  stroke(255);
  strokeWeight(2);
}

void draw()
{
  camera(camDist*sin(radians(camAngle)), 0, camDist*cos(radians(camAngle)), 0, 0, 0, 0, 1, 0);

  background(20);
  
  
  for(int i=0; i<pts.length-1; i++)
  {
    PVector pt1 = pts[i];
    PVector pt2 = pts[(i+1) % pts.length];
    line(pt1.x, pt1.y, pt1.z, pt2.x, pt2.y, pt2.z);
  }
  
  camAngle += (6.0 * sin(PI * float(mouseX)/width + PI/2) );
}

void InitializePoints()
{ 
  AddSpiralPoints(49, 2, 100);
  OffsetPoints();
}

void AddSpiralPoints(int totalLevels, int diff, int startR)
{
  pts = new PVector[4*totalLevels];
  
  for(int levels = totalLevels; levels > 0; levels--)
  {
    for(int i=0; i<levels; i++)
    {
      pts[i*4] = new PVector(-1*startR, startR);
      pts[i*4+1] = new PVector(startR, startR);
      pts[i*4+2] = new PVector(startR, -1*startR);
      pts[i*4+3] = new PVector(-1*(startR+diff), -1*startR);
    }
    startR -= diff;
  } 
}

void OffsetPoints()
{
  PVector cam = new PVector(0, 0, camDist);
  for(int i=0; i<pts.length; i++)
  {
    PVector diff = PVector.sub(cam, pts[i]);
    PVector newPt = PVector.add(pts[i], PVector.mult(diff, 0.5*sin(i/3.5)));
    pts[i] = newPt;
  }
}


