
int n;
float period = 4;
Ondulator o1,o2,o3,o4;
static int FRAMERATE = 25;
static float PI = 3.1416;
float t = 0, dt = (float)1/FRAMERATE;;

void setPosOnd(Ondulator o) 
{
  o.setPos("x",ia(n,20,width-20));
  o.setPos("s",sia(n,0.1,PI-0.1));
  o.setPos("cg",ca(n,0));
  o.setOnd("y",ia(n,0,width/2-20),ca(n,period),ia(n,0,period*(n-1)*0.5014),"sin");
}

void setup() 
{
  size(500, 500);
  frameRate(FRAMERATE);
  
  // Ondulators
  n = 500;
  o1 = new Ondulator(n); 
  setPosOnd(o1);
  o2 = new Ondulator(n); 
  setPosOnd(o2);
  o3 = new Ondulator(n); 
  setPosOnd(o3);
  o4 = new Ondulator(n); 
  setPosOnd(o4);
  o1.x = width/2;
  o2.x = width;
  o3.x = width/2;
  o4.x = 0;
  o1.y = 0;
  o2.y = width/2;
  o3.y = width;
  o4.y = width/2;
  o1.rz = 90;
  o2.rz = 180;
  o3.rz = 270;
  o4.rz = 0;
  
}

void draw() { 
  background(255);
  smooth();
  noStroke();
  o1.draw();
  o2.draw();
  o3.draw();
  o4.draw();
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

float[] sia(int n, float f, float l) { // sinus function on interpolation from f to l
  float ra[] = new float[n];
  for (int i=0; i<n; i++) {
    ra[i] = sin(f + i*(l-f)/(n-1));
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




