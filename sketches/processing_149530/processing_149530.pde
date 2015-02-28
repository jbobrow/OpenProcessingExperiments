


int numBalls = 200; 

float x;
float y;


int k = 1;
int j = 1;
float t;
float p;

float R=125; 


float centerR=125; 


float a=PI/2; 


float a1=PI; 


float a2=3*PI/2; 


float pathR=125; 


float pathG=125; 


float G=125; 


float centerG=125; 


float pathB=125; 


float B=125; 


float centerB=125; 
//speed variable
float dx;
float dy;

color orange = color(255, 165, 0);
color white = color(255, 255, 255);


void setup() {
  size(1000, 1000);
  smooth();




  
x = 500;
y = 500;
dx = 1; 
dy = -2; 
}

void draw() {
  background(white);
  noStroke();
  beginShape(); 
  k = k+30;
fill (k,k,k,k);
if (k > 250) {
  k = 1;
}
ellipse(x-100, y-100, 500, 400);
ellipse (x-250, y-300, 100, 100);
ellipse (x+50, y-300, 100, 100);
fill (255);
ellipse (x-100, y-100, 150, 130);
fill (pathR,pathG,pathB);
pathR=centerR+R*sin(a); 
a=a+.03; 
pathG=centerG+G*sin(a1); 
a1=a1+.03; 
pathB=centerB+B*sin(a2); 
a2=a2+.03; 
ellipse (x-100, y-100, 50, 50);
colorMode(HSB);
k = k+30;
fill (k,k,k,k);
if (k > 250) {
  k = 1;
}
ellipse (x-200, y+100, 50, 100);
ellipse (x, y+100, 50, 100); 

endShape();
 x += dx;
  y += dy;

  // hit the top edge?
  if (y <= 0) {
    dy = -dy;
  }

  // hit the bottom edge?
  if (y >= 499) {
    dy = -dy;
  }

  // hit the left edge?
  if (x <= 0) {
    dx = -dx;
  }

  // hit the right edge?
  if (x >= 499) {
    dx = -dx;
  }
}


 //draw the group


 

  //draw the monster


