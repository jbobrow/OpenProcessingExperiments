

//================================= global vars

int num = 30;
int step;
float centx, centy;
Particle[] pArr;

//================================= init

void setup() {
  size(500,300);
  frameRate(100);
  clearBackground();
  smooth();
  
  centx = width/2;
  centy = height/2;
  
  pArr = new Particle[num];
  for (int i=0;i<num;i++) {
    pArr[i] = new Particle(i);
  }
}

void clearBackground() {
  background(0);
}

//================================= frame loop

void draw() {
  // clearBackground();
  for (int i=0;i<num;i++) {
    pArr[i].update();
  }
}

//================================= interaction

void mousePressed() { 
  clearBackground();
  centx = mouseX;
  centy = mouseY;
  for (int i=0;i<num;i++) {
    pArr[i].init();
  }
}

void keyPressed(){
  save("tmp.jpg");
}

//================================= objects

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
    step = int(random(20))+1; //each step of each loop (circle)
    life = 180 * int(random(5) + 1);
    radius = random(width) + 10;
    // radius = random(50);
    
    //origx = centx + (radius * cos(angle));
    //origy = centy + (radius * sin(angle));
    x1 = 999;
    //y1 = origy;
    alph = 255;
    
    rd = int(random(255));
    //gr = int(random(255));
    //bl = int(random(255));
    bl = gr = rd;  // grey
  }
  
  void update() {
    count += step;
    angle = count; 

    x2 = centx + (radius * cos(angle));
    y2 = centy + (radius * sin(angle));

    if (x1 != 999) {
      strokeWeight(1);
//      stroke(rd, gr, bl);
      stroke(random(255),random(255),random(255));      
      fill(random(255));
      ellipse(x2,y2,random(10),random(10));
    }
    // reset for next update
    x1 = x2; y1 = y2;
    
    alph -= step;
   
    // expiration  
    if (count >= life) { init(); }
  }
  
}
