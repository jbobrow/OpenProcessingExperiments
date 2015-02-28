
color white = color(255, 255, 255);
color black = color(0, 0, 0);
color grey = color(50, 50, 50);
color offWhite = color(230, 230, 221);
color blue = color(7, 90, 170);  
color lightBlue = color(100, 160, 170);
color red = color(250, 100, 50);
color green = color(106, 163, 62);
color yellow = color(250, 250, 80);

PFont font1;

boolean showData = true;


Ship ship;
Planet planet;
ArrayList<En1> en1List = new ArrayList<En1>();
int numEn1 = 5;

void setup() {
  size(1000, 700);
  smooth();

  font1 = loadFont("CalvertMT.vlw");

  ship = new Ship();
  planet = new Planet();

  for (int i = 0; i <= numEn1; i++) {
    en1List.add(new En1());
  }
}



void draw() {
  // draw background /////////////////////////////////////////////////
  for (int i = 0; i < height; i++) {
    float inter = map(i, 0, height, 0, 0.5);
    color c = lerpColor(black, blue, inter);
    stroke(c);
    line(0, i, width, i);
  }
  /////////////////////////////////////////////////////////////////////  

  pushMatrix();
  translate(width/2 - ship.x, height/2 - ship.y);

  // draw ship ////////////////////////////////////////////////////////
  ship.update();
  ship.draw();
  /////////////////////////////////////////////////////////////////////

  // draw planet ////////////////////////////////////////////////////////
  planet.update();
  planet.draw();
  /////////////////////////////////////////////////////////////////////

  // draw en1 ////////////////////////////////////////////////////////
  for (int i = en1List.size()-1; i >=0; i--) {
    en1List.get(i).update();
    en1List.get(i).draw();
  }
  /////////////////////////////////////////////////////////////////////
  popMatrix();
}


class En1 {

  float x, y, th;
  float velX, velY;

  float thrustSpeed = random(1, 3);

  boolean rotateLeft = false;
  boolean rotateRight = false;
  float rotationSpeed = random(10, 80);


  En1() {
    x = random(width);
    y = random(height);
    th = HALF_PI;
  }

  void update() {

    // apply thrust ///////////////////////////////////////////////////////
    velX = sin(th)*(thrustSpeed);
    velY = -cos(th)*(thrustSpeed);
    /////////////////////////////////////////////////////////////////////

    // rotate ///////////////////////////////////////////////////////////
    th += (atan2(ship.y-y, ship.x-x)+HALF_PI - th)/rotationSpeed;
    /////////////////////////////////////////////////////////////////////

    // update pos ////////////////////////////////////////////////////////
    x += velX;
    y += velY;
    /////////////////////////////////////////////////////////////////////
  }

  void draw() {


    // draw text ////////////////////////////////////////////////////////
//    textFont(font1, 9);
//    fill(offWhite, 150);
//    text("X: " + x, x+13, y+12);
//    text("Y: " + y, x+13, y+22);
//    // text(th+"Â°", x+13, y+32);
//    text("Vel: " + (velX*velX)+(velY*velY), x+13, y+42);
    /////////////////////////////////////////////////////////////////////

    // draw ship ////////////////////////////////////////////////////////
    pushMatrix();
    translate(x, y);
    rotate(th);

    // draw circle ////////////////////////////////////////////////////////
    noFill();
    stroke(red, 150);
    strokeWeight(3);
    strokeCap(SQUARE);
    arc(0, 0, 30, 30, PI+QUARTER_PI, HALF_PI+TWO_PI+QUARTER_PI);
    /////////////////////////////////////////////////////////////////////

    stroke(red, 150);
    strokeWeight(5);
    line(0, -12, 0, 0);
    stroke(white, 150);
    strokeWeight(1);
    line(2, -35, 2, 0);

    fill(red);
    stroke(red);
    ellipse(0, 0, 15, 15);
    //    triangle(0, -12, 8, 8, 0, 2);
    //    triangle(0, -12, -8, 8, 0, 2); 

    popMatrix();
    /////////////////////////////////////////////////////////////////////
  }
}



void keyPressed() {
  if (key == 'w') {
    ship.thrusting = true;
    ship.ringR = 100;
    ship.ringCounter = (ship.ringR/3);
    ship.ringX = ship.x;
    ship.ringY = ship.y + 10;
    ship.ringTh = ship.th;
  }
  if (key == 'a') {
    ship.rotateLeft = true;
  }
  if (key == 'd') {
    ship.rotateRight = true;
  }
  if (key == ' ') {
    ship.firing = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    ship.thrusting = false;
    ship.thLast = ship.th;
    ship.restCounter = 0;
  }
  if (key == 'a') {
    ship.rotateLeft = false;
  }
  if (key == 'd') {
    ship.rotateRight = false;
  }
  if (key == ' ') {
    ship.firing = false;
    ship.fireCounter = ship.fireRate;
  }
}


class Planet {

  float x, y, r;


  Planet() {
    r = 1000;
    x = width/2;
    y = height/2 + r*1.3;
  }

  void update() {
  }

  void draw() {

    noStroke();
    fill(offWhite, 220);
    ellipse(x, y, r*2, r*2);
    
    stroke(white);
    fill(offWhite, 120);
    ellipse(x, y, r*2.2, r*2.2);
  }
}


class Ship {

  float x, y, th, thLast;
  float velX, velY;

  boolean thrusting = false;
  float thrustSpeed = 6;

  float restCounter = 0;
  float restSpeed = 0.1;

  boolean rotateLeft = false;
  boolean rotateRight = false;
  float rotationSpeed = PI/30;

  boolean firing = false;
  ArrayList<Bullet> bulletList = new ArrayList<Bullet>();
  int fireRate = 8;
  int fireCounter = fireRate;

  ArrayList<TrailSegment> trailList = new ArrayList<TrailSegment>();

  float ringX, ringY, ringTh;
  float ringR = 100;
  float ringCounter = 0;


  Ship() {
    x = width/2;
    y = height/2;
    th = 0;
  }

  void update() {

    // rotate ///////////////////////////////////////////////////////////
    if (rotateLeft) {
      if (thrusting) {
        th -= rotationSpeed/3;
      }
      else {
        th -= rotationSpeed;
      }
    }
    if (rotateRight) {
      if (thrusting) {
        th += rotationSpeed/3;
      }
      else {
        th += rotationSpeed;
      }
    }
    /////////////////////////////////////////////////////////////////////

    // apply thrust ///////////////////////////////////////////////////////
    if (thrusting) {
      velX = sin(th)*(thrustSpeed);
      velY = -cos(th)*(thrustSpeed);
    }
    else {
      if (restCounter < thrustSpeed-restSpeed) {
        restCounter += ((thrustSpeed-restSpeed)-restCounter)/1000;
      }
      velX = sin(thLast)*(thrustSpeed-restCounter);
      velY = -cos(thLast)*(thrustSpeed-restCounter);
    }
    /////////////////////////////////////////////////////////////////////

    // update pos ////////////////////////////////////////////////////////
    x += velX;
    y += velY;
    /////////////////////////////////////////////////////////////////////
  }

  void draw() {

    // draw bullets ////////////////////////////////////////////////////////
    if (firing) {
      if (fireCounter == fireRate) {
        bulletList.add(new Bullet(x, y, th));
        fireCounter = 0;
      }
      else {
        fireCounter++;
      }
    }
    for (int i = bulletList.size()-1; i >= 0; i--) {
      if (bulletList.get(i).x > ship.x + width 
        || bulletList.get(i).x < ship.x - width
        || bulletList.get(i).y > ship.y + height
        || bulletList.get(i).y < ship.y - height) {
        bulletList.remove(i);
      }
      else {
        bulletList.get(i).update();
        bulletList.get(i).draw();
      }
    }
    /////////////////////////////////////////////////////////////////////

    // draw ring ////////////////////////////////////////////////////////
//    if (ringCounter > 0 ) {
//      pushMatrix();
//      translate(ringX, ringY);
//      rotate(ringTh+PI);
//
//      for (int i = 0; i <= ringCounter; i++) {
//        noFill();
//        stroke(white, map(ringCounter, 0, (ringR/3)-10, 0, 255));
//        arc(0, (i/2), ringR-i, ringR/3-i, 
//        HALF_PI + map(ringR-i, 0, ringR*2, 0, HALF_PI), 
//        TWO_PI+HALF_PI - map(ringR-i, 0, ringR*2, 0, HALF_PI));
//      }
//      ringCounter -= 0.3;
//      ringR+=ringCounter/5;
//
//      popMatrix();
//    }
    /////////////////////////////////////////////////////////////////////

    // draw trail ////////////////////////////////////////////////////////
    if (ringCounter >= 0 && frameCount%8 == 0 && thrusting) {
      for (int i = 0; i < (int)ringCounter/5; i++) {
        trailList.add(new TrailSegment(x+random(-20, 20), y+random(-10, 10), th));
      }
    }
    if (thrusting && frameCount%5 == 0) {
      trailList.add(new TrailSegment(x+random(-5, 5), y+random(-10, 10), th));
    }
    for (int i = trailList.size()-1; i >= 0; i--) {
      if (trailList.get(i).counter == 0) {
        trailList.remove(i);
      }
      else {
        trailList.get(i).update();
        trailList.get(i).draw();
      }
    }
    /////////////////////////////////////////////////////////////////////

    if (showData) {
      // draw circle ////////////////////////////////////////////////////////
      noFill();
      stroke(offWhite, 150);
      strokeWeight(3);
      strokeCap(SQUARE);
      arc(x, y, 30, 30, HALF_PI, TWO_PI);
      /////////////////////////////////////////////////////////////////////

      // draw text ////////////////////////////////////////////////////////
      textFont(font1, 9);
      fill(offWhite, 150);
      text("X: " + x, x+13, y+12);
      text("Y: " + y, x+13, y+22);
      text(bulletList.size(), x+13, y+32);
      /////////////////////////////////////////////////////////////////////
    }

    // draw ship ////////////////////////////////////////////////////////
    pushMatrix();
    translate(x, y);
    rotate(th);

    stroke(offWhite, 150);
    strokeWeight(2);
    line(0, -30, 0, 15);

    fill(red);
    noStroke();
    triangle(0, -12, 8, 8, 0, 2);
    triangle(0, -12, -8, 8, 0, 2); 

    if (thrusting) {
      // draw thrust ////////////////////////////////////////////////////////
      noStroke();
      fill(yellow, 150);
      ellipse(0, 15, 12, 12);


        stroke(yellow);
        strokeWeight(2);
        float n = ringCounter/3;
        line(0, 9, random(-15-n, 15+n), random(15+n, 25+n));
        line(0, 9, random(-13-n, 13+n), random(30-n, 40+n));
        line(0, 9, random(-10-n, 10+n), random(45-n, 50-n));
        line(0, 9, random(-4-n, 4+n), random(50-n, 60-n));
        stroke(white);
        line(0, 9, random(-5-n, 5+n), random(20-n, 30-n));
        line(0, 9, random(-2-n, 2+n), random(35-n, 40-n));
      
      /////////////////////////////////////////////////////////////////////
    }

    popMatrix();
    /////////////////////////////////////////////////////////////////////
  }







  class Bullet {

    float x, y, th;
    float l = 40;
    float vel = 12;

    Bullet(float x, float y, float th) {
      this.x = x;
      this.y = y;
      this.th = th;
    }

    void update() {
      x = x+(sin(th)*vel);
      y = y-(cos(th)*vel);
    }

    void draw() {

      strokeWeight(3);
      stroke(white);
      line(x, y, x+(sin(th)*l), y-(cos(th)*l));
    }
  }


  class TrailSegment {

    float x, y, r, th;
    float op;
    float counter;

    TrailSegment(float x, float y, float th) {
      this.x = x;
      this.y = y;
      this.th = random(0, TWO_PI);
      this.r = random(3, 5);
      this.counter = 100;
      this.op = map(ship.ringCounter, (100/3)-10, 0, 200, 2);
    }

    void update() {
    }

    void draw() {
      noStroke();
      fill(offWhite, map(counter, 0, 80, 0, 50));
      ellipse(x, y, r, r);
      r+=0.4;
      counter -= 0.5;
    }
  }
}



