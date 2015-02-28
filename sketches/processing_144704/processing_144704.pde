
/*
NATHAN STETTER
ART 3001: FINAL PROJECT
*/

Web w1;
Rings[] r;
boolean joints;
int numOfRings;
int jointCounter = 0;
int ranGrow = (int)random(500, 1000);
int gIndex = 0;
void setup() {
  size(950,650);
  smooth();
  background(255);
  numOfRings = (int)random(1, 5);
  joints = false; 
  w1 = new Web();
  r = new Rings[numOfRings];
  for (int i = 0; i < numOfRings; i++) {
    r[i] = new Rings(width / 2 + (int)random(0, 50), height / 2 + (int)random(0, 50));
  }
}

//the value of fill
int fNum = 255;
//the color we want when we want to changeStroke
int c = 255;
int csOffset = ranGrow + 100;
void draw() {
  fill(fNum, 10);
  noStroke();
  rect(0, 0, width, height);
  w1.display();
  
   
  for (int i = 0; i < numOfRings; i++) { 
    r[i].display();
    int hit = r[i].hitByWeb(w1); 
    if (hit > 0) {
       r[i].moveRing(hit);
    } 
  }
  
  if (gIndex > ranGrow) {
   w1.growJoints(); 
   if (fNum > 0) {
     fNum--;
   }
   if (gIndex > csOffset) {
     w1.changeStroke(c, c, c);
     if (c > 0) {
       c--;  
     }
   }
  }
  gIndex++;
  
}

class Rings {
  float x1, y1, x2, y2, x3, y3, e;
  float rSize;
  Rings(int x, int y) {
    x1 = x;
    y1 = y;
    rSize = width / 1.8;
    //for easing when rings are hit
    e = 0.05;
  }
  
  void display() {
    ellipseMode(CENTER);
    smooth();
    noFill();
    strokeWeight(3);
    //e1
    stroke(200, 50);
    ellipse(x1, y1, rSize, rSize);
    
  }
   int hitByWeb(Web w) {
     int b = -42;
     //distance between e1 and the current joint in the Web
     float d1 = dist(x1, y1, w.x1, w.y1);
     
     if (w.x1 < x1 && w.y1 < y1) {
       b = 1;
     } else if (w.x1 > x1 && w.y1 < y1) {
       b = 2;
     } else if (w.x1 < x1 && w.y1 > y1) {
       b = 3;
     } else if (w.x1 > x1 && w.y1 > y1) {
       b = 4;
     }
     return b;
   }
   
   void moveRing(int location) {
     if (location == 1) {
       x1 -= 4;
       y1 -= 4;
     } else if (location == 2) {
       x1 += 4;
       y1 -= 4; 
     } else if (location == 3) {
       x1 -= 4;
       y1 += 4;
     } else if (location == 4) {
       x1 += 4;
       y1 += 4;
     }
   }
   
   void moveRingsBack() {
     if (rSize > (width / 1.8)) {
       rSize -=5;
     }
   } 
}

class Web {
  float x1, y1, x2, y2, w, h, sx, sy, eSize;
  int r, g, b, offset;  
  Web() {
    sx = 180;
    sy = 50;
    
    r = 130;
    g = 217;
    b = 0;
    w = width;
    h = height;
    
    x1 = random(sx, w - sx);
    y1 = random(sy, h - sy);
    eSize = 10;
  } 
  
  void display() {
    float x2 = random(sx, w - sx);
    float y2 = random(sy, h - sy);
    
    stroke(r, g, b);
    strokeWeight(0.5);
    line(x1, y1, x2, y2);
    
    ellipseMode(CENTER);
    noFill();
    ellipse(x1, y1, eSize, eSize);
    
    x1 = x2;
    y1 = y2;
  }
  
  void changeStroke(int _r, int _g, int _b) {
    r = _r;
    g = _g;
    b = _b;
  }
  
  void grow() {
    sx -=10;
    sy -= 10;
    w += 10;
    h += 10;
  }
  
  void shrink() {
    sx +=10;
    sy += 10;
    w -= 10;
    h -= 10; 
  }
  
  void growJoints() {
    if (eSize < 500) {
     eSize+=2;
    }
  }
  void shrinkJoints() {
    if (eSize > 10) {
      eSize -= 2; 
    }
  }
}
