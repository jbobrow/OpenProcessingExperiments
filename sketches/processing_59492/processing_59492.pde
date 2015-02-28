
Player Ball;
int steps;
float delta;
boolean MovingRight, MovingLeft, Jumping, Ground;
float damping = .6;
float JumpHeight = 7;
public BoxPlat[] Squares = new BoxPlat[2];
public CirclePlat[] Circles = new CirclePlat[5];
public float OffsetX;
public float OffsetY;
public float Skale;
int p = 0;
boolean forward = true;
float gravz = 0.1;
float spawn = 50;
float spawnacc = 0;
void setup() {
  size(500, 500);
  Skale = 1;
  //  smooth();
  strokeWeight(1);
  steps = 2;
  delta = 1/steps;
  Ball = new Player(150, 25, 12.5);
  Ground = false;
  Circles[2] = new CirclePlat(450, 425, 50);
  Circles[3] = new CirclePlat(480, 230, 20);
  Circles[0] = new CirclePlat(150, 250, 100);
  Circles[1] = new CirclePlat(200, height, 50);
  Circles[4] = new CirclePlat(350, height, 20);
}

void draw() {
  Ball.walk();
  if (spawnacc!=0) {
    background(158, 150, 100);
    for (int q=0; q<100;q++) {
      for (int i=0; i<steps; i++) {
        Ball.gravity();
        Ball.accelerate(delta);
        Ball.bordercollide();
        //      Squarecollide(Ball);
        Circlecollide(Ball);
        Ball.inertia(delta);
        Ball.bordercollide1();
        //      Squarecollide1(Ball);
        stroke(q);
        Ball.drawe();
        stroke(0);
      }
      OffsetX = width/2;
      OffsetY = height/2;
      //    for (BoxPlat Squ: Squares) {
      //      Squ.drawe();
      //    }
      for (CirclePlat Cir: Circles) {
        Cir.drawe();
      }

      line(OffX(0), OffY(0), OffX(0), OffY(height));
      line(OffX(0), OffY(0), OffX(width), OffY(0));
      line(OffX(width), OffY(0), OffX(width), OffY(height));
      line(OffX(0), OffY(height), OffX(width), OffY(height));
    }
    Ball.x2 = spawn;
    Ball.px2 = spawn;
    Ball.y2 = 25;
    Ball.py2 = 25;
  }
}

void keyPressed() {  
  if ((key == 'a')||(key == 'A')) {  
    MovingLeft = true;
  }  
  if ((key == 'd')||(key == 'D')) {  
    MovingRight = true;
  }  
  if (((key == 'w')||(key == 'W'))&&(Ground)) { 
    Jumping = true;
    Ground = false;
  }
}  

void keyReleased() {  
  if ((key == 'a')||(key == 'A')) {
    MovingLeft = false;
  }  
  if ((key == 'd')||(key == 'd')) {
    MovingRight = false;
  }
}

float OffX(float x) {
  return (((x)*Skale)-(OffsetX)+width/2);
}
float OffY(float y) {
  return (((y)*Skale)-(OffsetY)+height/2);
}
class BoxPlat {
  int x, y, Dimensions;
  BoxPlat(int x1, int y1, int Dimensions1) {
    x = x1;
    y = y1;
    Dimensions = Dimensions1;
  }
  void drawe() {
    rect(OffX(x-Dimensions), OffY(y-Dimensions), (Dimensions*2)*(Skale), (Dimensions*2)*(Skale));
  }
}

void Squarecollide(Player ball) {
  for (BoxPlat Squ: Squares) {
    // On Floor/Ceiling Axis
    if ((Squ.x-Squ.Dimensions < ball.x2)&&(ball.x2 < Squ.x+Squ.Dimensions)) {
      //On Top
      if ((Squ.y-Squ.Dimensions)<(ball.y2+ball.r2)&&(Squ.y)>(ball.y2-ball.r2)) {
        ball.y2 = Squ.y-Squ.Dimensions - ball.r2;
        Ground = true;
      }
      //Touching Bottom
      if ((Squ.y)<(ball.y2+ball.r2)&&(Squ.y+Squ.Dimensions)>(ball.y2-ball.r2)) {
        ball.y2 = Squ.y+Squ.Dimensions+ball.r2;
      }
    }

    // On Sides Axis
    if ((Squ.y-Squ.Dimensions < ball.y2)&&(ball.y2 < Squ.y+Squ.Dimensions)) {
      //On Top
      if ((Squ.x-Squ.Dimensions)<(ball.x2+ball.r2)&&(Squ.x)>(ball.x2-ball.r2)) {
        ball.x2 = Squ.x-Squ.Dimensions - ball.r2;
        Ground = true;
      }
      //Touching Bottom
      if ((Squ.x)<(ball.x2+ball.r2)&&(Squ.x+Squ.Dimensions)>(ball.x2-ball.r2)) {
        ball.x2 = Squ.x+Squ.Dimensions+ball.r2;
      }
    }
  }
}


void Squarecollide1(Player ball) {
  for (BoxPlat Squ: Squares) {
    // On Floor/Ceiling Axis
    if ((Squ.x-Squ.Dimensions < ball.x2)&&(ball.x2 < Squ.x+Squ.Dimensions)) {
      //On Top
      if ((Squ.y-Squ.Dimensions)<(ball.y2+ball.r2)&&(Squ.y)>(ball.y2-ball.r2)) {
        float vy = (ball.py2 - ball.y2)*damping;
        ball.y2 = Squ.y-Squ.Dimensions - ball.r2;
        ball.py2 = ball.y2 - vy;
        Ground = true;
      }
      //Touching Bottom
      if ((Squ.y)<(ball.y2+ball.r2)&&(Squ.y+Squ.Dimensions)>(ball.y2-ball.r2)) {
        float vy = (ball.py2 - ball.y2)*damping;
        ball.y2 = Squ.y+Squ.Dimensions+ball.r2;
        ball.py2 = ball.y2 - vy;
      }
    }

    // On Sides Axis
    if ((Squ.y-Squ.Dimensions < ball.y2)&&(ball.y2 < Squ.y+Squ.Dimensions)) {
      //On Top
      if ((Squ.x-Squ.Dimensions)<(ball.x2+ball.r2)&&(Squ.x)>(ball.x2-ball.r2)) {
        float vx = (ball.px2 - ball.x2)*damping;
        ball.x2 = Squ.x-Squ.Dimensions - ball.r2;
        ball.px2 = ball.x2 - vx;
        Ground = true;
      }
      //Touching Bottom
      if ((Squ.x)<(ball.x2+ball.r2)&&(Squ.x+Squ.Dimensions)>(ball.x2-ball.r2)) {
        float vx = (ball.px2 - ball.x2)*damping;
        ball.x2 = Squ.x+Squ.Dimensions+ball.r2;
        ball.px2 = ball.x2 - vx;
      }
    }
  }
}

class CirclePlat {
  int x, y, Rad;
  CirclePlat(int x1, int y1, int Rad1) {
    x = x1;
    y = y1;
    Rad = Rad1;
  }
  void drawe () {
    ellipse(OffX(x), OffY(y), (Rad*2)*(Skale), (Rad*2)*(Skale));
  }
}

void Circlecollide(Player ball) {
  for (CirclePlat Circ: Circles) {
    double x = Circ.x - ball.x2;
    double y = Circ.y - ball.y2;
    double slength = x*x+y*y;
    double rlength = Math.sqrt(slength);
    double target = Circ.Rad + ball.r2;

    // if the spheres are closer
    // then their radii combined
    if (rlength < target) { 
      double factor = (rlength-target)/rlength;
      // move the spheres away from each other
      // by half the conflicting length
      ball.x2 += x*factor;
      ball.y2 += y*factor;
      Ground = true;
    }
  }
}

class Player {
  float x2;
  float y2;
  float px2;
  float py2;
  float ax2;
  float ay2;
  float r2;
  Player(float x1, float y1, float r1) {
    x2 = x1;
    y2 = y1;
    px2 = x1;
    py2 = y1;
    ax2 = 0;
    ay2 = 0;
    r2 = r1;
  }
  void accelerate (float delta) {
    x2 += ax2 * delta * delta;
    y2 += ay2 * delta * delta;
    ax2 = 0;
    ay2 = 0;
  }
  void inertia (float delta) {

    float x = x2*2 - px2;
    float y = y2*2 - py2;
    px2 = x2;
    py2 = y2;
    x2 = x;
    y2 = y;
  }
  void drawe () {
    //   ellipse(OffX(x2), OffY(y2), (r2*2)*(Skale), (r2*2)*(Skale));
    strokeWeight(25);
    line(x2, y2, px2, py2);
    strokeWeight(1);
  }
  void gravity() {
    y2 = y2+gravz;
  }
  void bordercollide() {
    Ground = false;
    if ((r2+y2) > height) {
      y2 = height -r2;
      Ground = true;
      //px2 = (x2+px2)/2;
    }
    if ((y2-r2) < 0) {
      y2 = r2;
    }
    if ((x2+r2) > width) {
      x2 = width-r2;
    }
    if ((x2-r2) < 0) {
      x2 = r2;
    }
  }
  void bordercollide1() {
    if ((r2+y2) > height) {
      float vy = (py2 - y2)*damping;
      y2 = height-r2;
      py2 = y2 - vy;
      Ground = true;
    }
    if ((x2+r2) > width) {
      float vx = (px2 - x2)*damping;
      x2 = width-r2;
      px2 = x2 - vx;
    }
    if ((x2-r2) < 0) {
      float vx = (px2 - x2)*damping;
      x2 = r2;
      px2 = x2 - vx;
    }
  }
  void walk() {
    if ((spawnacc<.04)&&(spawnacc>-.04)) {
      spawnacc =0;
    }
    if (MovingLeft) {
      spawnacc=spawnacc-.5;
    }
    if (MovingRight) {
      spawnacc=spawnacc+.5;
    }
    if ((spawn<(width-25))&&(spawn>25)) {
      spawn = spawn+spawnacc;
    }
    else {
      spawn = width/2;
      spawnacc = 0;
    }
    spawnacc = spawnacc/1.2;
    if ((Jumping)&&(Ground)) {
      y2=y2-JumpHeight;
      Ground = false;
      Jumping = false;
    }
    if (Ground) {
      ax2 = ax2/2;
    }
  }
}


