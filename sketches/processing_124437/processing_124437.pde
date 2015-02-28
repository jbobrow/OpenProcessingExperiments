
/* 
 Spaceship and bullets
 
 Joan Soler-Adillon, 2013
 */

spaceShip s; 

ArrayList<bullet> bulletList = new ArrayList<bullet>();

void setup() {
  size(600, 450);
  s = new spaceShip(width/2, height/2, HALF_PI);
}

void draw() {
  background(0);
  
  for(int i = 0; i < bulletList.size(); i ++){
    bullet b = bulletList.get(i);
    b.run(); 
  }
  
  s.run();
  
}

void keyPressed() {
  if (key==' ') {
    bullet b = new bullet(s.p.x,s.p.y,s.ang);
    bulletList.add(b);
  }
  if (keyCode==RIGHT)s.turningRight = true;
  if (keyCode==LEFT) s.turningLeft = true;
  if (keyCode==UP) s.movingForward = true;
  if (keyCode==DOWN) s.movingBackwards = true;
}

void keyReleased() {
  if (keyCode==RIGHT)s.turningRight = false;
  if (keyCode==LEFT) s.turningLeft = false;
  if (keyCode==UP) s.movingForward = false;
  if (keyCode==DOWN) s.movingBackwards = false;
}


////////// BULLET CLASS
class bullet {

  //bullet variables (off-screen)
  PVector p;//position
  float ang;//initial angle
  float radius = 5; //movement speed for bullet


  bullet(float _x, float _y, float _ang) {
    p = new PVector(_x,_y);
    ang = _ang;
  }

  void run() {
    move();
    display();  
    checkOutOfScreen();
  }

  void move() {
    float moveX = radius * sin(ang); 
    float moveY = -radius * cos(ang);
   
    p.x += moveX;
    p.y += moveY;
  }

  void display() {
    //draw bullet
    pushMatrix();
    //move it first
    translate(p.x,p.y);
    rotate(ang);
    fill(255, 0, 0);
    rect(-2, -10, 4, 20);
    popMatrix();
  }

  void checkOutOfScreen() {

    if ((p.x < 0 || p.x > width)&&(p.y < 0 || p.y > height)) {
      bulletList.remove(this);
    }
  }
} 

///////SPACESHIP CLASS
class spaceShip{
 
  //spaceShip variables
float ang; //initial rotation
PVector p;//initial position
float rotateVel = 0.05; // rotation speed
float radius = 2; //movement speed
int sz = 20;
//moving vars
boolean movingForward = false;
boolean movingBackwards = false;
boolean turningRight = false;
boolean turningLeft = false;

 spaceShip(float _x, float _y, float _ang) {
    p = new PVector(_x,_y);
    ang = _ang;
 }

 void run(){
  checkMove();
  display();
 }
 
 void checkMove(){
     //check movement of spaceShip
  float moveX = radius * sin(ang); 
  float moveY = -radius * cos(ang);

  if (movingForward) {
    p.x += moveX;
    p.y += moveY;
  } 
  if (movingBackwards) {
    p.x -= moveX;
    p.y -= moveY;
  }
  if (turningRight) {
    ang += rotateVel;
  }
  if (turningLeft) {
    ang -= rotateVel;
  }
  //keep spaceship inside (wrap around)
  if (p.x<-sz)p.x=width+sz;
  if (p.x>width+sz)p.x=-sz;
  if (p.y<-sz)p.y=height+sz;
  if (p.y>height+sz)p.y=-sz;
 }
 
 void display(){
     //draw spaceship
    fill(255);
  pushMatrix();
  translate(p.x, p.y);
  rotate(ang);
  triangle(0, -sz, -sz/2, sz, sz/2, sz);
  popMatrix();

 }

  
}
