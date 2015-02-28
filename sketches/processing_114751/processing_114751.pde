
  float x = 0;
  float speed = 1;
  float sinusKurve = 0;
  float xBen = 0;
  float yBen = 0;
  float benA = 0;
  float benB = 0;
  float benC = 0;
  float yArm = 0;
  
  float A = -30;
  float a = 50;
  float b = 75;
  float c = 150;
  float d = 200;
  float e = 125;
  
void setup ()
{
  size(500,500);
}


void draw ()
{
  background(255,255,255);
  
  x = x+0.05;
  
  A = A+speed;
  
  sinusKurve = 25 * cos(x);
  
  xBen = sinusKurve + A;
  
  yBen = sqrt(d*d-sinusKurve*sinusKurve);
  
  //hoved
  
  ellipse(A,a,50,50);
  
  //krop
  line(A,b,A,c);

  //Ben1
  line(A,c,xBen,yBen);
  

  //Ben2
  benA = 25 * cos(x-PI);
  
  benB = benA + A;
  
  benC = sqrt(d*d-benA*benA);
  
  line(A,c,benB,benC);
  
  
  //Arm1
  line(A,c-40,xBen,yBen-110);
  
  
  //Arm2
  line(A,c-40,benB,benC-110);
  
}


