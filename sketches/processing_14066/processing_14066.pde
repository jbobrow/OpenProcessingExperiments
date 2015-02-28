
float t = 0, dt = 0.08;
float mt = 4;

class SinCos {
  float x, y;   // Center
  float rx, ry; // radius H, V
  float fx, fy; // freq H, V
  float rxA, rxF; 
  float ryA, ryF;
  float a;
  
  float pr;     // particle radius
  float prA;    // particle radius amp
  float prF;    // particle radius freq
  
  float density; // density
  float created;  // created time
  
  color clr;      // particle color
  
  SinCos(float xx, float yy, float crt) {
    x = xx;
    y = yy;
    
    rx = random(100, width / 2);
    ry = random(100, height / 2);    
    fx = random(1, 4);
    fy = random(1, 4);
    
    rxA = random(0, 0.3);
    rxF = random(1, 11);
    ryA = random(0, 0.3);
    ryF = random(1, 11);
    
    pr = random(5, 50);
    prA = random(3, pr);
    prF = random(1, 8);
    
    a = random(0, TWO_PI);
    
    clr = color(
      random(0, TWO_PI),
      0.7,
      1,
      random(0.1, 0.2)
    );
    
    density = 100;
    created = crt;
  }
  
  void draw(float t) {
    for (float s = 0; s < TWO_PI; s+= TWO_PI/density) {
      drawPart(s, t);
    }
  }
  
  void drawPart(float s, float t) {
    fill(
      hue(clr),
      saturation(clr),
      brightness(clr),
      alpha(clr) * cos(map(t - created, 0, mt, 0, HALF_PI))
    );
    noStroke();
    
    pushMatrix();
    translate(x, y);
    rotate(a);
    
    ellipse(
      rx * (1 + rxA * sin(rxF * (s - t))) * cos(fx * s),
      ry * (1 + ryA * sin(ryF * (s - t))) * sin(fy * s),
      pr + prA * sin(prF * (s - t)),
      pr + prA * sin(prF * (s - t))
    );
    popMatrix();
  }
}

ArrayList sc;
int mode;

float cx, cy;
float mx, my, mr, ma;

void setup() {
  size(300, 300);
  colorMode(HSB, TWO_PI, 1.0, 1.0, 1.0);
  smooth();
  frameRate(30);
  
  sc = new ArrayList();
  
  mode = 0; 
  
  cx = width / 2;
  cy = height / 2;
}

void draw() {
  clear();

  for (float z = 0; z < TWO_PI; z += TWO_PI/500) {
    for (int i = 0; i < sc.size(); i++) {
      SinCos s = (SinCos) sc.get(i);
      
      s.drawPart(z,t);
    }
  }
  
  t += dt;
  
  if (mode == 1) drawRect();
  
  attenuate();
}

void clear() {
  fill(0, 0, 0.2, 0.3);
  noStroke();
  rect(0, 0, width, height);
}

void drawRect() {
  noFill();
  stroke(1, 0, 1, 0.3);
  
  mr = dist(mx, my, mouseX, mouseY);
  ma = atan2(mouseY - my, mouseX - mx);
  
  pushMatrix();
  translate(mx, my);
  rotate(ma);
  rect(-mr, -mr, 2*mr, 2*mr); 
  popMatrix();
}

void mousePressed() {
  mode = 1;
  
  mx = mouseX;
  my = mouseY;
}

void mouseReleased() {
  newSinCos();
  
  mode = 0;
}

void newSinCos() {
  SinCos s = new SinCos(mx, my, t);
  
  s.rx = mr;
  s.ry = mr;
  s.a = ma;
  
  sc.add(s);
}

void keyPressed() {
  saveFrame("img-####.png");
}

void attenuate() {
  int i = 0;

  while (i < sc.size()) {
    SinCos s = (SinCos) sc.get(i);
    
    if (t - s.created > mt)
      sc.remove(i);
    else
      i++;
  }
}

