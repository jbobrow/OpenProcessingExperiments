
import megamu.mesh.*;


float Pi = 3.14159265358979;
float[][] points;
int NUMPOINTS = 200;
Voronoi myVoronoi;
float start = 0;

void setup()
{
  size (600,600);
  points = new float[NUMPOINTS][2];
}

void calcShape()
{
    
  for (int i = 0; i <  NUMPOINTS; i++)
  {
    int ii = i % NUMPOINTS;
    float n = i;
    float base_angle = (float) (Pi * (1+Math.sqrt(5)));
    float r = (float)Math.sqrt(n) * 20.0;
    float theta = n * base_angle;
    int x = 300 + (int) (r * Math.cos(start + theta));
    int y = 300 + (int) (r * Math.sin(start + theta));
    
    int w = (int)Math.sqrt(r*5);
    int h = (int)Math.sqrt(r*5);
    
    fill (i,0,255-i);
    ellipse(x,y,w,h);
    points[ii][0] = x;
    points[ii][1] = y;
  }
  
 myVoronoi = new Voronoi( points );
}

void draw()
{
  background(200);
  calcShape();
  
  float[][] myEdges = myVoronoi.getEdges();

  for(int i=0; i<myEdges.length; i++)
  {
  	float startX = myEdges[i][0];
  	float startY = myEdges[i][1];
  	float endX = myEdges[i][2];
  	float endY = myEdges[i][3];
        strokeWeight(2);
  	line( startX, startY, endX, endY );
  }
  delay(100);
  start+=0.05;
}

