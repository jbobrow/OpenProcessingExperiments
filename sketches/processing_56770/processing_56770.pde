

void setup()

{ 
  size(600,600);
  smooth();
}


void draw()
{ 
 background(255);
 ellipse(width/2, height/2);
 
 

 }
 
 
 
 void ellipse(float a, float b)
 {
   
 float r=0.0;
 
//in an x–y cartesian coordinate system, the circle with 
//centre coordinates (a, b) and radius r is the set of all points (x, y) 
 
 for(float t=0.0; t<TWO_PI;t+=0.1)
 { 
   
 r+=2.0; 
 
 float x=a+r*cos(t);
 float y=b+r*sin(t);
 
 noStroke();
 fill(190);
 
 ellipse(x,y,10,10);
 
   
   
  }   
 }

