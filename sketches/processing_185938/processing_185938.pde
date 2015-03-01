
int n=1380;
float period = 0.1;
Ondulator o;
static int FRAMERATE = 25;
float t = 0, dt = (float)1/FRAMERATE;
float d = 150*period;
float r, nt;
float sp[], rad[], ang[];

void setup() 
{
  size(500,500);
  frameRate(FRAMERATE);
  t=0;
  dt=(float)1/FRAMERATE; 
  
  r = 0.46*width; // radius
  nt = 19; // number of turns
  sp = spa(n,1);
  rad = coa(sp,r);
  ang = coa(sp,nt*360);
  o = new Ondulator(n); 
  o.x = width/2; 
  o.y = height/2; 
  o.setPos("x",ptxa(rad,ang));
  o.setPos("y",ptya(rad,ang));
  o.setPos("rz",ang);
  o.setPos("s",ca(n,r/nt/25));
  o.setPos("cg",ca(n,0));
  o.setOnd("s",ca(n,0.5),ca(n,period),ca(n,0),ofa(ia(n,d-period,0),0),ca(n,period),"psin");
  o.setOnd("s",ca(n,0.5),ca(n,period),ca(n,0),ofa(ia(n,d-period,0),d-d*0.88),ca(n,period),"psin");
}

void draw() { 
  background(255);
  o.draw(); 
  t=(t+dt)%(d+d*0.12);
  //saveFrame("spira7c.##.bmp"); if(frameCount >= (d+d*0.12)*FRAMERATE) exit();
} 

// -------------------------------------- Ondulator class and subclasses 
class Oscillator {
  float offset;
  float amplitude;
  float period;
  float timeShift;
  float delay;
  float duration;
  String waveShape;
  float value;
  
  Oscillator(float amplitude, float period, float timeShift, float delay, float duration, String waveShape) {
    this.amplitude = amplitude; 
    this.period = period; 
    this.timeShift = timeShift; 
    this.delay = delay; 
    this.duration = duration; 
    this.waveShape = waveShape; 
    this.value = getValue();
  }
  
  float wave(float t) {
    if (waveShape.equals("sin")) {
      value = sin(TWO_PI*t);
    } else if (waveShape.equals("psin")) { // positive sine
      value = pow(sin(TWO_PI*t/2),2);
    } else if (waveShape.equals("id")) { // for rotating or spinning
      value = t%1;
    }
    return value;
  }
  
  float getValue() {
    if ((t>=delay && (t<delay+duration) && duration != 0) || (t>=delay && duration == 0)) {
      value = amplitude*wave((t-timeShift-delay)/period);
    } else {
      value = 0;
    }
    return value;
  }
}

class MultiOscillator {
  float value;
  ArrayList<Oscillator> oscillators;
  
  MultiOscillator() {
    this.oscillators = new ArrayList<Oscillator>();
  }
  
  void addOsc(Oscillator osc) {
    oscillators.add(osc);
  }
  
  float getValue() {
    value = 0;
    for (int i = 0; i < oscillators.size(); i++) {
      value += oscillators.get(i).getValue();
    }
    return value;
  }
}
 
class Cell { 
  float x, y, s, sx, sy, rz, cg;
  float dx, dy, ds, dsx, dsy, drz;
  MultiOscillator xOsc, yOsc, sOsc, sxOsc, syOsc, rzOsc;
  Cell () {  
   x = 0;  y = 0; s = 1; sx = 1; sy = 1; rz = 0; cg = 0;
   dx = 0;  dy = 0; ds = 0; dsx = 0; dsy = 0; drz = 0;
   xOsc = new MultiOscillator();
   yOsc = new MultiOscillator();
   sOsc = new MultiOscillator();
   sxOsc = new MultiOscillator();
   syOsc = new MultiOscillator();
   rzOsc = new MultiOscillator();
  } 
  void draw() {
    if (xOsc != null) {dx = xOsc.getValue();}
    if (yOsc != null) {dy = yOsc.getValue();}
    if (sOsc != null) {ds = sOsc.getValue();}
    if (sxOsc != null) {dsx = sxOsc.getValue();}
    if (syOsc != null) {dsy = syOsc.getValue();}
    if (rzOsc != null) {drz = rzOsc.getValue();}
    pushMatrix(); 
    translate(x+dx,y+dy);
    rotate((rz+drz)*PI/180);
    scale(s+ds);
    smooth();
    noStroke();
    fill(this.cg);
    ellipse(0, 0, 10*(sx+dsx), 10*(sy+dsy)); 
    popMatrix();
  } 
  void setOsc(String attr, float amp, float period, float timeShift, float delay, float duration, String waveShape) {
    Oscillator osc = new Oscillator(amp, period, timeShift, delay, duration, waveShape);
    if (attr.equals("x")) {
      this.xOsc.addOsc(osc);
    } else if (attr.equals("y")) {
      this.yOsc.addOsc(osc);
    } else if (attr.equals("s")) {
      this.sOsc.addOsc(osc);
    } else if (attr.equals("sx")) {
      this.sxOsc.addOsc(osc);
    } else if (attr.equals("sy")) {
      this.syOsc.addOsc(osc);
    } else if (attr.equals("rz")) {
      this.rzOsc.addOsc(osc);
    } else {
      print("wrong attribute");    
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
  void setOnd(String attr, float amp[], float period[], float timeShift[], float delay[], float duration[], String waveShape) {
      for (int i=0; i<n; i++) {
        this.cells[i].setOsc(attr,amp[i], period[i], timeShift[i], delay[i], duration[i], waveShape);
      }
  }
} 

// ----------------- Array makers functions

float[] ia(int n, float f, float l) {
  float ra[] = new float[n];
  for (int i=0; i<n; i++) {
    ra[i] = f + i*(l-f)/(n-1);
  }
  return ra;
}

float[] ca(int n, float v) {
  float ra[] = new float[n];
  for (int i=0; i<n; i++) {
    ra[i] = v;
  }
  return ra;
}

float[] ha(int n, float coef) {
  float ra[] = new float[n];
  for (int i=0; i<n; i++) {
    ra[i] = n*coef/(i+1);
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

float[] ofa(float array[], float offset) { // add offset to each value
  int s = array.length;
  float ra[] = new float[n];
  for (int i=0; i<n; i++) {
    ra[i] = array[i]+offset;
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

float[] ptxa(float ra[], float aa[]) { // polar to x cartesian array transform
  int n = ra.length;
  float xa[] = new float[n];
  for (int i=0; i<n; i++) {
    xa[i] = ra[i]*cos(PI/180*aa[i]);
  }
  return xa;
}

float[] ptya(float ra[], float aa[]) { // polar to y cartesian array transform
  int n = ra.length;
  float ya[] = new float[n];
  for (int i=0; i<n; i++) {
    ya[i] = ra[i]*sin(PI/180*aa[i]);
  }
  return ya;
}


