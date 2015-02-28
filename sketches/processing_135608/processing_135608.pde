
//Lissajous Curve
//Creative Computing example
//Ben Norskov April 2, 2013
float t = 0;
float f1 = 1.01, a1 =  50, d1 = 0.008, ph1 = 2;
float f2 = 2.005,  a2 = 100, d2 = 0.005;
float f3 = 2,    a3 = 100, d3 = 0.006;

int count =0;

void setup() {
  size(500, 500);
  background(255, 0, 0);
  frameRate(500);
}

float x0,y0,x1,y1;


void draw() {
  
  for (i=0;i<10;i++) { 
      x0 = x1; y0 = y1;
      x1 = width*0.5 + cos(f1*t + ph1) * a1 * exp(-t*d1) + cos(f2*t) * a2 * exp(-t*d2);
      y1 = height*0.5 + sin(f1*t + ph1) * a1 * exp(-t*d1) + cos(f3*t) * a3 * exp(-t*d3);
     
      t += .01;
      count += 1;
      if (count>1) {
        //line(x0,y0,x1,y1);
        ellipse(x1, y1, 10, 10);
      }
  }
  
}
