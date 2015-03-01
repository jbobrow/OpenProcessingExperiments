
int n;
float period = 1;
float r, nt;
float sp[], rad[], ang[];
Ondulator o1, o2;
static int FRAMERATE = 25;
float t = 0, dt = (float)1/FRAMERATE;;

void setup() 
{
  size(500, 500);
  frameRate(FRAMERATE);
  
  // ondulator 1
  n = 1500;
  r = 0.46*width; // max radius
  nt = 15; // number of turns
  sp = spa(n,190);
  rad = coa(sp,r);
  ang = coa(sp,nt*(n-1)/n*360);
  o1 = new Ondulator(n); 
  o1.x = width/2; 
  o1.y = width/2; 
  o1.rz = 93; 
  o1.s = 0.95; 
  o1.setPos("x",ptxa(rad,ang));
  o1.setPos("y",ptya(rad,ang));
  o1.setPos("s",ca(n,0.75));
  o1.setPos("cg",ca(n,0));
  o1.setOnd("s",ca(n,0.75),ca(n,period),ia(n,0,-period*760),"sin");
  
  // ondulator 2
  n = 196;
  r = 0.154*width; 
  nt = 5; 
  sp = spa(n,0);
  rad = coa(sp,r);
  ang = coa(sp,nt*(n-1)/n*360);
  o2 = new Ondulator(n); 
  o2.x = width/2; 
  o2.y = width/2; 
  o2.rz = 101; 
  o2.s = 0.95; 
  o2.setPos("x",ptxa(rad,ang));
  o2.setPos("y",ptya(rad,ang));
  o2.setPos("rz",ang);
  o2.setPos("s",ca(n,0.75));
  o2.setPos("cg",ca(n,0));
  o2.setOnd("sx",ca(n,0.75),ca(n,period/4),ia(n,0,-period/4*48),"sin");
}

void draw() { 
  background(250);
  smooth();
  noStroke();
  o1.draw();
  o2.draw(); 
  t+=dt;
} 

class Oscillator {
  float offset;
  float amplitude;
  float period;
  float timeShift;
  String waveShape;
  float value;
  
  Oscillator(float amplitude, float period, float timeShift, String waveShape) {
    this.amplitude = amplitude; 
    this.period = period; 
    this.timeShift = timeShift; 
    this.waveShape = waveShape; 
    this.value = getValue();
  }
  
  float getValue() {
    if (this.waveShape.equals("sin")) {
      value = amplitude*sin(TWO_PI/period*(t-timeShift));
    } else if (this.waveShape.equals("psin")) { // positive sine
      value = amplitude*pow(sin(TWO_PI/period*(t-timeShift)/2),2);
    } else if (this.waveShape.equals("id")) { // for spinning
      value = amplitude*((t-timeShift)%TWO_PI/TWO_PI/period);
    }
    return value;
  }
}
 
class Cell { 
  float x, y, s, sx, sy, rz, cg;
  float dx, dy, ds, dsx, dsy, drz;
  Oscillator xOsc, yOsc, sOsc, sxOsc, syOsc, rzOsc;
  Cell () {  
   x = 0;  y = 0; s = 1; sx = 1; sy = 1; rz = 0; cg = 0;
   dx = 0;  dy = 0; ds = 0; dsx = 0; dsy = 0; drz = 0;
  } 
  void draw() {
    if (xOsc != null) {dx = xOsc.getValue();}
    if (yOsc != null) {dy = yOsc.getValue();}
    if (sOsc != null) {ds = sOsc.getValue();}
    if (sxOsc != null) {dsx = sxOsc.getValue();}
    if (syOsc != null) {dsy = syOsc.getValue();}
    if (rzOsc != null) {drz = rzOsc.getValue();}
    smooth();
    fill(this.cg);
    pushMatrix(); 
    translate(x+dx,y+dy);
    rotate((rz+drz)*PI/180);
    scale(s+ds);
    ellipse(0, 0, 10*(sx+dsx), 10*(sy+dsy)); 
    popMatrix();
  } 
  void setOsc(String attr, float amp, float period, float timeShift, String waveShape) {
    if (attr.equals("x")) {
      this.xOsc = new Oscillator(amp, period, timeShift, waveShape);
    } else if (attr.equals("y")) {
      this.yOsc = new Oscillator(amp, period, timeShift, waveShape);
    } else if (attr.equals("s")) {
      this.sOsc = new Oscillator(amp, period, timeShift, waveShape);
    } else if (attr.equals("sx")) {
      this.sxOsc = new Oscillator(amp, period, timeShift, waveShape);
    } else if (attr.equals("sy")) {
      this.syOsc = new Oscillator(amp, period, timeShift, waveShape);
    } else if (attr.equals("rz")) {
      this.rzOsc = new Oscillator(amp, period, timeShift, waveShape);
    } else {
      print("bad attribute");    
    }
  }
} 

class Ondulator { 
  int n;
  float x, y, s, rz;
  Cell cells[];
  Ondulator (int n) { 
   this.n = n; 
   this.x = 0; 
   this.y = 0; 
   this.s = 1; 
   this.rz = 0; 
   this.cells = new Cell[n];
   for (int i=0; i<this.n; i++) {
     this.cells[i] = new Cell();
   }
  } 
  void draw() {
    pushMatrix(); 
    translate(this.x,this.y);
    rotate((this.rz)*PI/180);
    scale(this.s);
    
    for (int i=0; i<this.n; i++) {
      cells[i].draw();
    }
    popMatrix();
  } 
  void setPos(String attr, float val[]) {
    if (attr.equals("x")) {
      for (int i=0; i<n; i++) {
        this.cells[i].x = val[i];
      }
    } else if (attr.equals("y")) {
      for (int i=0; i<n; i++) {
        this.cells[i].y = val[i];
      }
    } else if (attr.equals("s")) {
      for (int i=0; i<n; i++) {
        this.cells[i].s = val[i];
      }
    } else if (attr.equals("sx")) {
      for (int i=0; i<n; i++) {
        this.cells[i].sx = val[i];
      }
    } else if (attr.equals("sy")) {
      for (int i=0; i<n; i++) {
        this.cells[i].sy = val[i];
      }
    } else if (attr.equals("rz")) {
      for (int i=0; i<n; i++) {
        this.cells[i].rz = val[i];
      }
    } else if (attr.equals("cg")) {
      for (int i=0; i<n; i++) {
        this.cells[i].cg = val[i];
      }
    } else {
      print("bad attribute");    
    }
  }
  void setOnd(String attr, float amp[], float period[], float timeShift[], String waveShape) {
      for (int i=0; i<n; i++) {
        this.cells[i].setOsc(attr,amp[i], period[i], timeShift[i], waveShape);
      }
  }
} 

// array makers

float[] ia(int n, float f, float l) { // linear interpolation from f to l
  float ra[] = new float[n];
  for (int i=0; i<n; i++) {
    ra[i] = f + i*(l-f)/(n-1);
  }
  return ra;
}

float[] ca(int n, float v) { // constant array
  float ra[] = new float[n];
  for (int i=0; i<n; i++) {
    ra[i] = v;
  }
  return ra;
}


float[] coa(float array[], float coef) { // multiply each value by coef
  int s = array.length;
  float ra[] = new float[n];
  for (int i=0; i<n; i++) {
    ra[i] = array[i]*coef;
  }
  return ra;
}


float[] spa(int n, int st) { // spiral radius and angle interpolation (same distance between cells), $st starting cell number
  float a[] = new float[n+st];
  a[0] = 0;
  a[1] = 1;
  for (int i=2; i<n+st; i++) {
    a[i] = 0.5*(a[i-1]+sqrt(5*a[i-1]*a[i-1]-4*a[i-2]*a[i-1]));
  }
  float ra[] = new float[n];
  float m = a[n+st-1];
  for (int i=0; i<n; i++) {
    ra[i] = a[i+st]/m;
  }
  return ra;
}

float[] ptxa(float ra[], float aa[]) { // polar to cartesian x array transform
  int n = ra.length;
  float xa[] = new float[n];
  for (int i=0; i<n; i++) {
    xa[i] = ra[i]*cos(PI/180*aa[i]);
  }
  return xa;
}

float[] ptya(float ra[], float aa[]) { // polar to cartesian y array transform
  int n = ra.length;
  float ya[] = new float[n];
  for (int i=0; i<n; i++) {
    ya[i] = ra[i]*sin(PI/180*aa[i]);
  }
  return ya;
}


