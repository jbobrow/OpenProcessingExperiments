
//Magma Jumping Peakv2
// original sketch by Kim Asendorf


//DIMENSIONS X*Y
int DIMX = 12;
int DIMY = 12;

//GRIDSIZE
int gridSize = 80;
//AMPLIFIER
int amp = 300;

//POINTS IN A CLASS
Point[] p;
int points;

void setup() {
  size(920,500);
  smooth();
  background(255);
  noFill();

  computePoints();
}


//COMPUTE THE COORDINATES AND CREATE INSTANCES
void computePoints() {
  points = DIMX*DIMY;
  p = new Point[points];

  for(int i=0; i<points; i++) {
    int x = i%DIMX * gridSize - (DIMX-1) * gridSize/2;
    int y = i/DIMX * gridSize - (DIMY-1) * gridSize/2;

    p[i] = new Point(x, y);
  }
}


void draw() {
  if (frameCount > 3000) noLoop();
  translate(width/2,height/2);
  rotate(PI*1.25);
 scale(1.0/(frameCount/400.0));
  //background(255);
  
  if(random(1)<0.5) p[int(random(points-1))].makePeak();
  for(int i=0; i<points; i++) {
    p[i].update();
  }
  
  //X LINES
  for(int i=0; i<DIMY; i++) {
    strokeWeight(1);
    //stroke(random(0,255));
    stroke(abs(155*sin(frameCount/100.0)));
    beginShape();
    for(int j=0; j<DIMX; j++) {
      vertex(p[j+i*DIMX].peakX, p[j+i*DIMX].peakY);      
    }
    endShape();
  }

  //Y LINES
  for(int i=0; i<DIMX; i++) {
    strokeWeight(1);
    beginShape();
    for(int j=0; j<DIMY; j++) {
      vertex(p[i+j*DIMX].peakX, p[i+j*DIMX].peakY);      
    }
    endShape();
  }
}


//THE POINT CLASS
class Point {
  int x, y;
  float peakX, peakY;
  int peak;
  int frames, index;
  float app;

  Point(int _x, int _y) {
    x = _x;
    y = _y;
    peakX = x;
    peakY = y;
    index = 0;
    frames = -1;
  }

  void makePeak() {
    frames = int(random(20,250));
    peak = int(random(5,50));
    index = 0;
  }

  void update() {
    if(index<=frames) {
      float deg = PI*index/frames;
      app = sin(deg)*peak;
      peakX = x + app;
      peakY = y + app;

      index++;
    }
    
    //POINT
    strokeWeight(3);
    point(peakX, peakY);
  }}
  //===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
