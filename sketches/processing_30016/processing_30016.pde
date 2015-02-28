

class SuperFigure {
  int s;
  float o;
  float p[][];
  float f; 
  float cx, cy;
  float len;
  float trigTab[][];
  
  public SuperFigure(int samples, float cx, float cy, float len) {
    s = samples;
    o = TWO_PI/s;
    trigTab = new float[s][2];
    for (int i = 0; i < s; i++) {
      float phi = i * o;
      trigTab[i][0] = cos(phi);
      trigTab[i][1] = sin(phi);
    }
    p = new float[s][2];
    this.cx = cx;
    this.cy = cy;
    this.len = len;
  }
  
  public void generate(float v[]) {
    float maxr = 0; 
    for (int i = 0; i < s; i++) {
      float phi = i * o;
      float r = pow(pow(abs(cos(v[2]*phi/4f)/v[0]),v[4]) 
                  + pow(abs(sin(v[2]*phi/4f)/v[1]),v[5]), -(1f/v[3]));                
      p[i][0] = r * trigTab[i][0];
      p[i][1] = r * trigTab[i][1];
      if (abs(r) > maxr) {
        maxr = abs(r); 
      }
    }
    f = len / (2*maxr) * 0.95f;
  }
  
  public void interpolate(SuperFigure f0, SuperFigure f1, float c) {
    float maxr = 0;
    for (int i = 0; i < s; i++) {
      for (int j = 0; j < 2; j++) {
        p[i][j] = f0.p[i][j] + c * (f1.p[i][j] - f0.p[i][j]); 
      }
      float r = p[i][0] / trigTab[i][0];
      if (abs(r) > maxr) {
        maxr = abs(r); 
      } 
    } 
    f = len / (2*maxr) * 0.95f; 
  }
  
  public void draw() {
    noFill();   
    stroke(200);
    strokeWeight(2);
    float ox = 0, oy = 0;
    for (int i = 0; i < s; i++) {     
      float x = cx + p[i][0] * f;
      float y = cy + p[i][1] * f; 
      if (i > 0) {
        line(ox, oy, x, y);        
      }
      ox = x;
      oy = y;
    }
    line(ox, oy, cx + p[0][0] * f, cy + p[0][1] * f);
  }  
}

float v[] = new float[] {1, 1, 2, 1, 1, 1};
int s = 2048;
float c = 0;
SuperFigure f0, f1, fi;
PFont font;

void randomState(float x[]) {
  x[2] = (int)random(1,20);
  x[3] = (int)random(-50,50);
  if (abs(x[3]) < 2) {
    x[3] = 2;
  }
  x[4] = (int)random(1,50);  
  x[5] = (int)random(1,50);    
}

void setup() {
  font = createFont("FFScala", 36);
  textFont(font, 12);
  size(500, 400, P2D); 
  frameRate(30);
  float cx = width / 2f;
  float cy = height / 2f;
  float len = min(width, height);
  f0 = new SuperFigure(s, cx, cy, len); 
  f1 = new SuperFigure(s, cx, cy, len); 
  fi = new SuperFigure(s, cx, cy, len);   
  f0.generate(v);
  randomState(v);
  f1.generate(v);
}

boolean pause = false;
void keyPressed() {
  if (key == 'p') {
    pause =! pause;     
  }
}

void draw() {
  background(0);
  fi.interpolate(f0, f1, c);
  fi.draw();
  text((int)v[2] + " " + (int)v[3] + " " + (int)v[4] + " " + (int)v[5], 20, 20);  
  if (!pause) 
    c += 0.02;  
  if (c >= 1.0f) {
    c = 0;
    SuperFigure tmp = f0;
    f0 = f1;
    f1 = tmp;
    randomState(v);
    f1.generate(v);
  }  
}
  


