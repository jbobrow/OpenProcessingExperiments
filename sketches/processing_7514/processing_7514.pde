
int[][] points = new int[3][100000];
int[] camFrom = new int[3];
int[] camTo = new int[3];
float camPos=0;
int ix;int iy;int iz;

void setup() 
{
  size(720, 480, P3D);
  colorMode(HSB, 255);
  noStroke();
  int px;int py;int pz;
  for (int z=0;z<100000;z++)
  {
    do
    {
      px=int(random(-1000,1000));
      py=int(random(-1000,1000));
      pz=int(random(-1000,1000));
    }while ((sqrt(sq(px)+sq(py)+sq(pz))>1000)||(sqrt(sq(px)+sq(py)+sq(pz))<995));
    
    points[0][z]=px;
    points[1][z]=py;
    points[2][z]=pz;
  }
  camNewPos();
  camNewPos();
}

void camNewPos()
{
  for(iz=0;iz<3;iz++)
  {
    camFrom[iz]=camTo[iz];
  }
  for(iz=0;iz<3;iz++)
  {
    camTo[iz]=int(random(-1800,1800));
  }
}

void draw() 
{
  lights();
  background(0);
  
  camPos+=0.008;
  if (camPos>=1)
  {
    camNewPos(); 
    camPos=0;
  }

  camera(camFrom[0]+((camTo[0]-camFrom[0])*camPos),
         camFrom[1]+((camTo[1]-camFrom[1])*camPos),
         camFrom[2]+((camTo[2]-camFrom[2])*camPos), // eyeX, eyeY, eyeZ
  0,0,0, // centerX, centerY, centerZ
  0.0, 1.0, 0.0); // upX, upY, upZ


  for (float sc=0.1;sc<1.5;sc+=0.3)
  {
    pushMatrix();
    scale(sc);
    stroke(color(sc*128,255,255));
    for (int z=0;z<30000*sc;z++)
    {
      point(points[0][z],points[1][z],points[2][z]);
    }
    popMatrix();
  }
}


