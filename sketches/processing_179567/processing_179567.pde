

/**  Draws a circle given three points
   
   Intructions:
     Mouse click to add a point
     C key to clean all points
     D key to show / hide the text */  
 

int nPoints = 3; //number of points
int j = 0; //count the points
int k = 0; //count the midpoints
color c1, c2;  //colors of the points
float teta = 0;  //angle
PVector[] mp = new PVector[2];  //midpoints
PVector O; //origin of the circle
float R; //radius of the circle
points[] T; //array of points
PFont font; //font
boolean displayText = true; //display text by default
float Det;

void setup()
{
  size(400,400);
  smooth();
  T = new points[nPoints]; //create the array of points
  font = createFont("Arial", 16, true);
}


void draw()
{
  //format background
  background(255);
  bg();
  
  //show axes
  axes();
  
  
  if (j == nPoints)  //all points
  {    
    Det = (T[0].p.x * T[1].p.y)  + (T[1].p.x * T[2].p.y) + (T[2].p.x * T[0].p.y);
    Det -= (T[0].p.y * T[1].p.x)  + (T[1].p.y * T[2].p.x) + (T[2].p.y * T[0].p.x);
    
    if (abs(Det) < 50.)  //collinear
    {      
    }
    else  //triangle
    {
      displayCircle(); //display circle
      displayCenter(); //display center and radius
    }
  }
  
  //show points
  if (j > 0)
  {
    for (int i = 0; i < j; i++)
    {
      T[i].rollover(mouseX,mouseY);
      T[i].drag(mouseX,mouseY);
      T[i].display();
      if (displayText) {  T[i].displayText();  }     
    }
  } 
}


void mousePressed()
{
  if (j < nPoints)
  {
    //create the 3 points
    coloring();
    T[j] = new points(mouseX,mouseY,c1,c2);
    j += 1;
  }
  else
  {
    for (int i = 0; i < nPoints; i++)
    {
      //drag the points
      T[i].pressed(mouseX,mouseY);
    }
  }
}


void mouseReleased()
{
  for (int i = 0; i < j; i++)
  {
    //stop dragging
    T[i].stopdrag();
  }  
}

void keyPressed()
{
  if (key == 'c' || key == 'C') //clear all the points
  {
    j = 0;
  }
  
  if (key == 'd' || key == 'D')
  {
    displayText = !displayText;
  }
}
void displayCenter()
{
  PVector rPosition;
  
  fill(255, 160, 0);
  stroke(255, 160, 0); 
  ellipse(O.x, O.y, 5, 5); //central point
  arrow(O,T[2].p); // radius arrow
  
  fill(200,100,0);
  textFont(font,12);
  textAlign(LEFT, CENTER);
  
  rPosition = midpoint(O,T[2].p); //calculate the midpoint of the radius arrow
  
  if (displayText) //display the center coordinates and the radius size
  {
    text("C = (" + int(O.x - 20) + ", " + int(height - 20 - O.y) + ")", (O.x + 5), (O.y - 5));
    text("R = " + int(R), rPosition.x + 10, rPosition.y);
  }
}


void center(PVector[] P)
{
  float ox, oy, a;
  PVector[] eq = new PVector[2];
  
  for (int i = 0; i < 2; i++)
  { 
    a = tan(P[i].z); 
    eq[i] = new PVector (a, -1, -1*(P[i].y - P[i].x*a)); //equation of the first bissector (ax - y =  -b)       
  }
  
  //calculate x and y coordinates of the center of the circle
  ox = (eq[1].y * eq[0].z - eq[0].y * eq[1].z) / (eq[0].x * eq[1].y - eq[1].x * eq[0].y);
  oy =  (eq[0].x * eq[1].z - eq[1].x * eq[0].z) / (eq[0].x * eq[1].y - eq[1].x * eq[0].y);
  O = new PVector(ox,oy); 
}



void displayCircle()
{
  noFill();
  stroke(200);
  
  for (k = 0; k < 2; k++)
  {
    mp[k] = midpoint(T[k].p,T[k+1].p); //find 2 midpoints
  }
  center(mp);   //find the center of the circle
  R = sqrt(sq(O.x-T[2].p.x)+sq(O.y - T[2].p.y)); //calculate the radius

  ellipse(O.x, O.y, 2*R, 2*R); //draw circle
}


PVector midpoint(PVector A, PVector B)
{
  PVector C;
  float r, teta;
  PVector p;
   
  //stroke(128);
  //strokeWeight(1);
  //line(A.x,A.y,B.x,B.y);  
  
  PVector distance = tetaTest(A, B); 
  r = distance.x; //distance AB
  teta = distance.y; //inclination of AB
  
  r /= 2; //half distance for the midpoint
  C = new PVector(A.x + r*cos(teta), A.y + r*sin(teta)); //midpoint
  teta -= HALF_PI;  //inclination of the bissecteur
  //line(C.x, C.y, C.x + 40*cos(teta), C.y + 40*sin(teta));
  
  p = new PVector(C.x, C.y, teta);  //export midpont position and bissecteur angle to a global PVector
  return p;
}


PVector tetaTest(PVector A, PVector B)
{
  float cteta, steta;
  float teta = 0;
  float r;
  PVector v;
  
  r = sqrt(sq(B.y-A.y)+sq(B.x-A.x));  //distance AB
  
  cteta = (B.x - A.x)/r;
  steta = (B.y - A.y)/r;
  
  if (cteta >= 0 && steta >= 0) {teta = acos(abs(cteta));} //quadrant 1
  if (cteta < 0 && steta > 0) {teta = PI - acos(abs(cteta));} //quadrant 2
  if (cteta <= 0 && steta <= 0) {teta = acos(abs(cteta)) + PI;} //quadrant 3
  if (cteta > 0 && steta < 0) {teta = acos(abs(cteta)) * (-1);} //quadrant 4
  
  v = new PVector(r,teta);
  return v;
}


void bg()
{
  int gridSize = 20; //size of the grid
  for (int i = 0; i < width; i += gridSize)
  {
    stroke(175,235,255);
    strokeWeight(1);
    line(i,0,i,height);
  }
  for (int i = 0; i < height; i += 20)
  {
    line(0,i,width,i);
  }
}


void axes()
{
  PVector origin = new PVector(20, height - 20);
  PVector axisX = new PVector(origin.x + 40, origin.y);
  PVector axisY = new PVector(origin.x, origin.y - 40);
 
  strokeWeight(2);
  stroke(0, 200, 255);
  
  arrow(origin,axisX);
  arrow(origin,axisY);
  
  textFont(font);
  textAlign(CENTER, CENTER);
  fill(0,200,255);
  text("X", origin.x + 60, origin.y);
  text("Y", origin.x, origin.y - 60);
}


void arrow(PVector a, PVector b)
{
  line(a.x, a.y, b.x, b.y);
  PVector angle = tetaTest(a,b);
  line (int(b.x), int(b.y), int(b.x + 10*cos(angle.y + radians(150))), int(b.y + 10*sin(angle.y + radians(150))));
  line (int(b.x), int(b.y), int(b.x + 10*cos(angle.y + radians(210))), int(b.y + 10*sin(angle.y + radians(210))));  
}


void coloring()
{
  if (j == 0) //first dot is red
  {
    c1 = color(230,0,0);
    c2 = color(230,128,128);
  }
  else if (j == 1) //second dot is green
  {
    c1 = color(0,200,0);
    c2 = color(128,200,128);
  }
  else //third dot is blue
  {
    c1 = color(0,30,230);
    c2 = color(128,158,230);
  } 
}
class points
{
  int diam; //size of the dot
  PVector p; //position/center of the dot
  float dx, dy;  //displacments between mouse position and dot position 
  boolean dragging, roll;
  color c1, c2; //colors of the dot
  
  points(float x_, float y_, color c1_, color c2_)
  {
    dragging = false;
    roll = false;
    diam = 10;
    p = new PVector(x_, y_);
    c1 = c1_;
    c2 = c2_;
    dx = 0;
    dy = 0;
  }
  
  void display()
  {
    strokeWeight(2);
    stroke(c1);
    if (dragging) {  fill(c1);  }  //bright color when dragging  
    else if (roll) {  fill(c2);  }  //light color when mouse is over the pont   
    else {  noFill();  }  //no fill otherwise   
    ellipse(p.x, p.y, diam, diam); //draw the point
    point(p.x,p.y);
  }
  
  void displayText()  //display the point coordinates
  { 
    textFont(font, 12);
    textAlign(LEFT, BOTTOM);
    fill(c1);
    text("(" + int(p.x - 20)  + ", " + int(height - 20 - p.y) + ")", p.x + 5, p.y - 5);
  }
  
  void rollover(float mx,float my) //test if the mouse is over the dot
  {
    if (dist(p.x, p.y, mx, my) < diam/2) {  roll = true;  }
    else {  roll = false;  }
  }
  
  void pressed(float mx, float my) //test if the mouse is over the dot and pressed
  {
    if (dist(p.x, p.y, mx, my) < diam/2)
    {
      dragging = true;
      //track the displacement
      dx = p.x - mx;
      dy = p.y - my;
    }
  }
  
  void drag(float mx, float my) //drag the point
  {
    if (dragging)
    {
      p.x = mx + dx;
      p.y = my + dy;
    }
  }
  
  void stopdrag() //stop dragging
  {
    dragging = false;
  }
  
}


