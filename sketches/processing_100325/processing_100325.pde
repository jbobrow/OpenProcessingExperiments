
int winsizex = 400;
int winsizey = 400;
float midx = winsizex/2;
float midy = winsizey/2;
float transxpos = 0;
float transypos = 0;
int ballFollow = -1;
int ballhit = 0;
int ballNum = 8;
float spring = 0.05;
float collisions = 1;
circle[] circles = new circle[ballNum];
diamond polygon1;


void setup() {
  
  size(winsizex, winsizey);
  smooth();
  frameRate(400);
  background(255);
  polygon1 = new diamond();
  for (int i = 0; i < ballNum; i++){
    circles[i] = new circle(color(random(0,255),random(0,255),random(0,255)), random(12.5, 50),random(25,175), random(25,175), random(-.3,.3), random(-.3,.3), i, circles);
}
}

void draw() {
  
  pushMatrix();
  cam();
  translate(transxpos, transypos);
  polygon1.display(); 
  for (int i = 0; i < ballNum; i++){
    circles[i].display();
    circles[i].collision();
  }
  
  popMatrix();
}
void cam() {
  if( ballFollow == -1){
 
  transxpos=0;
  transypos=0;
  return;
}
  else {
    transxpos =-1*(circles[ballFollow].xps-midx);
    transypos =-1.*(circles[ballFollow].yps-midx);
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
  circle[] others;
  float hit;

  circle(color clr, float size, float xposition, float yposition, float xspeed, float yspeed, int idin, circle[] oin) {
    c = clr;
    sz = size/200*winsizey;
    xps = xposition/200*winsizey;
    yps = yposition/200*winsizey;
    xsp = xspeed/200*winsizey;
    ysp = yspeed/200*winsizey;
    ball = idin;
    others = oin;
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
if (ballhit == 1) {
for (int i = ball; i < ballNum; i++) {
      float dx = mouseX - xps;
      float dy = mouseY - yps;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = hit;
      if (distance < minDist) {
        float angle = atan2(dy, dx);
        float targetx = xps + cos(angle) * minDist;
        float targety = yps + sin(angle) * minDist;
        float ax = (targetx - mouseX) * spring;
        float ay = (targety - mouseY) * spring;
        xsp -= ax;
        ysp -= ay;
        //others[i].xsp += ax;
        //others[i].ysp += ay;
      }
}

if (xsp > .8){
  xsp = .8;
}
if (xsp < -.8){
  xsp = -.8;
}
if (ysp > .8){
  ysp = .8;
}
if (ysp < -.8){
  ysp = -.8;
}

}


    
  }
  
  void collision() {
    if (ballhit == 1){
    for (int i = ball + 1; i < ballNum; i++) {
      float dx = others[i].xps - xps;
      float dy = others[i].yps - yps;
      float distance = sqrt(dx*dx + dy*dy);
      float minDist = others[i].hit + hit;
      if (distance < minDist) {
        float angle = atan2(dy, dx);
        float targetx = xps + cos(angle) * minDist;
        float targety = yps + sin(angle) * minDist;
        float ax = (targetx - others[i].xps) * spring;
        float ay = (targety - others[i].yps) * spring;
        xsp -= ax;
        ysp -= ay;
        others[i].xsp += ax;
        others[i].ysp += ay;
        collisions += .5;
      }
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
  int transtemp;
  float transparency;

  diamond() {
    shapesz = winsizey / 3;
    sides = 4;
    wgt=10;
    weight = wgt/200*winsizey;
    transtemp = 255;
    
  }


  void display() {
    pushMatrix();
    background(255);
    translate(midx, midy);
    noFill();
    transparency = transtemp-collisions;
    stroke(255, 0, 0, transparency);
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
  if (key == 'r'|| key == 'R') {
    if (ballFollow < ballNum - 1)
    ballFollow++;
  }

  if (key == 'f'|| key == 'F') {
    if (ballFollow > 0){
    ballFollow--;
  }
  }
  
  if (key == '0') {
    ballFollow=-1;
  }
  if ( key == 'e'|| key == 'E'){
    collisions = 1;
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

