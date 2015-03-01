
PVector[][] t = new PVector[4][3];
float[][] matrix = {{1, 0, 0, 0},
                    {1, 1, 1, 0},
                    {0, 1, 1, 1},
                    {0, 0, 0, 1}};

float iterations;

int cStroke = 255,
    cFill = 0;


/*---------------------*/


void setup()
{
  size(600, 600);
  for (int i = 0; i < 4; i++)
  {   
    t[i][0] = new PVector(matrix[i][0]*width, matrix[i][1]*height); 
    t[i][1] = new PVector(matrix[i][2]*width, matrix[i][3]*height);
    t[i][2] = new PVector(width/2, height/2);
  }
}


/*---------------------*/



void draw()
{    
  iterations = map(mouseX, 0, width, 0, 9);    
  for (int i = 0; i < t.length; i++)  {  triangles(t[i][0], t[i][1], t[i][2], 1);  }
}


/*---------------------*/


void mousePressed()
{
  cStroke = 255 - cStroke;
  cFill = 255 - cFill;
}


/*---------------------*/


void triangles(PVector p1, PVector p2, PVector p3, int k)
{
  
  
  PVector[] p = {p1, p2, p3};
  PVector c = baricenter(p);   //find the center of the circle
  
  if (k < iterations)
  {
    triangles(p1, p2, c, k + 1);
    triangles(p2, p3, c, k + 1);
    triangles(p3, p1, c, k + 1);
  }
  else
  {
    strokeWeight(0.2);
    stroke(cStroke);
    fill(cFill); 
    triangle(p1.x, p1.y,    p2.x, p2.y,    p3.x, p3.y);
  }
}


/*---------------------*/


PVector baricenter(PVector[] p)
{
  //calculate the midpoint of two edges of the triangle
  PVector[] mp = new PVector[2];  //midpoint
  PVector[] op = new PVector[2];  //opposite point
  
  mp[0] = midpoint(p[0], p[1]);    op[0] = p[2];
  mp[1] = midpoint(p[1], p[2]);    op[1] = p[0];
  
  //calculate the equation of the lines from the midpoint to the opposite vertex
  PVector[] eq = new PVector[2];  
  for (int i = 0; i < 2; i++)  {  eq[i] = lineEquation(mp[i], op[i]);  }
  
  
  //calculate x and y coordinates of the baricenter of the circle (the intersection of the two lines)
  PVector o = new PVector(0,0);
  o.x = (eq[1].y * eq[0].z - eq[0].y * eq[1].z) / (eq[0].x * eq[1].y - eq[1].x * eq[0].y);
  o.y =  (eq[0].x * eq[1].z - eq[1].x * eq[0].z) / (eq[0].x * eq[1].y - eq[1].x * eq[0].y);
  
  return o;
}


/*---------------------*/


PVector midpoint(PVector A, PVector B)
{
  PVector M; 
   
  float r = dist(A.x, A.y, B.x, B.y);  //distance AB
  float theta = atan2(B.y - A.y, B.x - A.x);  //inclination of AB
 
  r /= 2; //half distance for the midpoint
  M = new PVector(A.x + r*cos(theta), A.y + r*sin(theta)); //midpoint
    
  return M;
}


/*---------------------*/


PVector lineEquation(PVector p1, PVector p2)
{
  float A = p1.y - p2.y;
  float B = p2.x - p1.x;
  float C = A*p1.x + B*p1.y;
  PVector eq = new PVector (A, B, C); //equation of the line (Ax + By = C) 
  return eq;
}


