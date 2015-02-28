
ArrayList<TravellingWave> waves = new ArrayList<TravellingWave>();
float t = 0;

int n = 1;

void setup() {
  size(1200,400);
}

void draw() {
  background(0);
  translate(0,height/2);
  
  waves.clear();
  waves.add(new TravellingWave(40,(0.25)*n,0, color(0,255,255)));
  waves.add(new TravellingWave(40,-(0.25)*n,0, color(0,0,255)));
  
  t = millis()/1000.0;
  if (keyPressed && key == ENTER) drawSuperposition();
  else drawWaves();
}

void drawWaves() {
  for (TravellingWave wave : waves) {
    stroke(wave.getColor());
    for (int x = 0; x <= width; x++) point(float(x),wave.y(float(x),t));
  }
}

void drawSuperposition() {
  stroke(255);
  
  for (int x = 0; x <= width; x++) {
    float y = 0;
    for (TravellingWave wave : waves) y += wave.y(float(x),t);   
    point(float(x),y);
  }
  
}

void keyPressed() {
  if (keyCode == LEFT) {
    n--;
    if (n == 0) n = 1;
  } else if (keyCode == RIGHT) {
    n++;
  }
}

class TravellingWave {

  private static final float v = 600;
  
  private float a;  // Ammplitude
  private float k;  // Angular Wavenumber
  private float w;  // Angular Frequency
  private float p;  // Phase Shift

  private color c;  // color
  
  TravellingWave(float amp, float freq, float phase, color clr) {
    a = amp;
    w = TWO_PI*freq;
    k = abs(w/v); // wavenumber = PI/300
    p = phase;
    
    c = clr;
  }
  
  float y (float x, float t) {
    return a*sin(k*x-w*t + p);
  }

  color getColor() {
    return c;
  }
}
