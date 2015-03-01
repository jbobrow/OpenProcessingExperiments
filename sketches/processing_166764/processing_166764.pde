
class Dot {
  int x, y, oy;
  int dy;
  int del;
  int dir;
  int range;
  float speed;
  
  Dot(int _x, int _y, int _range, float _speed) {
   x=_x; y=_y; del=0;
    oy=y;
    dir = (int)random(0,1);
    range = _range;
    dy = range/50;
    speed = _speed;
  } 
    void move() {
     if(dir == 0) {
      y += range*Math.sin(del*3.4/180*speed);
      del+=1;
      if(y >= (oy+range)) {
       dir = 1;
       y = oy+range; 
      }
     }
    else {
     y -= range*Math.sin(del*3.14/180*speed);
      del+=1;
      if(y <= (oy-range)) {
       dir = 0;
       y = oy-range; 
      }
     } 
    }
  }
  
  Dot dot1 = new Dot(100, 100, 20, 0.1);
  Dot dot2 = new Dot(200, 100, 30, 0.2);
  Dot dot3 = new Dot(300, 100, 30, 0.3);
  Dot dot4 = new Dot(400, 100, 30, 0.2);
  Dot dot5 = new Dot(500, 100, 30, 0.1);
  
  void setup() {
    size(600, 200);
  }
  
  int r=0,g=0,b=0;
  
  void draw() {
   background(0);
  
   dot1.move();
   dot2.move();
   dot3.move();
   dot4.move();
   dot5.move();
    
    r+=1;
    g+=2;
    b+=3;
    
    stroke(r%256,g%256,b%256);
    strokeWeight(10);
    
    noFill();
    beginShape();
    curveVertex(50, 100);
    curveVertex(50, 100);
    curveVertex(dot1.x, dot1.y);
    curveVertex(dot2.x, dot2.y);
    curveVertex(dot3.x, dot3.y);
    curveVertex(dot4.x, dot4.y);
    curveVertex(dot5.x, dot5.y);
    curveVertex(550, 100);
    curveVertex(550, 100);
    endShape();
   }
  
  


