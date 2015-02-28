
BankRobber br1;
BankWall[] bw1;
float x, y;

void setup() {
  size(750, 750);
  background(255);
  br1 = new BankRobber();
  
  x = random(50, 700);
  y = random(50, 700);
  bw1 = new BankWall[200];
  for (int i = 0; i < 200; i++) {
     bw1[i] = new BankWall(random(50, 700),random(50, 700)); 
  }
  
}

void draw() {
  background(255);
  br1.display();
  br1.run();
 
 for (int i = 0; i < 200; i++) {
     bw1[i].display();
     if (bw1[i].touching(br1)) {
       bw1[i].moveWall(); 
     }
     bw1[i].moveBack();
  }
  
}

//------------
//BANK CLASS
//------------

class BankWall {
    
  float x, orig_x, y, orig_y;
  float e = .05;
  float radius = 32.5;
  
  float r = random(255);
  float g = random(255);
  float bl = random(255);
  color c = color(150);
 
  BankWall(float _x, float _y) {
    x = _x;
    y = _y;
    orig_x = x;
    orig_y = y;
  }
 
  void display() {
    stroke(c);
    noFill();
    ellipse(x, y,65,65);
    
  }
 
 //check if the BankRobber is touching the bank wall
  boolean touching(BankRobber b) {
   boolean bool = false;
   float d = dist(x,y, b.x, b.y);
   if (d < b.radius*2) {
     bool = true;
   }
   return bool;
  }
  
  //if the BankRobber is touching, we want to move our wall
  void moveWall() {
    float runX = mouseX - x;
    float runY = mouseY - y;
    
    if (abs(runX) > 1) {
      //offest x position to create easing effect
      x -= runX * e;
    }
    if (abs(runY) > 1) {
      //offest y position to create easing effect
      y -= runY * e;
    }
  }
  void moveBack() {
    if (x != orig_x) {
      if (x > orig_x) {
       x -= 0.4;
      } else {
       x += 0.4;
      }
      c = color(r,g,bl);
    }
    if (y != orig_y) {
      if (y > orig_y) {
       y -= 0.4;
      } else {
       y += 0.4;
      }
    } 
  }
  
}

//------------
//BANKROBBER CLASS
//------------

class BankRobber {
 
  float x, y, e;
  float radius = 25;
 
 BankRobber() {
   x = 0;
   y = 0;
   e = .05;
 }
 
 void display() {
   noStroke();
   fill(25);
   ellipse(x, y, 50, 50);  
 }
 
 void run() {
    float runX = mouseX - x;
    float runY = mouseY - y;
    
    if (abs(runX) > 1) {
      //offest x position to create easing effect
      x += runX * e;
    }
    if (abs(runY) > 1) {
      //offest y position to create easing effect
      y += runY * e;
    }
 }
 
}
