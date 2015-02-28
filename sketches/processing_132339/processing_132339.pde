
class Cow {
  float x,y;
  float speed;
  float bad;
  float choose;
  PImage cow;
  PImage evilcow;

  Cow(int stage) {
    x = random((width-80));
    y = -100;
    speed = random(5,10);
    bad = random(0,1);
    cow = loadImage("cow.png");
    evilcow = loadImage("evilcow.png");
    if ( stage == 1 ){
      choose = 0.9;
    } else if ( stage == 2 ){
      choose = 0.5;
    } else if ( stage == 3 ){
      choose = 0.2;
    }
  }

  void move() {
    y += speed; 
  }

  void display() { 
    if  (bad <= choose){
       image(cow,x,y);
    } else {
       image(evilcow,x,y);
    } 
  }

  void caught() {
    speed = 0; 
    y = - 1000;
  }
  

}

