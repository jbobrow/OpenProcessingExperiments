
// Sep 2008 
// http://www.abandonedart.org
// http://www.zenbullets.com
//
// This work is licensed under a Creative Commons 3.0 License.
// (Attribution - NonCommerical - ShareAlike)
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// 
// This basically means, you are free to use it as long as you:
// 1. give http://www.zenbullets.com a credit
// 2. don't use it for commercial gain
// 3. share anything you create with it in the same way I have
//
// These conditions can be waived if you want to do something groovy with it 
// though, so feel free to email me via http://www.zenbullets.com



//================================= global vars

int num = 10;
int step = 10;
float centx, centy;
Particle[] pArr;

//================================= init

void setup() {
 size(920,500);
  frameRate(25);
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
  background(255);
  // graph paper
  int gap = 10;
  strokeWeight(1);
  stroke(140, 40);
  for (int x=0;x<width;x+=gap) {
     line(x, 0, x, height);
  }
  for (int y=0;y<height;y+=gap) {
    line(0, y, width, y);
  } 
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
   // println("Particle " + id + ": " + str);
  }
  
  void init() {
    //trace("init");
    count = 0;
    step = 10;
    life = 720;
    radius = random(width * 2) + 50;
    
    origx = centx + (radius * cos(angle));
    origy = centy + (radius * sin(angle));
    x1 = origx;
    y1 = origy;
    
    rd = int(random(255));
     gr = int(random(255));
     bl = int(random(255));
    //bl = gr = rd;  // grey
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
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
