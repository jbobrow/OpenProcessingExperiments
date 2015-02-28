
BankRobber br1;
BankWall bw1;
BankWall bw2;
BankWall bw3;
BankWall bw4;
BankWall bw5;
BankWall bw6;
BankWall bw7;
BankWall bw8;
float x, y;

void setup() {
  size(750, 750);
  background(255);
  br1 = new BankRobber();
  
  x = random(150, 600);
  y = random(150, 600);
  
  bw1 = new BankWall(x, y + 65);
  bw2 = new BankWall(x, y - 65);
 
  bw3 = new BankWall(x + 65, y);
  bw4 = new BankWall(x - 65, y);
  
  bw5 = new BankWall(x + 55, y + 55);
  bw6 = new BankWall(x - 55, y - 55);
  
  bw7 = new BankWall(x + 55, y - 55);
  bw8 = new BankWall(x - 55, y + 55);
}

void draw() {
  background(255);
  br1.display();
  br1.run();
 
 //top
  bw1.display();
  
  //bottom
  bw2.display();
  
  //right
  bw3.display();
  //left
  bw4.display();
  
  //bottom right
  bw5.display();
  //top left
  bw6.display();
  
  //top right
  bw7.display();
  //bottom left
  bw8.display();
  
  if (bw1.touching(br1)) {
     bw1.moveWall(); 
  }
  if (bw2.touching(br1)) {
     bw2.moveWall(); 
  }
  if (bw3.touching(br1)) {
     bw3.moveWall(); 
  }
  if (bw4.touching(br1)) {
     bw4.moveWall(); 
  }
  if (bw5.touching(br1)) {
     bw5.moveWall(); 
  }
  if (bw6.touching(br1)) {
     bw6.moveWall(); 
  }
  if (bw7.touching(br1)) {
     bw7.moveWall(); 
  }
  if (bw8.touching(br1)) {
     bw8.moveWall(); 
  }
  
  bw1.moveBack();
  bw2.moveBack();
  bw3.moveBack();
  bw4.moveBack();
  bw5.moveBack();
  bw6.moveBack();
  bw7.moveBack();
  bw8.moveBack();

  
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
       c = color(r,g,bl);
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
