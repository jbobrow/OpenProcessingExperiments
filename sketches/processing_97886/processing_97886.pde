
int num = 50;
int swidth = 500;
int sheight = 500;
Rectangles ra, rb;
Lines la, lb;
int maxl = 40;



void setup() {
  size(500, 500);
  background(0);
  frameRate(30);
  smooth();
  // x, y, speed, thickness, grey
  ra = new Rectangles();
  rb = new Rectangles();
  la = new Lines();
  lb = new Lines();
}



void draw() {
  ra.update();
  rb.update();
  la.update();
  lb.update();
}
void keyPressed() {
  if(key== 's') {
    saveFrame("screenshot-####.tiff");
  }
}


void mousePressed() { 
  background(0);
}


class Rectangles {
  int x, y, speed, thick, rd, gr, bl, alph, len;
  
  Rectangles () {
    me();
  }
  
  void me() {
    x = 0;
    y = int(random(100) - maxl) ; 
    speed = int(random(20) + 10);
    thick = int(random(5) + 2);
    
 
    if ((rd == 0) || (rd == 255)) {
      rd = int(random(255));
      gr = int(random(255));
      bl = int(random(255));
    } else {
      if (rd > 125) {
        rd=255; gr=255; bl=255;
      } else {
        rd=0; gr=0; bl=0;
      }
    }
    
  
    len = int(random(maxl - 50) + 10);
  }
  
  void update() {
    strokeWeight(thick);
    stroke(rd, gr, bl);
    fill(255,255,255,20);
    rect(x, y, x, y-len);
    x = x + speed;
    if (x > swidth) { 
      x =  -60; 
      y = y + 50;
      if (y > (sheight + maxl)) { me(); }
    }
  }
  
}
class Lines {
  int x, y, speed, thick, rd, gr, bl, alph, len;
  
  Lines () {
    me2();
  }
  
  void me2() {
    x = 0;
    y = int(random(100) - maxl) ; 
    speed = int(random(20) + 10);
    thick = int(random(5) + 2);
    
 
    if ((rd == 0) || (rd == 255)) {
      rd = int(random(255));
      gr = int(random(255));
      bl = int(random(255));
    } else {
      if (rd > 125) {
        rd=255; gr=255; bl=255;
      } else {
        rd=0; gr=0; bl=0;
      }
    }
    
  
    len = int(random(maxl - 30) + 10);
  }
  
  void update() {
    strokeWeight(thick);
    stroke(rd, gr, bl);
    fill(255,255,255,20);
    line(x, y, x, y-len);
    x = x + speed;
    if (x > swidth) { 
      x =  -60; 
      y = y + 50;
      if (y > (sheight + maxl)) { me2(); }
    }
  }
  
}


