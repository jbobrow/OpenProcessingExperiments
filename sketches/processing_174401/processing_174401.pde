
float x0,y0,x1,y1;
float xmin,xmid,xmax,ymin,ymid,ymax;
float q, r;
float nbePoints;
float a, b;

void setup() {
  size(500,500);
  smooth();
  frameRate(300);
  background(#E4E4E4);
  
  nbePoints=20000000;
  
  a = -3.5;
  b = -2;
  
  q = sqrt((x1*x1)+(y1*y1));
  
  r = int(random(4));

  x0 = 0.1;
  y0 = 0;
   
  xmin = ymin = -2;
  xmax = ymax = 2;
  
  xmid=(xmin+xmax)/2;
  ymid=(ymin+ymax)/2;
}
  
  void draw() {
    
    for (int i=0; i<nbePoints; i++) {
      x1 =  (x0*sin(r*r)-y0*cos(r*r));
      y1 = sin(a * x0) - cos(b * y0);
    }
    
    println(sin(a * x0) - cos(b * y0));
   
   x0 = x1;
  y0 = y1;
 
 translate(250,250);
 noStroke();
 fill(30,30,30,10);

for (int i = 0; i <10000; i++) {
 
 ellipse(x1*100,y1*100,1,1);
}
  }
  


