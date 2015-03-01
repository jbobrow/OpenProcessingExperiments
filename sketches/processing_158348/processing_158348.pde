
// parameters
// noise space start point
PVector p;
// current position
float x,y;
// current angle
float ang;
// angle step
float sang;
// number of points in the filament
int iter;
// scale of noise space
float sx,sy,sz;
// x,y change constant
float cx,cy;
// freq of z wobble amplitude
float fr;
// rotational symmetry
float symm;

void setup() {
  size(600,600);
  smooth();
  noStroke();
  frameRate(100);
  fill(35, 40);
  initMe();
}

// randomize parameters
void initMe() {
  background(240);
  noiseDetail( (int)random(1,5),random(0.3,0.7));
  p = new PVector(random(-1,1),random(-1,1), random(0,1));
  x=0;
  y=0;
  ang=0;
  iter = (int)random(300,400);
  sx = random(10,80);
  sy = sx+random(-5,5);
  cx = random(-0.1,1.2);
  cy = random(-0.1,1.2);
  sang = random(0.001,0.005);
  sz = random(1)<0.5?random(0.001,0.01):random(0.9,10);
  fr = random(0.5,4);
  symm = random(1)<0.5?-1:random(2,30);
}

// in Java version it produces symmetrical rosettes... Probably noise functions differ.
void preset1() {
  background(240);
  noiseDetail(3,0.5);
  p = new PVector(random(-1,1),random(-1,1), 0);
  cx=0;
  cy=0;
  x=0;
  y=0;
  ang=0;
  iter = 300;
  sx=30;
  sy=30;
  fr=1;
  sz=10;
  sang=0.001;
  symm = 10;
}

void draw() {
  // make full circle
  if(ang<TWO_PI) {
  
    // set starting position and rotate
    translate(width/2,height/2);
    rotate(ang);
  
    // make filament
    for(int i = iter;i>0;i--) {
      float z = symm<0?p.z:p.z%symm;
      float n = 2*TWO_PI*noise(p.x+x/sx,p.y+y/sy,z) ;
      ellipse(x,y,0.55,0.55);
      // change drawing position
      x+=sin(n)+cx;
      y+=sin(n)+cy;
    }
  
    // change starting point in the noise space by moving throught z axis 
    PVector step;
    if(sz>0.9)
      // option 1: wobble
      step = new PVector(0,0,sin(fr*ang)/sz);
     else 
      // option 2: constant movment
      step = new PVector(0,0,sz);
    p.add(step);
    // reset drawing coords
    x=y=0;
    // change angle
    ang+=sang;
  }
}

void keyPressed() {
  preset1();
}

void mouseClicked() {
    initMe();
}
