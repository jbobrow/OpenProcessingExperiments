
// Even though there are multiple objects, we still only need one class.
// No matter how many cookies we make, only one cookie cutter is needed.
class DiaggravityCar {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float gravity = 0.1;
  float bouncefriction = 0.9;
  float h = 10;
  float w = 10;
 
  // The Constructor is defined with arguments.
  DiaggravityCar(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) {
    c = tempC;
    xpos = tempXpos+10;
    ypos = tempYpos+10;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
  }
 
  void display() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos,20,10);
  }
 
  void drive() {
    xspeed += gravity;
    xpos += xspeed;
    if (xpos > width-w/2) {
      xspeed *= -bouncefriction;
      xpos = width - w/2;
    }
 if(xpos<w/2){
      xspeed *= -bouncefriction;
      xpos=w/2;
    }
    yspeed += gravity;
    ypos += yspeed;
    if (ypos > height-h/2) {
      yspeed *= -bouncefriction;
      ypos = height - h/2;
    }
 if(ypos<h/2){
      yspeed *= -bouncefriction;
      ypos=h/2;
    }
  }
}


DiaggravityCar Test;
DiaggravityCar Cheata;
DiaggravityCar Roadrunner;
DiaggravityCar V;
DiaggravityCar W;
DiaggravityCar X;
DiaggravityCar Y;
DiaggravityCar Z;
void setup(){
  size(950,950);
  background(10,130,175);
  Test=new DiaggravityCar(color(10,150,150),0,0,1,1);
  Cheata=new DiaggravityCar(color(200,170,75),0,900,100,1000);
  Roadrunner=new DiaggravityCar(color(200,50,100),900,0,1000,100);
  V=new DiaggravityCar(color(150,50,150),0,900,10,10);
  W=new DiaggravityCar(color(50,50,50),900,0,10,10);
  X=new DiaggravityCar(color(200,200,200),950,0,1000,1);
  Y=new DiaggravityCar(color(125,130,125),0,950,1,1000);
  Z=new DiaggravityCar(color(50,75,30),425,425,10,10);
}
void draw(){
  Test.drive();
  Test.display();
  Cheata.drive();
  Cheata.display();
  Roadrunner.drive();
  Roadrunner.display();
  V.drive();
  V.display();
  W.drive();
  W.display();
  X.drive();
  X.display();
  Y.drive();
  Y.display();
  Z.drive();
  Z.display();
}

