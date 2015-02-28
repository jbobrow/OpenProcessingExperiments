
ArrayList water;
PImage field;
PImage child;
PImage guy;
PImage penis;
Propeller myPropeller;
Propeller Propeller2;
public float childx = 570, childy = 330;
boolean jizz;
float ph = 100, pw = 100, px;
float cxspeed = -3, cyspeed = -3;
float xspeedrange = .25, yspeedrange =.25;
float guyx, guyy, guymovex = 0, guymovey = 0;

void setup() {
  size (1024, 720);
  frameRate(60);
  water = new ArrayList();
  field = loadImage("background.png");
  child = loadImage("kid.png");
  guy = loadImage("guy.png");
  penis = loadImage("penis.png");
  myPropeller = new Propeller();
  Propeller2 = new Propeller();
}

void draw() {
  guyx = childx - 600 + guymovex;
  guyy = childy + 150 + guymovey;
  cxspeed = random(cxspeed - xspeedrange, cxspeed + xspeedrange);
  cyspeed = random(cyspeed - yspeedrange, cyspeed + yspeedrange);
  px = childx - pw + 100;
  image(field, 0, 0, width, height);
  image(child, childx, childy);
  if (jizz == false) {
  water.add(new GravityBall(300, 500, 20, color(0, 150, 200), random(-3, 3), -5));
  }
  if (jizz == true) {
  water.add(new GravityBall(px, childy + 170, 50, color(220), cxspeed, cyspeed));
  image(guy, guyx, guyy);
  image(penis, px, childy + 150, pw, ph);
  Propeller2.display(guyx + 55, guyy + 10);
  Propeller2.move();
  }
  for (int i=0; i < water.size(); i++) {
    GravityBall allBallz = (GravityBall) water.get(i);
    allBallz.display();
    //allBallz.c = color(random(255), random(255), random(255));
    if (allBallz.y > height) {
      water.remove(i);
    }
    myPropeller.display(childx + 55, childy + 10);
    myPropeller.move();
    
  }
  
  if (keyPressed == true) {
    if (key == 'w') {
      childy-=3;
    }
    if (key == 's') {
      childy+=3;
    }
    if (key == 'd') {
      childx+=3;
    }
    if (key == 'a') {
      childx-=3;
    }
    if (key == 'p') {
      pw = 400;
    }
    if (key == 'o') {
      pw = 100;
    }
    if (keyCode == RIGHT) {
      cxspeed ++;
    }
    if (keyCode == LEFT) {
      cxspeed --;
    }
    if (keyCode == UP) {
      cyspeed --;
    }
    if (keyCode == DOWN) {
      cyspeed ++;
    }
    if (key == 'y') {
      guymovey-=3;
    }
    if (key == 'h') {
      guymovey+=3;
    }
    if (key == 'j') {
      guymovex+=3;
    }
    if (key == 'g') {
      guymovex-=3;
    }
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    jizz = true;
  }
  if (key == 'q') {
    jizz = false;
  }
  
  
}

class GravityBall {
  float x, y, d, r, xspeed, yspeed, gravity;
  color c;

  GravityBall (float cx, float cy, float cd, color cc, float cxspeed, float cyspeed) {
    x = cx;
    y = cy;
    d = cd;
    r = cd/2;
    c = cc;
    xspeed = cxspeed;
    yspeed = cyspeed;
    gravity = .1;
  }


 void display() {
    noStroke();
    fill(c);
    ellipse(x, y, d, d);
    
    yspeed += gravity;
    
    if (x < 0) {
      xspeed = -xspeed;
    }
    if (x > width) {
      xspeed = -xspeed;
    }
    if (y < 0) {
      yspeed = -yspeed;
    }
    if (y >= height) {
      y += -100;
    }
    else{
    y += yspeed;
    }
    x += xspeed;
  }
}

class Propeller {
  float x, y, w, h, rw, rh;
  boolean grow = false, shrink = true;


  Propeller() {
    w = 10;
    h = 50;
    rw = 100;
    rh = 10;
  }

  void display(float cx, float cy) {
    x = cx;
    y = cy;
    fill(100);
    strokeWeight(3);
    stroke(0);
    rect(x, y, w, h);
    ellipse(x+5, y + rh/2, rw, rh);
  }

  void move () {
    if (rw <= 10) {
      grow = true;
      shrink = false;
    }
    if (rw >= 100) {
      grow = false;
      shrink = true;
    }
    if (grow == true) {
      rw++;
    }
    if (shrink == true) {
      rw--;
    }
  }
}



