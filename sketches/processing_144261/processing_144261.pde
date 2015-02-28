
//Kevin Gutowski
//Sunday April 13
//http://ocf.berkeley.edu/~keving/
//
//When I messed up drawing triangles and decided to try additive color?


void setup() {
  size(800,800);
  background(255);
  smooth();
  frameRate(20);
}


int t = 0;

void draw() {
  background(255);
  t++;
  translate(height/2,width/2);
  rotate(PI*t/200);

  
  float radius = 12;
  float r3 = 245;
  float n3 = 200;
  noStroke();
  fill(0,40);
  
  for (int i=0; i<n3; i++) {
   colorMode(RGB);
   if (i>=0 && i<(n3/3)) {
     fill(255,0,0,10);
   } else if (i>=(n3/3) && i<(2*n3/3)) {
     fill(0,0,255,10);
   } else if (i>=(2*n3/3) && i<n3) {
     fill(0,255,0,10);
   }
   float middlex = r3*cos(2*PI*i/n3+t*PI/200)*tan(2*PI*i/n3+t*PI/300);
   float middley = r3*sin(2*PI*i/n3+t*PI/100)*tan(2*PI*i/n3+t*PI/250);
   triangle(radius*cos(PI/6)-middlex,radius*sin(PI/6)+middley,radius*cos(PI/6)+middlex,radius*sin(PI/6)+middley, 0,-radius);
  }
    
  
  
}
