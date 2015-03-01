
int n = 49, no = 2, np = 8;
float period = 1, duration = 3*np*period;
float r = 50, ramp = 150, s = 0.5, samp = 1;
float ps[];

Ondulator[] ondulators = new Ondulator[no];
static int FRAMERATE = 25;
static float PI = 3.1416;
float t = 0, dt = (float)1/FRAMERATE;;

void setPosOnd(Ondulator o, float p, float scale, float ts, float delay) 
{
  float periods[] = ca(n,period);
  float timeShifts[] = ca(n,ts);
  float delays[] = ofa(ja(ia(n,0,period*(n-1)/n),p),delay);
  float durations[] = ca(n,2*period);
  o.x = width/2;
  o.y = width/2;
  o.setPos("x",ptxa(ca(n,r),ia(n,0,360*(n-1)/n)));
  o.setPos("y",ptya(ca(n,r),ia(n,0,360*(n-1)/n)));
  o.setPos("s",ca(n,s*scale));
  o.setPos("cg",ca(n,0));
  o.setOnd("x",ptxa(ca(n,ramp),ia(n,0,360*(n-1)/n)),ca(n,period),timeShifts,delays,durations,"psin");
  o.setOnd("y",ptya(ca(n,ramp),ia(n,0,360*(n-1)/n)),ca(n,period),timeShifts,delays,durations,"psin");
  o.setOnd("s",ca(n,samp*scale),ca(n,period),timeShifts,delays,durations,"psin");
}

void setPosOnds(Ondulator ondulators[], float ps[], float scales[], float tss[], float delays[]) 
{
  for (int i = 0; i < ondulators.length; i++) {
    setPosOnd(ondulators[i], ps[i], scales[i], tss[i], delays[i]);
  }
}

void setup() 
{
  size(500, 500);
  frameRate(FRAMERATE);
  
  // Ondulators
  for (int i = 0; i < no; i++) {
    ondulators[i] = new Ondulator(n);
  }
  float ps[] = {36,1,45,26,41,25,12,17};
  for (int j = 0; j < ps.length; j++) {
    setPosOnds(ondulators,ca(no,ps[j]),ia(no,1,0),ia(no,0,0),ia(no,j*3*period,j*3*period+0.02));
  }
}

void draw() { 
  
  background(255);
  smooth();
  noStroke();
  for (int i = 0; i < no; i++) {
    ondulators[i].draw();
  }
  t+=dt;
  t = t%duration;
  saveFrame("similar.##.bmp"); if(frameCount == 600) exit();
} 

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
    smooth();
    fill(this.cg);
    pushMatrix(); 
    translate(x+dx,y+dy);
    rotate((rz+drz)*PI/180);
    scale(s+ds);
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

float[] ofa(float array[], float offset) { // add ofsset to each value
  int s = array.length;
  float ra[] = new float[n];
  for (int i=0; i<n; i++) {
    ra[i] = array[i]+offset;
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

float[] ja(float a[], float p) { // fill new array by jumping from p to p in old array
  int n = a.length;
  float ra[] = new float[n];
  ra[0] = a[0];
  for (int i=1; i<n; i++) {
    ra[i] = a[(int)(i*p)%n];
  }
  return ra;
}



