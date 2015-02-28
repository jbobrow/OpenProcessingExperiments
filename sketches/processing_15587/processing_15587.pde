
float  d, mm, wCen, hCen, Cir, CirR1, CirR2, CirR3;
PImage a;
PFont f;

void setup() {
  smooth();
  size(360, 600);
  stroke(255);
  a = loadImage("clock.jpg");
}


void draw()
{
  wCen = 147.668;
  hCen = 430;
  Cir = 193.333;
  CirR1 = Cir/3;
  CirR2 = Cir/2.5;
  CirR3 = Cir/4;

  background(255);
  image(a,0,0,360,600);
  ellipse(147.668, 430, 193.333, 193.333);

  // month, day
  f = loadFont ("AgencyFB-Bold-25.vlw");
  fill(0);
  textFont(f);  

  int d = day();  
  int mm = month();  
  String f =  nf(mm,2) + "." + nf(d,2);  
  text(f, 230, 527);  


  // time
  fill(255);  
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour()% 12, 0, 12,0, TWO_PI) - HALF_PI;

  stroke(0); 
  ellipse(147.668, 430, 10, 10);
  strokeWeight(2);
  line(wCen, hCen, cos(s) * CirR1 + wCen, sin(s) * CirR1 + hCen);
  strokeWeight(3);
  line(wCen, hCen, cos(m) * CirR2 + wCen, sin(m) * CirR1 + hCen);
  strokeWeight(5);
  line(wCen, hCen, cos(h) * CirR3 + wCen, sin(h) * CirR1 + hCen);
}


