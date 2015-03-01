
/*
 Jesus C Gonzalez
 Follow Me
 2014
 */

int amount = 100;

follower [] f = new follower[amount];

void setup() {
  size(500, 500);
   for(int i=0; i<amount; i++){
  f[i] = new follower(random(0,width), random(0,height), random(0,40),random(0, 40), 10); 
  noStroke();
   }
}

void draw() {
  fill(100, 0, 255, 2);
  rect(0, 0, width, height);
     for(int i=0; i<amount; i++){

  f[i].run();
     }
}

///////////////////////////////////////
//////////Class follower///////////////
///////////////////////////////////////

class follower {
 
  float myX, myY, vx, vy;
  int sz; 

  follower(float _x, float _y, float _vx, float _vy, int _sz) {
    myX = _x;
    myY = _y;
    vx = _vx;
    vy = _vy;
    sz = _sz;
  }

  void run() {
    update();
    drawing();
  }

  void update() {

    float distanceX = mouseX-myX;
    float distanceY = mouseY-myY;

    myX += distanceX/vx;
    myY += distanceY/vy;
  }

  void drawing() {
    fill(0, 16);
    ellipse(myX, myY, sz, sz);
  }
}



