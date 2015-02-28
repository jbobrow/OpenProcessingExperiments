
PFont f;

int num = 2;
int step = 10;
float centx, centy;
Particle[] pArr;

void setup() {
  size(800,600);
  background (75);
  smooth();
  f = createFont ("Verdana Bold", 16, true);
  
  centx = width/2;
  centy = height/2;
  
  pArr = new Particle[num];
  for (int i=0;i<num;i++) {
    pArr[i] = new Particle(i);
  }
}

void draw() {
  fill (0, 0, 0, 75);
  noStroke ();
  rect (275, 535, 515, 50);
  
  textFont (f, 48);
  fill (200, 115, 115);
  text ("Kenny Rose Design", 275, 575);
  
  fill (0, 0, 0, 75);
  noStroke ();
  rect (20, 5, 375, 25);
  
  fill (0, 0, 0, 75);
  noStroke ();
  rect (20, 20, 675, 25);
  
  textFont (f, 16);
  fill (200, 115, 115);
  text ("created with Processing and Processing.js", 20, 20);
  
  textFont (f, 16);
  fill (200, 115, 115);
  text ("sketch based on original code by zenbullets.com found at abandonedart.com", 20, 40);
  
  
  for (int i=0;i<num;i++) {
    pArr[i].update();
  }
}

void mousePressed() { 
  background (75);
  centx = mouseX;
  centy = mouseY;
  for (int i=0;i<num;i++) {
    pArr[i].init();
  }
}

class Particle {
  int id;
  int count, life, step;
  float origx, origy;
  float x1, y1, x2, y2;
  int rd, gr, bl, alph;
  float angle, radius;
  
  Particle (int num) {
    id = num;
    init();
  }
  
  void trace(String str) {
    println("Particle " + id + ": " + str);
  }
  
  void init() {
    trace("init");
    count = 0;
    step = 10;
    life = 720;
    radius = random(width * 2) + 50;
    
    origx = centx + (radius * cos(angle));
    origy = centy + (radius * sin(angle));
    x1 = origx;
    y1 = origy;
    
    rd = int(random(255));
    // gr = int(random(255));
    // bl = int(random(255));
    bl = gr = rd;  // grey
  }
  
  void update() {
    count += step;
    angle = count; 
    // project x2,y2 from x1,y1, and draw a line to it
    x2 = centx + (radius * cos(angle));
    y2 = centy + (radius * sin(angle));
    // draw line to it
    strokeWeight(1);
    stroke(rd, gr, bl);
    line(x1, y1, x2, y2);
    // reset for next update
    x1 = x2; y1 = y2; 
    // if (x1 > width) { x1 = 0; }
    // if (y1 > height) { y1 = 0; }
    // expiration  
    if (count >= life) { init(); }
  }
  
}


