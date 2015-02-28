
//DEPTH PARALYSIS Version 1.0
//By: Siddharth Mankad
//Portfolio: http://www.behance.net/smmankad/Frame
//(cc)Copyleft 2010, National Institute of Design, PGC, Gandhinagar


int numPoints;
float[] a_x;
float[] a_y;


void setup()
{
  smooth();
  numPoints=10;
  size(800,600);
  noCursor();
  a_x = new float[numPoints];
  a_y = new float[numPoints];
}
  
void draw()
{
  for(int i=0;i<numPoints;i++)
  {
    a_x[i]=random(width);
    a_y[i]=random(height);
  }
  
  for(int i=0;i<numPoints;i++)
  {
    filter(BLUR);
    fill(random(255),random(255),random(255),random(255));
    float r = random(0,100);
    ellipse(a_x[i],a_y[i],r,r);
  }
  
  for(int i=1;i<numPoints;i++)
  {
    strokeWeight(random(0,8));
    line(a_x[i-1],a_y[i-1],a_x[i],a_y[i]);
  }

}

void keyPressed()
{
  background(255);
}


