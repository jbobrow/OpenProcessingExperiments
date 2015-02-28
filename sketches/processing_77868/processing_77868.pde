
PFont f;
 
int num = 180;
int step = 360;
float centx, centy;
Particle[] pArr;
 
void setup() {
  size(880,660);
  background (0);
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

   
   
  for (int i=0;i<num;i++) {
    pArr[i].update();
  }
}
 
void mousePressed() {
  background (0,0);
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
    
  }
   
  void init() {
    trace("init");
    count = 1;
    step = 10;
    life = 360;
//    life = random(360,1440);
    
// radius = random(width*-.2) + random(10,2000);
   radius = random(0,600);  
    origx = centx + (radius * cos(angle));
    origy = centy + (radius / sin(angle));
    x1 = origx;
    y1 = origy;
    

    rd = int(random(-250,555));
       
     gr = int(random(-100,355));
     bl = int(random(-100,355));
     alph= int(random(200,255));
    //bl = gr = rd;  // grey
  }
   
  void update() {
 //   blendColor(rd, gr,ADD);
    count += step;
    angle = count;
    // project x2,y2 from x1,y1, and draw a line to it
    x2 = centx + (radius * cos(angle));
    y2 = centy + (radius * sin(angle));
    // draw line to it
    strokeWeight(random(.01,1));
    strokeWeight(1);
 //   stroke(rd, gr, bl, alph);
stroke(rd,0,0,alph);
    
    line(x1, y1, x2, y2);
    // reset for next update
    x1 = x2; y1 = y2;
    // if (x1 > width) { x1 = 0; }
     //if (y1 > height) { y1 = 0; }
     //expiration 
    if (count >= life) { init(); }
  }
   
}
