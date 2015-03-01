
int num = 50, frames = 240;
Orb[] orbs = new Orb[num];
float theta;
color[] palette = {
  #A0ECD0, #ECD893, #E7AF7E, #B78376
};


void setup() {
  size(800, 400);  
  for (int i=0; i<num; i++) {
    float d = 150;
    float x = width/2 + cos(TWO_PI/num*i)*d;
    float y = height/2 + sin(TWO_PI/num*i)*d;;
    orbs[i] = new Orb(x,y, random(10, 20));
  }
}


void draw() {
  background(0);
  for (int i=0; i<orbs.length; i++) {
    orbs[i].run();
  }
  theta += TWO_PI/frames;
  
  //if (frameCount<=frames && frameCount%2==0) saveFrame("image-###.gif");
  
}

class Orb {

  float x, y, sz;
  float px, py, offSet, radius;
  int dir, currentOrb;
  color col;

  Orb(float _x, float _y, float _sz) {
    x = _x;
    y = _y;
    sz = _sz;
    offSet = random(TWO_PI);
    radius = random(20, 150);
    dir=random(1)>.5?1:-1;
    col = palette[int(random(palette.length))];
  }

  void run() {
    update();
    showLines();
    display();
  }

  void update() {
    float vari = map(sin(theta),-1,1,1,2);
    //float vari = 1;
    px = x + cos(theta*dir+offSet)*radius*vari;
    py = y + sin(theta*dir+offSet)*radius*vari;
  }

  void showLines() {
    for (int i=0; i<orbs.length; i++) {
      currentOrb = i;
      float distance = dist(px, py, orbs[i].px, orbs[i].py);
      if (distance>0 && distance<100) {
        stroke(255, 50);
        line(px, py, orbs[i].px, orbs[i].py);
      }
    }
  }



  void display() {
    glowThing();
  }

  void glowThing() {
    noStroke();
    for (int i=0; i<7; i++) {
      col = 255;
      fill(col, 55+200.0/7*i);
      float scal = map(i, 0, 6, 1, .5)*sz;
      ellipse(px, py, scal, scal);
    }
  }
}


