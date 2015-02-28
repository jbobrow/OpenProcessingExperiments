
//hannah schmitt
//homework 12
//copyright hannah schmitt carnegie mellon university 2012

//a lot of assistance of the class notes: array #3 were used to create original graph
//manipulation of graph was created completely individually

//this graph shows the average monthly rainfall in mm in Offa, Nigeria. This is of interest to me
//because I am currently working on helping a CMU alumni design an elementary school there

//the points of each rainfall value falls into place. the intention was to have the background
//look like falling rain. 

int [] rainAvg= {
  10, 21, 71, 121, 154, 182, 186, 151, 233, 158, 28, 11
};
float leftEdge, rightEdge, topEdge, bottomEdge;
color c1;
int minValue, maxValue;
final int first_month = 1;
final int last_month = 12;


void setup ()
{
  size (400, 400);

  leftEdge = 15;
  rightEdge = width- 15;
  strokeWeight (5);
  minValue = min(rainAvg);
  maxValue = max(rainAvg);
  topEdge = 25;
  bottomEdge = height-25;
background (181, 188, 222);
c1= color(28, 51, 62, 10);
}

void draw ()
{
//  background (181, 188, 222, 20);
  plot ();
}

void plot ()
{

  
  float x1, y1;
  x1 = 0;
  y1 = 0;
  
  beginShape();
  vertex(0,height+10);
  for (int i = 0; i< rainAvg.length; i++)
  {
    float x =
    map (i, 0, rainAvg.length, leftEdge, rightEdge);
    float y= map(rainAvg[i], maxValue, minValue, topEdge, bottomEdge);
    stroke (26, 88, 134, 20); 
    strokeWeight (3);
    point (x,  frameCount%y);
    
    fill(144, 171, 183,5);
    vertex(x, y);
    
    pushStyle();
    fill(c1);
    int year = (i + first_month);
    text(year, x, y-15);
    popStyle();
   
    x1= x;
    y1= y;
    
  }
  noStroke();
  vertex(375,height+10);
  endShape(CLOSE);
}


