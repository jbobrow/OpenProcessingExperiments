
int n = 500, no = 9;
float period = 6;
Ondulator[] ondulators = new Ondulator[no];
static int FRAMERATE = 25;
static float PI = 3.1416;
float ts = 0.2;
float t = 0, dt = (float)1/FRAMERATE;;

void setPosOnd(Ondulator o, float period, float ts) 
{
  o.setPos("x",ia(n,20,140));
  o.setPos("s",coa(sia(n,0,PI-0.1),1.3));
  o.setOnd("y",ia(n,50,200),ca(n,period),coa(ia(n,0,period),n*ts),ca(n,0),ca(n,0),"sin");
}

void setPosOnds(Ondulator ondulators[], float periods[], float tss[]) 
{
  for (int i = 0; i < ondulators.length; i++) {
    setPosOnd(ondulators[i],periods[i],tss[i]);
    ondulators[i].x = width/2;
    ondulators[i].y = height/2;
    ondulators[i].rz = 360*i/no;
    ondulators[i].setPos("c2",ia(n,(i+1)%3*100,150));
    ondulators[i].setPos("c1",ia(n,((i+1)%3)*50,((i+1)%3)*100));
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
  setPosOnds(ondulators,ca(no,period),ca(no,ts));
}

void draw() { 
  background(255);
  smooth();
  noStroke();
  for (int i = 0; i < no; i++) {
    ondulators[i].draw();
  }
  t+=dt;
  //saveFrame("cordes10c.##.bmp"); if(frameCount > period*ts*FRAMERATE-1) exit();
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
  float x, y, s, sx, sy, rz, cg, c1, c2, c3, alpha;
  float dx, dy, ds, dsx, dsy, drz;
  MultiOscillator xOsc, yOsc, sOsc, sxOsc, syOsc, rzOsc;
  Cell () {  
   x = 0;  y = 0; s = 1; sx = 1; sy = 1; rz = 0; cg = 0; c1 = 0; c2 = 0; c3 = 0; alpha = 255;
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
    if (this.c1 !=0 || this.c2 !=0 || this.c3 !=0) {
      fill(this.c1, this.c2, this.c3, this.alpha);
    } else {
      fill(this.cg, this.alpha);
    }
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
    } else if (attr.equals("c1")) {
      for (int i=0; i<n; i++) {
        this.cells[i].c1 = val[i];
      }
    } else if (attr.equals("c2")) {
      for (int i=0; i<n; i++) {
        this.cells[i].c2 = val[i];
      }
    } else if (attr.equals("c3")) {
      for (int i=0; i<n; i++) {
        this.cells[i].c3 = val[i];
      }
    } else if (attr.equals("alpha")) {
      for (int i=0; i<n; i++) {
        this.cells[i].alpha = val[i];
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




