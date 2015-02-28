
int numbranches;
int numpts;
float ang, rad;
branch[] br;

void setup() {
size(920,500);
  background(255);
  smooth();  
  numbranches = (int)random(90,150);

  // make each branch
  br = new branch[numbranches];  
  for (int i=0; i<numbranches; i++) {
    int numpts = (int)random(2200,3500);
    float x0 = width/2;
    float y0 = height/2;
    float ang = lerp(0,2*PI,(float)i/numbranches);
    float rad = random(height,height);
    float xm = random(200,450);
    float ym = random(200,450);
    float sw0 = random(2,5);
    float a1 = random(60,115);
    float a2 = random(40);
    br[i] = new branch(numpts, ang, rad, x0, y0, xm, ym, sw0, a1, a2);
  }
}

void draw() {
  for (int i=0; i<numbranches; i++) {
    br[i].drawNext();
  }
}
    
class branch {
  int numpts, idx;
  float ang, rad, x, y, x0, y0, x1, y1;
  float xmargin, ymargin, xm, ym, nx, ny, nxstep, nystep;
  float a1, a2, sw0, sw, alph;
  branch(int _numpts, float _ang, float _rad, float _x0, float _y0, float _xm, float _ym, float _sw0, float _a1, float _a2) {
    numpts = _numpts;  ang = _ang;  rad = _rad;  x0 = _x0;  y0 = _y0;  xmargin = _xm;  ymargin = _ym; sw0 = _sw0;  a1 = _a1;  a2 = _a2;
    x1 = x0;  y1 = y0;
    nx = random(10);  ny = random(10);
    nxstep = 0.003;  nystep = 0.003;
    idx = 0;
  }
  
  void drawNext() {
    if (idx<numpts) {
      xm = lerp(0,xmargin,(float)idx/numpts);
      ym = lerp(0,ymargin,(float)idx/numpts);
      
      float x2 = x0 + (float)idx*rad*cos(ang)/numpts;
      x2 += xm*(noise(nx)-0.5);
      float y2 = y0 + (float)idx*rad*sin(ang)/numpts;
      y2 += ym*(noise(ny)-0.5);
      
      alph = lerp(a1,a2,(float)idx/numpts);
      sw = lerp(sw0,0,(float)idx/numpts);
      
      stroke(0,0,255,alph);
      strokeWeight(sw);
      line(x1,y1,x2,y2);
      
      x1 = x2;  y1 = y2;
      nx += nxstep;
      ny += nystep;
      idx++; 
    }
  }
}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
