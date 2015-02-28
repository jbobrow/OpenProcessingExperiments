
float spin = 0.02;
float angY;
int mx = -1; // mouse coordinates for mouse-dragging rotation
Point[] p;
int mode = 0; //0=normal, 2=anaglyph, 3=parallel, 4=cross-eye
int halfH, halfW, quarterW;

//================================================================

void setup() {
  size(800, 400, P2D);
  background(0);
  textSize(9);
  
  p = new Point[100];
  for(int i=0; i<p.length; i++) 
    p[i] = new Point(i);
  halfH = height/2;
  halfW = width/2;
  quarterW = width/4;
}

//================================================================

void draw() {
  if (!mousePressed)
    angY += spin;
  else if (mouseX != mx) {
    float delta = mouseX - mx;
    mx = mouseX;
    angY += delta*0.005;
  }
  angY %= TWO_PI;

  background(0);
  fill(128);
  switch (mode) {
    case 0: text("Normal", 10, 15); break;
    case 1: text("Stereoscopic (Anaglyph)", 10, 15); break;
    case 2: text("Stereoscopic (Parallel)", 10, 15); break;
    case 3: text("Stereoscopic (Cross-Eye)", 10, 15); break;
  }
  
  translate(halfW, halfH);
  if (mode > 1) 
    translate(quarterW*(mode==3?-1:1), 0);
  for(int i=0; i<p.length; i++) 
    p[i].display(LEFT);
  if (mode > 0) {
    if (mode > 1) 
      translate(halfW*(mode==3?1:-1), 0);
    for(int i=0; i<p.length; i++) 
      p[i].display(RIGHT);
  }
}

//================================================================

void mousePressed() {
  mx = mouseX;
}

//================================================================

void keyPressed() {
  mode = (mode + 1)%4;
}

//================================================================

class Point {
  PVector loc = new PVector(0,0,0);
  //-----------------------------------
  Point(int pID) {
    loc.y = pID*4 - p.length*2;
    loc.x = cos(loc.y)*random(250);
    loc.z = sin(loc.y)*random(250);
  }
  //-----------------------------------
  void display() {
    display(LEFT);
  }
  //-----------------------------------
  void display(int eye) {
    if (mode == 0 && eye == RIGHT) return;
    float adjust = 0.0;
    if (eye == RIGHT) { 
      adjust = 0.02;
      if (mode == 1) adjust = 0.07;
    }
    float s = sin(angY + adjust);
    float c = cos(angY + adjust);
    PVector disp = new PVector(loc.z*s + loc.x*c, loc.y, loc.z*c - loc.x*s);
    float depth = disp.z/150.0 + 3.0;
    
    stroke(depth*70, 32);
    fill(depth*70, 128);
    if (mode == 1) {
      if (eye == RIGHT) {
        stroke(depth * 70, 0, 0, 32);
        fill(depth * 70, 0, 0, 128);
      }
      if (eye == LEFT) {
        stroke(0, depth*25, depth*50, 32);
        fill(0, depth*25, depth*50, 128);
      }
    }
    line(disp.x, disp.y, 0, 0);
    noStroke();
    ellipse(disp.x, disp.y, depth, depth);
  }
}


