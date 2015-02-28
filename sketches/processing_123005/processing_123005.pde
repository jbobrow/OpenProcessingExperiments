
int dist = 200;

float[] xPos = new float[dist];
float[] yPos = new float[dist];
float[] zPos = new float[dist];
float[] rot = new float[dist];

int wid= 600;
int hei= 600;

void setup()
{
  size(wid, hei, P3D);
  background(255);
  for (int i=0;i<dist;i++)
  {
    xPos[i]=random(width);
    yPos[i]=random(-height, height);
    zPos[i]=random(-height*2, height/1.5);
    rot[i]=random(0, 2);
  }
}


void draw()
{ 
  
  background(255);
  noFill();
  figure(xPos, yPos, zPos, rot);
}

void figure( float[]w, float[]h, float[]d, float[]r )
{
  lights();

  for (int i=0;i<dist;i++)
  {

    pushMatrix();
    translate( w[i], h[i], d[i]);
    rotateX( -radians( frameCount)*r[i] );
    rotateY( -radians( frameCount)*r[i] ); 
    fill(125,125,125,20);
    stroke(255);
    box(50, 50, 50);
    popMatrix();
  }
}

