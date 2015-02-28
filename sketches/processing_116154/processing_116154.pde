
//repulsionforce taken from golan
PImage webImg;

Tit tit1;
Tit tit2;
ArrayList<Moth> myMoth;
float treeShade = 230;
int numMoth = 100;
int simulationSpeed = 1;
int mothEaten = 0;
int generation;

void setup() {
  size (600, 1000);
  String url = "http://i.imgur.com/B97A6fW.png";
  webImg = loadImage(url, "jpg");
  myMoth = new ArrayList<Moth>();
  tit1 = new Tit(width, 675, true);
  tit2 = new Tit(0, 200, false);

  //breed moths
  for (int i = 0; i<numMoth; i++) {
    float mothShade = random(210, 256);
    float rx = random(200, 400);
    float ry = random(0, height);
    myMoth.add( new Moth(rx, ry, mothShade));
  }
}

void tree() {
  fill(treeShade);
  beginShape();
  vertex(180, 0);
  bezierVertex(200, 330, 200, 660, 170, height);
  vertex(420, height);
  bezierVertex(400, 660, 400, 500, width, 300);
  vertex(width, 250);
  bezierVertex(450, 400, 400, 400, 420, 0);
  endShape();
} 

void speedAdjust() {
  fill(255);
  stroke(0);
  rect(10, 25, 150, 120);
  rect(20, 50, 130, 20);
  float barP = map(simulationSpeed, 1, 50, 21, 149);
  strokeWeight(2);
  line(barP, 50, barP, 69);
  if (mouseX > 20 && mouseX < 150 && mouseY > 50 && mouseY < 70 && mousePressed) {
    simulationSpeed = (int)map(mouseX, 21, 149, 1, 50);
  }
}

void treeAdjust() {
  stroke(0);
  rect(20, 100, 130, 20);
  float barP = map(treeShade, 0, 255, 21, 149);
  line(barP, 100, barP, 119);
  if (mouseX > 20 && mouseX < 150 && mouseY > 90 && mouseY < 130 && mousePressed) {
    treeShade = (int)map(mouseX, 21, 149, 0, 255);
  }
}

void draw() {

  image(webImg, 0, 0);
  tree();

  float mutualRepulsionAmount = 1.0;
  int prevMothEaten = mothEaten;

  //draw moths
  for (int i = 0; i<numMoth; i++) {
    Moth ithMoth = myMoth.get(i);
    float px = ithMoth.px;
    float py = ithMoth.py;

    //mutual repulsion
    for (int j=0; j<i; j++) {
      Moth jthMoth = myMoth.get(j);
      float qx = jthMoth.px;
      float qy = jthMoth.py;

      float dx = px - qx;
      float dy = py - qy;
      float dh = sqrt(dx*dx + dy*dy);
      if (dh > 1.0) {

        float componentInX = dx/dh;
        float componentInY = dy/dh;
        float proportionToDistanceSquared = 1.0/(dh*dh);

        float repulsionForcex = mutualRepulsionAmount * componentInX * proportionToDistanceSquared;
        float repulsionForcey = mutualRepulsionAmount * componentInY * proportionToDistanceSquared;

        ithMoth.addForce( repulsionForcex, repulsionForcey); // add in forces
        jthMoth.addForce(-repulsionForcex, -repulsionForcey); // add in forces
      }
    }

    ithMoth.update();
    ithMoth.render();
  }

  for (int iter = 0; iter < simulationSpeed; iter++) {
    tit1.target(tit1.mark);
    tit1.update();
    tit2.target(tit2.mark);
    tit2.update();
  }
  tit1.render();
  tit2.render();
  if (prevMothEaten != mothEaten && mothEaten % 100 == 0) generation++;
  fill(255);
  stroke(0);
  rect(430, 30, 140, 30);
  fill(0);
  text("Generation:", 450, 50);
  text(generation, 530, 50);
  speedAdjust();
  treeAdjust();
}

//=======================================================

class Moth {
  float px;
  float py;
  float vx;
  float vy;
  float mothShade;

  //moth constructor
  Moth(float x, float y, float shade) {
    px = x;
    py = y;
    mothShade = shade;
  }

  //first step Euler int.
  void addForce (float fx, float fy) {
    float ax = fx;
    float ay = fy;
    vx += ax;
    vy += ay;
  }

  void update() {
    limitVelocities();
    handleBoundaries();
    px += vx;
    py += vy;
  }

  void limitVelocities() {
    float speed = sqrt(vx*vx + vy*vy);
    float maxSpeed = 1;
    if (speed > maxSpeed) {
      vx *= maxSpeed/speed;
      vy *= maxSpeed/speed;
    }
  }

  void handleBoundaries() {
    if (px > 400) vx = -vx;
    if (px < 200) vx = -vx;
    if (py > height) vy = -vy;
    if (py < 0) addForce(0, 0.1);
  }

  void render() {
    fill(mothShade);
    stroke(abs(255-mothShade));
    ellipse(px, py, 7, 7);
  }
}

//=======================================================

class Tit {
  float ox;
  float oy;
  float px;
  float py;
  float vx;
  float vy;
  float ax;
  float ay;
  float hunger = 0;
  boolean pecking;
  int mark = (int)random(1, numMoth);
  float targetx;
  float targety;
  float angle;
  boolean facingLeft;

  //tit constructor
  Tit(float x, float y, boolean facing) {
    px = x;
    py = y;
    //first original position
    ox = px;
    oy = py;
    facingLeft = facing;
  }

  void target(int i) {
    targetx = myMoth.get(i).px;
    targety = myMoth.get(i).py;
  }

  void peck() {
    //move towards mark
    if (pecking == true) {
      addForce (-(px-targetx)*0.001, -(py-targety)*0.001);

      //stop at mark
      float distance = sqrt((px - targetx)*(px - targetx) + (py - targety)*(py - targety));
      if (distance < 80 && hunger > 100) {
        replaceMoth(mark); 
        mothEaten ++; 

        //find new mark
        boolean newMarkChosen = false;
        while (newMarkChosen == false) {
          int newMark = (int)random(numMoth);
          float difference = abs(treeShade - myMoth.get(newMark).mothShade);
          float rand = random(255);
          //skewed probability to eat moths with shades different from tree
          //also only eat from its own half of the tree
          if ((rand < difference && facingLeft && myMoth.get(newMark).py > 500)
            || (rand < difference && facingLeft == false && myMoth.get(newMark).py < 500)) {
            mark = newMark;
            newMarkChosen = true;
          }
        }

        hunger = 0;
        vx = 0;
        vy = 0;
      }
    }

    //retreat back to origin
    if (hunger < 100) {
      addForce ((ox-targetx)*0.001, (oy-targety)*0.001);

      //stop near origin
      float distance = sqrt((px - ox)*(px - ox) + (py - oy)*(py - oy));
      if (distance < 100) {
        vx = 0;
        vy = 0;
      }
    }
  }

  //kill as well as replace
  void replaceMoth(int i) {
    //replace with same color as another moth in population w/ some mutation
    float newShade = myMoth.get((int)random(numMoth)).mothShade + random(-20, 20);
    if (newShade > 255) newShade = 255;
    if (newShade < 0) newShade = 0;
    myMoth.set(i, new Moth(random(200, 400), random(height), newShade));
  }

  void addForce (float fx, float fy) {
    float ax = fx;
    float ay = fy;
    vx += ax;
    vy += ay;
    limitVelocities();
  }

  void limitVelocities() {

    float speed = sqrt(vx*vx + vy*vy);
    float maxSpeed = 8;
    if (speed > maxSpeed) {
      vx *= maxSpeed/speed;
      vy *= maxSpeed/speed;
    }
  }

  void update() {
    hunger ++;
    if (hunger > 100) pecking = true;
    peck();
    px += vx;
    py += vy;
  }

  void track() {
    float deltaY = py - targety;
    float deltaX = px - targetx;
    float targetAngle = atan(deltaY / deltaX);
    if (abs(targetAngle-angle) > 0.01) {
      //binary search-ish towards angle of target
      angle += (targetAngle-angle)/5;
    }
    rotate(angle);
  }

  void render() {
    stroke(123);
    fill(0);
    pushMatrix();
    translate(px, py);
    track();
    beginShape();
    vertex(0, -25);
    if (facingLeft) vertex(-80, 0);
    else vertex(80, 0);
    vertex(0, 25);
    endShape();
    popMatrix();
  }
}



