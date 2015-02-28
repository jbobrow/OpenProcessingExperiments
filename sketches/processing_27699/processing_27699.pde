
float gravity = 5.5;
float hrgravity = 5.5;
float mass = 15.0;
int numsprings = 1;
int curSecond;
int curHour;

ArrayList springs;
ArrayList springhours;

void setup() {
  size(640, 480);
  directionalLight(151, 102, 126, -1, 0, 0);
  translate(80, 50, 0);
  stroke(255);
  smooth();

  springs = new ArrayList();
  for (int i=0; i<numsprings; i++) {
    springs.add(new Spring2D(0, i*24, mass, gravity));
  }
  curSecond = second();

//  big hour circle
  springhours = new ArrayList();
  curHour = hour();
  for (int i=0; i<curHour; i++) {
    springhours.add(new Spring1D(0, i*48, mass, hrgravity));
  }

}


void draw() {

  background(1, 1, 62);
  noStroke();
  noCursor();

  Spring2D firstspring = (Spring2D) springs.get(0);
  firstspring.update(mouseX, mouseY);
  firstspring.display(mouseX, mouseY);

  
  // draw all clocks
  for (int i=1; i<springs.size(); i++) {
    Spring2D spring = (Spring2D) springs.get(i);
    Spring2D backspring = (Spring2D) springs.get(i-1);
    spring.update(backspring.x, backspring.y);
    spring.subDisplay(backspring.x, backspring.y);
  }

  if (second() > curSecond) {
    springs.add(new Spring2D(0, second()*24, mass, gravity));
    curSecond = second();
  }

  if (second() == 0) {
    curSecond = second();
  }
  



  
  


  // big hour circle
  Spring1D firstHRspring = (Spring1D) springhours.get(0);
  firstHRspring.update(mouseX, mouseY);
  firstHRspring.subDisplay(mouseX, mouseY);
  
    for (int i=1; i<springhours.size(); i++) {
    Spring1D springhour = (Spring1D) springhours.get(i);
    Spring1D backHRspring = (Spring1D) springhours.get(i-1);
    springhour.update(backHRspring.x, backHRspring.y);
    springhour.subDisplay(backHRspring.x, backHRspring.y);
  }

  if (hour() > curHour) {
    springhours.add(new Spring1D(0, hour()*48, mass, hrgravity));
    curHour = hour();
  }

  if (hour() == 0) {
    // clear all of springs
    curHour = hour();
  }
}


class Spring2D {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float gravity;
  float mass;
  float radius = 6;
  float stiffness = 0.3;
  float damping = 0.7;

  Spring2D(float xpos, float ypos, float m, float g) {
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
  }


  void update(float targetX, float targetY) {
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  }


  void display(float nx, float ny) {

    float s = second();
    float m = minute();
    float h = hour();

    if (h >12) {
      h = h - 12;
    }


    subDisplay(x,y);
    stroke(234,224,24,90);
    strokeWeight(3);
    pushMatrix();
    translate(x, y);

pushMatrix();
strokeWeight(2);
stroke(255, 248, 31, 100);
float mm = map(m, 0, 59, -HALF_PI, PI+HALF_PI);
rotate(mm);
line(0, 0, 40, 0);
popMatrix();

    popMatrix();
  }

  void subDisplay(float nx, float ny) {
    stroke(250,89, 8, 90);
    strokeWeight(1.5);
    fill(250,89,8,80);
    ellipse(x, y, radius*2, radius*2);
    ellipse(x, y, radius/3, radius/3);
  }
}



//big hour circle
class Spring1D {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float gravity;
  float mass;
  float radius = 6;
  float stiffness = 0.3;
  float damping = 0.7;

  Spring1D(float xpos, float ypos, float m, float g) {
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
  }
  
  void update(float targetX, float targetY) {
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  }


  void display(float nx, float ny) {

    float s = second();
    float m = minute();
    float h = hour();

    if (h >12) {
      h = h - 12;
    }

    subDisplay(x,y);
    stroke(234,224,24,90);
    strokeWeight(3);
    pushMatrix();
    translate(x, y);

pushMatrix();
strokeWeight(2);
stroke(255, 248, 31, 100);
float hh = map(h, 0, 59, -HALF_PI, PI+HALF_PI);
rotate(hh);
line(0, 0, 20, 0);
popMatrix();

    popMatrix();
  }

  void subDisplay(float nx, float ny) {
    stroke(250,89, 8, 90);
    strokeWeight(1.5);
    fill(255,255,255,80);
    ellipse(x, y, radius*3, radius*3);
    ellipse(x, y, radius/2, radius/2);
  }
}



