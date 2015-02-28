
Cube myCube;
Cube myCube1;
Cube myCube2;

void setup() {
 size(600, 400);
 myCube = new Cube();
 myCube1 = new Cube();
 myCube2 = new Cube();
}

void draw() {
 background(255);
myCube.move();
myCube.display();
myCube1.move1();
myCube2.move2();
myCube1.display();
myCube2.display();
}

class Cube{
  float xpos;
  float ypos;
  float xspeed;
  color c;
  Cube() {
  c =  color(random(200, 255));

  xpos = width/2;
  ypos = height/2;
  xspeed = 1; 
  }
  void display() {
   fill(c);
   noStroke();
  rect(xpos, ypos, 30, 20); 
  }
  void move() {
   xpos =  xpos + xspeed;
   if (xpos > width) {
    xpos=0; 
   }
  }
  void move1() {
   xpos =  (xpos*-2 + xspeed);
   ypos = ypos -1;
   if (ypos < 0){
    ypos = 400; 
   }
   if (xpos > width) {
    xpos=0; 
    c = color(random(0, 230));
   }
  }
  void move2() {
   xpos =  (xpos + xspeed) * 1.5;
   ypos = ypos +1;
   if (ypos > 400){
    ypos = 100; 
   }
   if (xpos > width) {
    xpos=0; 
    c = color(random(0, 230));
   }
  }
}

