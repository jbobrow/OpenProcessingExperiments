
int numBalls = 5;  
float gravity = 0.2; 

Ball [] allBalls = new Ball [numBalls];

void setup() {
  size(600, 600);
  smooth();
  
  for (int i= 0; i<numBalls; i++) {
    allBalls[i] = new Ball (random(width), random(height), 50);
  } 
}

void draw () {
  background(230);
  
  for (int i= 0; i<numBalls; i++) {
   allBalls[i].run();
  } 
  
}

class Ball {
  //fields
  float xpos, ypos;
  float xspeed, yspeed; 
  color c=55;
  float size;

  //constructor
  Ball (float _x, float _y, int _size) {
    xpos = _x;
    ypos = _y;
    size= _size;
    xspeed= 2;
    yspeed = 0;
  }


  //functions
  void run () {
    display();
    move();
//    hold();
    drop(); 
    bounce();
    gravity();


  } 
  void display () {
    fill (c);
    ellipse(xpos, ypos, size, size);
  }
  
  void move() {
    xpos = xpos+xspeed;
    ypos = ypos + yspeed; 
  }
  
  void bounce() {
    //right, left walls
    if ((xpos>width)||(xpos<0)) {
      xspeed = xspeed * -1; 
    } 
   
    //top, bottom walls
    if ((ypos>height)||(ypos<0)) {
      yspeed = yspeed * -1; 
    } 
    
//     //balls x
//    for (int i= 0; i<numBalls; i++) {
//      if (xpos>allBalls[i].xpos) {
//        xspeed = xspeed * -1; 
//      } 
//    }
  } 
  void gravity () {
    yspeed = yspeed + gravity;
  }
  
  void drop() {
    if (mousePressed) {
      yspeed= 7; 
      xspeed= .2;
    }
  }
  void hold() { 
    for (int i= 0; i<numBalls; i++) {
    if (mouseX == (allBalls[i].xpos+size)){
      gravity=0;
      yspeed=0;
      xspeed=0;
    }
  } 
  }
}



