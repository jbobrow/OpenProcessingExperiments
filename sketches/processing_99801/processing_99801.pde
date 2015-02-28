
int winsizex = 200;
int winsizey = 200;
float midx = winsizex/2;
float midy = winsizey/2;
float transxpos = 0;
float transypos = 0;
int ballFollow = 0;
int ballhit = 0;

diamond polygon1;
circle circle1;
circle circle2;
circle circle3;


void setup() {
  
  smooth();
  frameRate(400);
  background(255); 
  size(winsizex, winsizey);
  polygon1 = new diamond();
  circle1 = new circle(color(255, 0, 125), 25, 50, 50, .2, -.1);
  circle2 = new circle(color(0, 125, 255), 12.5, 180, 100, -.1, .1);
  circle3 = new circle(color(255, 125, 0), 50, 100, 150, -.1, -.1);
  
}

void draw() {
  
  pushMatrix();
  cam();
  translate(transxpos, transypos);
  polygon1.display(); 
  circle3.display();
  circle1.display();
  circle2.display();
  popMatrix();
}
void cam() {
  if( ballFollow == 0){
 
  transxpos=0;
  transypos=0;
  return;
}
  
if(ballFollow ==1){
  transxpos=-1*(circle1.xps-midx);
  transypos=-1*(circle1.yps-midy);
  return;
}

if(ballFollow ==2){
  transxpos=-1*(circle2.xps-midx);
  transypos=-1*(circle2.yps-midy);
  return;
}

if(ballFollow ==3){
  transxpos=-1*(circle3.xps-midx);
  transypos=-1*(circle3.yps-midy);
  return;
}
  
}
class circle {
  color c;
  float sz;
  float xps;
  float yps;
  float xsp;
  float ysp;
  int ball;
  float hit;

  circle(color clr, float size, float xposition, float yposition, float xspeed, float yspeed) {
    c = clr;
    sz = size/200*winsizey;
    xps = xposition/200*winsizey;
    yps = yposition/200*winsizey;
    xsp = xspeed/200*winsizey;
    ysp = yspeed/200*winsizey;
    ball = 0;
    hit = sz/2;
  }

  void display() {
    stroke(0,0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xps, yps, sz, sz);
    
    move();
   
  }
  void move() {

    if (yps > winsizey - hit||yps < 0 + hit) {
      ysp=ysp*-1;
    }
    if (xps > winsizex - hit||xps < 0 + hit) {
      xsp=xsp*-1;
    }
    xps=xps+xsp;
    yps=yps+ysp;


if (ballhit == 1){
    if (circle2.xps-circle2.hit <= circle1.xps+circle1.hit &&
      circle2.xps+circle2.hit >= circle1.xps-circle1.hit &&
      circle2.yps+circle2.hit >= circle1.yps-circle1.hit &&
       circle2.yps-circle2.hit <= circle1.yps+circle1.hit) {
            circle1.ysp=circle1.ysp*-1;
            circle1.xsp=circle1.xsp*-1;
            circle2.ysp=circle2.ysp*-1;
            circle2.xsp=circle2.xsp*-1;
          }
        
    if (circle3.xps-circle3.hit <= circle1.xps+circle1.hit &&
      circle3.xps+circle3.hit >= circle1.xps-circle1.hit &&
      circle3.yps+circle3.hit >= circle1.yps-circle1.hit &&
       circle3.yps-circle3.hit <= circle1.yps+circle1.hit) {
            circle1.ysp=circle1.ysp*-1;
            circle1.xsp=circle1.xsp*-1;
            circle3.ysp=circle3.ysp*-1;
            circle3.xsp=circle3.xsp*-1;
          }      
          
if (circle2.xps-circle2.hit <= circle3.xps+circle3.hit &&
      circle2.xps+circle2.hit >= circle3.xps-circle3.hit &&
      circle2.yps+circle2.hit >= circle3.yps-circle3.hit &&
       circle2.yps-circle2.hit <= circle3.yps+circle3.hit) {
            circle3.ysp=circle3.ysp*-1;
            circle3.xsp=circle3.xsp*-1;
            circle2.ysp=circle2.ysp*-1;
            circle2.xsp=circle2.xsp*-1;
          }    
}

    if (xps-hit < mouseX &&
      xps+hit > mouseX && 
      yps+hit > mouseY &&
      yps-hit < mouseY) {
      ysp=ysp*-1;
      xsp=xsp*-1;
      if (mousePressed) {
        xps=mouseX;
        yps=mouseY;
      }
    }
  }
}

class diamond {
  float shapesz;
  float rotation;
  int sides;
  float wgt;
  float weight;

  diamond() {
    shapesz = winsizey / 3;
    sides = 4;
    wgt=10;
    weight = wgt/200*winsizey;
  }


  void display() {
    pushMatrix();
    background(255);
    translate(midx, midy);
    noFill();
    stroke(255, 0, 0);
    strokeWeight(weight);
    polygon(sides, 0, 0, shapesz, rotation);
    popMatrix();
  }
}

void RotateRight() {
  polygon1.rotation=polygon1.rotation+.5;
}

void RotateLeft() {
  polygon1.rotation=polygon1.rotation-.5;
}

void keyPressed() {
  if (key == 'd'||key =='D') {
    RotateRight();
  }

  if (key == 'a'||key == 'A') {
    RotateLeft();
  }


  if (key == 'w'||key == 'W') {
    if (polygon1.sides<21) {
      polygon1.sides++;
    }
  }
  if (key == 's'||key == 'S') {
    if (polygon1.sides>3)
      polygon1.sides--;
  }
  if (key == '1') {
    ballFollow=1;
  }
  if (key == '2') {
    ballFollow=2;
  }
  if (key == '3') {
    ballFollow=3;
  }
  if (key == '0') {
    ballFollow=0;
  }

  if (key == 'q'|| key == 'Q') {
    if (ballhit == 0) {
      ballhit = 1;
      }
    else { 
      ballhit = 0;
    }
  }
}



void polygon(int n, float cx, float cy, float r, float rot) {
  {
    float angle = 360.0/n;

    beginShape();
    for (int i = 0; i < n; i++)
    {

      rotate(radians(rot));

      vertex(cx + r * cos(radians(angle * i)), 
      cy + r * sin(radians(angle * i)));
    }
    endShape(CLOSE);
  }
}
