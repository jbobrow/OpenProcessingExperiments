
myBezier mybezier01;
myBezier mybezier02;
myBezier mybezier03;
myBezier mybezier04;
myBezier mybezier05;

void setup() {
  size(600,450);
  mybezier01 = new myBezier(0, 0); 
  mybezier02 = new myBezier(0, 0);
  mybezier03 = new myBezier(0, 0);
  mybezier04 = new myBezier(0, 0);
  mybezier05 = new myBezier(0, 0); 
  smooth();
   
}
 
void draw() {
  background(255);
  mybezier01.move();
  mybezier01.display();
  mybezier02.move();
  mybezier02.display();
  mybezier03.move();
  mybezier03.display();
  mybezier04.move();
  mybezier04.display();
  mybezier05.move();
  mybezier05.display();
}

 
class myBezier { 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  int colorstep;
  int weight = 1;
  
  myBezier(float tempXpos, float tempYpos) {
    c = 2;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = 0.5 + random(1.);
    colorstep = 50;

  }
 
  void display() {
    noFill();
   strokeWeight(xpos/50 );
   stroke(c + (xpos/width * colorstep));
   bezier(xpos+400, ypos, 20 + c/3, 250,xpos + 100, ypos + 50, xpos + 250, ypos + 500);
   bezier(xpos, ypos, 20 + random(20,30), 100,110, ypos + random(200,210), xpos- 200, ypos + 500);
  
  }
  

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
      c = c + colorstep; 
    }
    if(c > 255) c = 0; 
  }
}


