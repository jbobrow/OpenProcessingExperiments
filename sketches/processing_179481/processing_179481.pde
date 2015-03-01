
int n;
float period = 2;
Ondulator o; 
static int FRAMERATE = 25;
static float PI = 3.1416;
float t = 0, dt = (float)1/FRAMERATE;;


void setup() 
{
  size(500, 500);
  frameRate(FRAMERATE);
  
  // Ondulator
  n = 50;
  o = new Ondulator(n);
  o.x = width/2;
  o.y = width/2;
  o.setPos("s",ia(n,45,0));
  o.setPos("cg",rea(ia(4,0,255),n));
  o.setOnd("x",ca(n,20),ha(n,period),ca(n,period),"cos");
  o.setOnd("y",ca(n,20),ha(n,period),ca(n,period),"sin");
}

void draw() { 
  
  background(255);
  smooth();
  noStroke();
  o.draw();
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
    } else if (this.waveShape.equals("cos")) {
      value = amplitude*cos(TWO_PI/period*(t-timeShift));
    } else if (this.waveShape.equals("psin")) { // positive sine
      value = amplitude*pow(sin(TWO_PI/period*(t-timeShift)/2),2);
    } else if (this.waveShape.equals("id")) { // for rotating or spinning
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


float[] ha(int n, float coef) { // 1-->2 harmonic array
  float ra[] = new float[n];
  float a[] = ia(n,1,2);
  for (int i=0; i<n; i++) {
    ra[i] = coef/a[i];
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

float[] rea(float array[], int n) { // repeat array until n-sized
  int s = array.length;
  float ra[] = new float[n];
  for (int i=0; i<n; i++) {
    ra[i] = array[i%s];
  }
  return ra;
}



