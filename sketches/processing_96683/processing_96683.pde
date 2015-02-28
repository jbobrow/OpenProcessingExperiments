
Bpoint[] bpoints;
int numBpoint = 600; 
int drawBpoint = 0;

void setup() {
  size(600, 600);
  frameRate(50);
  bpoints = new Bpoint[numBpoint];
  for (int i=0; i<numBpoint; i++) {
    bpoints[i] = new Bpoint();
  }
}
void mouseDragged() {
  if (drawBpoint<numBpoint) {
    bpoints[drawBpoint].x = mouseX;
    bpoints[drawBpoint].y = mouseY;
    drawBpoint++;
  }
  else {
    drawBpoint = 0;
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    drawBpoint = 0;
  }
}

void draw() {
  background(255);
  float degree = radians((mouseX+mouseY)*0.5);
  for (int i=0; i<drawBpoint; i++) {
    bpoints[i].size = (i)%20* 0.03;
    // bpoints[i].angle = random(PI/9, PI/5);
    bpoints[i].angle = degree;
    if (bpoints[i].life>0) {
      bpoints[i].life = bpoints[i].life-5;
    }
    else {
      bpoints[i].life =numBpoint;
    }
    // bpoints[i].move();
    bpoints[i].display();
  }
}
class Bpoint {
  float x;
  float y;
  float size=1;
  float angle;
  int life=numBpoint/2;


  Bpoint( ) {
  }

  void display() {

    pushMatrix();
    strokeWeight(10);

    translate(x, y);
    rotate(angle);
    scale(size);
    //light lines
    stroke(200, x/2, y/2, life);
    point(0, -40);
    point(40, 0);
    point(0, 40);
    point(-40, 0);

    point(20*sqrt(2), -20*sqrt(2));
    point(20*sqrt(2), 20*sqrt(2));
    point(-20*sqrt(2), 20*sqrt(2));
    point(-20*sqrt(2), -20*sqrt(2));

    point(0, 0);

    //face
    //noFill();
    //ellipse(0, 0, 50, 50);
    // point(-10, -5);
    //point(10, -5);
    // strokeWeight(4);
    //arc(0, 0, 20, 20, 1, PI-1);
    popMatrix();
  }
  void move() {
    x = x+ random(-1, 1);
    y = y+ random(-1, 1);
  }
}



