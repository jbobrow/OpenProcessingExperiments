
// @ luiz ernesto merkle
// Creative Commons - CC a SA 3.0 
// Algures 2012

PFont algures; 

void setup ()
{
  background (255);
  noFill(); 
  strokeWeight(3);
  colorMode(HSB, 360, 100, 100);
  smooth();
  size(700, 700);
  algures = loadFont("DejaVuSansCondensed-48.vlw"); 
  textFont(algures,40); 
  textAlign(CENTER);
}
float rot=PI/360;

void draw() {

  background (360);
  fill(200);
  text("ALGURES 7", 350,350);  
  noFill();
  pushMatrix();
  translate(350, 350);
  rotate(PI*3.25/2+rot);// curvas
  int rmin = 135;
  int rmax = 150; 
  float x0, y0, x1, y1, x2, y2, x3, y3, x4, y4;
  x0 = rmin*cos(PI/12.5);
  y0 = rmin*sin(PI/12.5); 
  x1 = rmax*cos(PI/25);
  y1 = rmax*sin(PI/25);
  x2 = rmin;
  y2 = 0; 
  x3 = x1;
  y3 = -y1; 
  x4 = x0;
  y4 = -y0;
  for (int i=0; i<25; i++)
  { 
    rotate(-PI/180*360/25);
    stroke(i*360/25, 100, 100);
    curve(x0, y0, x1, y1, x2, y2, x3, y3); 
    stroke((i+0.5)*360/25, 100, 100);
    curve(x1, y1, x2, y2, x3, y3, x4, y4);
  } 

  // retas
  for (int i=0; i<65; i++)
  { 
    stroke(i*360/65, 100, 100);
    rotate(-PI/180*360/65);
    line(170, -15, 200, 15);
  } 

  //cubos
  float b = 220;
  float c = 228;
  float A= PI/41;
  float a = sqrt(c*c+b*b-2*b*c*cos(A));
  float C = acos(a*a+b*b-c*c)/2/a/b;
  float B = PI-A-C; 
  float d = c+a; 
  float cA = cos(A);
  float sA = sin(A); 
 
  for (int i=0; i<41; i++)
  { 
    stroke(i*360/41, 100, 100);
    rotate(-PI/180*360/41);
    line(b, 0, b+a, 0);
    line(b, 0, c*cA, c*sA); 
    line(c*cA, c*sA, (c+a)*cA, (c+a)*sA); 
    line(b+a, 0, (c+a)*cA, (c+a)*sA);
    line((c+a)*cA, (c+a)*sA, (c+a)*cA*2-b-a,0) ;
    line((c+a)*cA, -(c+a)*sA, (c+a)*cA*2-b-a,0) ;
    line(b, 0, c*cos(A), -c*sin(A));
    line(b+a, 0, (c+a)*cA, -(c+a)*sA);
    line((c+a)*cA, -(c+a)*sA, (c+a)*cA*2-b-a,0) ;  
  } 

  // circulos
  for (int i=0; i<102; i++)
  { 
    stroke(i*360/102, 100, 100);
    rotate(-PI/180*360/102);
    ellipse(320, 0, 39, 39);
  } 

  // circunferÃªncia
  for (int i=0; i<360; i++)
  { 
    stroke(i, 100, 100, 127);
    rotate(-PI/180);
    line(275, -3, 275, 3);
  } 
  popMatrix();
rot = rot+PI/360;
}

