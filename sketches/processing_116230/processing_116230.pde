
PImage treeBranch; 
PImage vines;
PImage back; 
PImage mush; 

// load classes
Map map; 
Creature creature; 
Fly fly; 

//variables
float sx; 
float sy; 
float massX;
float massY;
ArrayList<Float> xpoints = new ArrayList<Float>(); 
ArrayList<Float> ypoints = new ArrayList<Float>(); 
int  nPoints; 
float forceX; 
float forceY; 
int samePlaceX;
int sizeY; 
int index;
float nextFlyPx; 
float nextFlyPy;
int newStart; 
int counter; 
float flyCreatureAttractionConstant;
float flyAttractionConstant; 
int alpha; 


void setup() {
  size(1000, 1000);
  map = new Map();
  sx = 250; 
  sy = 800;
  massX = 70;
  massY = 65;  
  creature = new Creature(sx, sy, massX, massY);
  samePlaceX = 0;
  fly = new Fly(width/2 -10, height/2, 2);
  counter = 0; 
  nextFlyPx = fly.px; 
  nextFlyPy = fly.py;
  alpha = 255;

  treeBranch    = loadImage("tree_all.png");
  vines         = loadImage("vines.png");
  back          = loadImage("back.png");
  mush          = loadImage("mushroom.png");
}

void draw() {
  pushMatrix(); 
  translate(150, 50);
  background(#c4c39a);

  int blink = millis()/300; 

  if (blink % 30 == 0) {
    creature.sizeY = 1;
  }
  else if (creature.eatFly == true) {
    creature.sizeY = 7;
    creature.asleep = false;
  }
  else if (samePlaceX > 200.0) {
    creature.sizeY = 1;
    if (samePlaceX > 250.0) {
      creature.asleep = true;
    }
  }
  else {
    creature.sizeY = 7;
    creature.asleep = false;
  }

  map.render(); 
  xpoints = map.xpoints;
  ypoints = map.ypoints; 
  nPoints = ypoints.size();  

  popMatrix();
  fill(#c4c39a, alpha);
  rect(0, 0, width, height); 
  fill(0);
  image(back, width/2, height/2, 1000, 1218);
  image(treeBranch, width/2, height/2 + (2*cos(millis()/100 + 7)/2), 710, 871);
  image(mush, width/2, height/2 + (2*cos(millis()/100 + 7)/2), 710, 871);

  pushMatrix(); 
  translate(150, 50); 
  //========================================================
  //========================creature========================
  //========================================================

  // let's find the closest point on the track. 
  float creaturePx = creature.px; 
  float creaturePy = creature.py; 

  float minimumDistanceDiscovered = 99999; 
  int indexOfClosestTrackPoint = -1; 
  float moveNoiseConstant = 10.0; 

  int move = int(moveNoiseConstant * map(noise(second()/300.0), 0, 1, 0, 100));
  if (move % 5 == 0)
  {
    samePlaceX = 0; 
    for (int i=0; i<(nPoints-0); i++) {
      float trackPx = xpoints.get(i);
      float trackPy = ypoints.get(i);
      float dx = creaturePx - trackPx;
      float dy = creaturePy - trackPy;
      float dh = sqrt(dx*dx + dy*dy) ; // Pythagoras

      if (dh < minimumDistanceDiscovered) {
        minimumDistanceDiscovered = dh;
        indexOfClosestTrackPoint = i;
      }
    }

    //------------------------------------------------------forces

    if (indexOfClosestTrackPoint != -1) { // insanity check 
      float closestTrackPx = xpoints.get(indexOfClosestTrackPoint); 
      float closestTrackPy = ypoints.get(indexOfClosestTrackPoint);

      float attractionConstant = -0.4; 
      float trackConstant      =  60.0; 


      //------------------------------------------------------
      // 1. The attraction force is proportional to the distance.

      float dx = creaturePx - closestTrackPx;
      float dy = creaturePy - closestTrackPy;
      float dh = sqrt(dx*dx + dy*dy);
      if (dh > 10) {
        float attractionForceX = attractionConstant * dx;
        float attractionForceY = attractionConstant * dy;
        creature.applyForce(attractionForceX, attractionForceY);
      }

      //------------------------------------------------------

      //------------------------------------------------------
      // 2. The track force is along the vector from the closestTrack point to the next one. 

      int indexOfNextTrackPoint = (indexOfClosestTrackPoint + 3)%nPoints;
      float nextTrackPx = xpoints.get(indexOfNextTrackPoint); 
      float nextTrackPy = ypoints.get(indexOfNextTrackPoint);
      float tx = nextTrackPx - closestTrackPx; 
      float ty = nextTrackPy - closestTrackPy; 
      float th = sqrt(tx*tx + ty*ty);
      if (th > 0) { // create a unit (normalized) vector
        tx = tx/th;
        ty = ty/th; 
        float trackForceX = trackConstant * tx;
        float trackForceY = trackConstant * ty;
        creature.applyForce(trackForceX, trackForceY);
      }

      creature.nextPoint(xpoints.get(indexOfNextTrackPoint), ypoints.get(indexOfNextTrackPoint));

    }
  }

  samePlaceX ++; 

  float noiseBreathConstant = 0.7; // breathing
  float breath  = noiseBreathConstant * cos(millis()/100 + 7)/2;
  if ((creature.massY < 62.0) || (creature.massY > 69.0)){
    creature.massY = 65;
  }
  creature.massY += (breath);
  //------------------------------------------------------


  //------------------------------------------------------eat fly 

  if (creature.eatFly == true) {
    stroke(#DF4E4E); 
    strokeWeight(3); 
    line(creaturePx, creaturePy, fly.px, fly.py);

    strokeWeight(1);
  }


  //------------------------------------------------------

  stroke (0, 0, 0); 
  creature.render(); 
  creature.update();


  //========================================================
  //===========================fly==========================
  //========================================================


  float flyPx = fly.px; 
  float flyPy = fly.py; 


  float minPointDistance = 40.0; 
  float minMouseDistanceX = 160.0; 
  float minMouseDistanceY = 70.0;

  //------------------------------------------------------
  // 1. attract to random point on line

  if (( abs((mouseX) - flyPx) < 153) && (abs((mouseY) - flyPy) < 53)) {
    if (counter == 0) {
      if (index < xpoints.size()/2) {
        newStart = xpoints.size()/2+1;
      }
      else {
        newStart = xpoints.size()/2;
      }
      index = int(random(newStart, xpoints.size()));
      counter = 5;
    }
  }
  if (((abs(nextFlyPx - flyPx) < minPointDistance) && (abs(nextFlyPy - flyPy) < minPointDistance))) {
    index = int(random(0, xpoints.size()));
    if (counter != 0) {
      counter --;
    }
  }

  nextFlyPx = xpoints.get(index); 
  nextFlyPy = ypoints.get(index);


  if (creature.attractEat < 10.0) {
    flyAttractionConstant = 5.0;
  }
  else {
    flyAttractionConstant = 0.0;

    index = int(random(0, xpoints.size()));
    newStart = xpoints.size()/2+1;
    index = int(random(newStart, xpoints.size()));
    nextFlyPx = xpoints.get(index); 
    nextFlyPy = ypoints.get(index);
  }
  float dx = nextFlyPx - flyPx; 
  float dy = nextFlyPy - flyPy;
  float dh = sqrt(dx*dx + dy*dy);

  fly.nextPoint(nextFlyPx, nextFlyPy); 


  if (dh > 0) {

    float flyAttractForceX = (dx/dh) * flyAttractionConstant; 
    float flyAttractForceY = (dy/dh) * flyAttractionConstant;
    fly.applyForce(flyAttractForceX, flyAttractForceY);

    stroke(0);

    float noiseConstant     = 5.0;
    float flyNoiseForceX = noiseConstant * map(noise(millis()/58.45), 0, 1, -1, 1); 
    float flyNoiseForceY = noiseConstant * map(noise(millis()/48.2), 0, 1, -1, 1); 
    fly.applyForce(flyNoiseForceX, flyNoiseForceY);
  }


  //------------------------------------------------------
  // 2. 

  //  a)Repulsion from mouse

  if (( abs((mouseX) - flyPx) < minMouseDistanceX) && (abs((mouseY) - flyPy) < minMouseDistanceY)) {

    fly.nextPoint(nextFlyPy, nextFlyPx);

    // repulsion from mouse FIX ME LATER!!
    float flyRepulsionConstant = -5;  
    float mx = mouseX - flyPx; 
    float my = mouseY - flyPy; 
    float mh = sqrt(mx*mx + my*my);

    flyCreatureAttractionConstant = creature.attractEat; 
    float fcx = creaturePx - flyPx; 
    float fcy = creaturePy - flyPy;   
    float fch = sqrt( fcx * fcx + fcy * fcy); 

    float flyCreatureAttractForceX = (fcx/fch) * flyCreatureAttractionConstant;  
    float flyCreatureAttractForceY = (fcy/fch) * flyCreatureAttractionConstant;
    fly.applyForce(flyCreatureAttractForceX, flyCreatureAttractForceY);

    //2) slight attraction to creature
    float pushFlyConstant = 7; 
    float pfx = creaturePx - flyPx; 
    float pfy = creaturePy - flyPy;   
    float pfh = sqrt( pfx * pfx + pfy * pfy); 

    float pushFlyForceX = (pfx/pfh) * pushFlyConstant;  
    float pushFlyForceY = (pfy/pfh) * pushFlyConstant;
    fly.applyForce(pushFlyForceX, pushFlyForceY);

    if (mh > 0) {
      float flyRepelForceX = (mx/mh) * flyRepulsionConstant; 
      float flyRepelForceY = (my/mh) * flyRepulsionConstant;
      fly.applyForce(flyRepelForceX, flyRepelForceY);
    }
  }


  //  b) slight attraction to creature

  flyCreatureAttractionConstant = creature.attractEat; 
  float fcx = creaturePx - flyPx; 
  float fcy = creaturePy - flyPy;   
  float fch = sqrt( fcx * fcx + fcy * fcy); 

  float flyCreatureAttractForceX = (fcx/fch) * flyCreatureAttractionConstant;  
  float flyCreatureAttractForceY = (fcy/fch) * flyCreatureAttractionConstant;
  fly.applyForce(flyCreatureAttractForceX, flyCreatureAttractForceY);

  fly.render();
  fly.update();
  
  popMatrix();

  image(vines, width/2, height/2 + (2*cos(millis()/100 + 7)/2), 710, 871);
}

void keyReleased() {
  if (alpha == 0) {
    alpha = 255;
  }
  else {
    alpha = 0;
  }
}

//load graphics 
PImage camel_body;
PImage camel_fleft; 
PImage camel_fright; 
PImage camel_bleft; 
PImage camel_bright; 

PImage shadow;


class Creature {
  float px; // position of current point
  float py;
  float npx; // postition of next point
  float npy;  
  float dx; // distance between points
  float dy; 
  float vx; // velocity
  float vy; 
  float angle; 
  float massX;
  float massY; 
  int sizeX; 
  int sizeY;    
  float attractEat; 
  boolean eatFly; 
  boolean asleep; 


  Creature(float x, float y, float mx, float my) {
    px = x; 
    py = y; 
    angle = 0;
    massX = mx;
    massY = my;
    vx = 0; 
    vy = 0; 
    sizeX = 7; 
    sizeY = 7;
    eatFly = false; 
    asleep = false; 
    attractEat = 0;

    //graphics
    camel_body    = loadImage("camel_body.png");
    camel_fleft   = loadImage("camel_fleft.png");
    camel_fright  = loadImage("camel_fright.png"); 
    camel_bright  = loadImage("camel_bright.png");
    camel_bleft   = loadImage("camel_bleft.png");
    
    shadow   = loadImage("shadow.png");
  }

  void nextPoint(float nx, float ny) { 
    dx = px - nx; 
    dy = py - ny;
  }

  void applyForce(float fx, float fy) {
    float ax = fx/massX; 
    float ay = fy/massX;
    vx += ax; 
    vy += ay;
  }

  void render() {
    pushMatrix();
    translate(px, py);

    //===========================================

    pushMatrix();
    float flyDistanceX = (px - fly.px); 
    float flyDistanceY = (py - fly.py);

    float flyAngle = atan2(flyDistanceY, flyDistanceX);

    rotate(flyAngle);
    stroke(0, 0, 0, 0);
    line(0, 0, -400, 0);
    popMatrix(); 
    strokeWeight(1);
    stroke(0);

    //===========================================

    angle = atan2(dy, dx); 
    rotate(angle); // turns the creature


      //===========================================

    float addAngle = flyAngle - angle;
    if (((addAngle < 0.3) && ( addAngle > -0.3))
      &&((abs(fly.px - px)< 200.0)&&(abs(fly.py - py)< 200.0)
      && (abs(fly.px - px)> 5.0)&&(abs(fly.py - py)> 5.0))
      ) {
      eatFly = true; 
      attractEat = 10.0;  

      if ((abs(fly.px - px)< 20.0)&&(abs(fly.py - py)< 20.0))
      { 
        eatFly = false; 
        if ( second() % 5 == 0) {
          fly.px = -500; 
          fly.py = random(0, height);
        }
        else {
          fly.px = width + 50; 
          fly.py = random(0, height);
        }
      }
    }
    else {
      eatFly = false;
      attractEat = 0;
    }

    //===========================================
    stroke(#193326); 
    fill(#D9FCEB); 

    //*******************************


    imageMode(CENTER);

    pushMatrix(); 
    rotate(radians(10)); 
    image(camel_fright, 0, -2 + (5 * 0.5 * cos(millis()/100 + 7)/2), 11, 26);
    image(camel_bright, 18, -3 + (5 * 0.5 * cos(millis()/100 + 7)/2), 11, 26);
    popMatrix(); 

    image(camel_body, 15, 5  + (5 * 0.5 * cos(millis()/100 + 7)/2), massX, massY);  //body

    strokeWeight(2); 
    ellipse(-8, -10 + (5 * 0.5 * cos(millis()/100 + 7)/2), 15, 15); //outer eye

    strokeWeight(1); 
    fill(#DFA011);
    ellipse(-8, -10 + (5 * 0.5 * cos(millis()/100 + 7)/2), 7, 7); //eyelid

    fill(#001C0E); 
    ellipse(-8, -10 + (5 * 0.5 * cos(millis()/100 + 7)/2), sizeX, sizeY); // pupil

    pushMatrix(); 
    rotate(radians(20)); 
    image(camel_fleft, 10,(5 * 0.5 * cos(millis()/100 + 7)/2), 11, 26);
    image(camel_bleft, 30, -6 + (5 * 0.5 * cos(millis()/100 + 7)/2), 11, 26);
    popMatrix(); 
    
    image(shadow, 3, 10, 70  + (5 * 0.5 * cos(millis()/100 + 7)/2), 40);

    if (sizeY < 3) {
      if (asleep == true) {
        fill(0); 
        float whizz01 = (pow(5, 2) * cos(millis()/100 + 7)/2);
        float whizz02 = (pow(5, 2) * cos(millis()/100 + 7)/3);
        text("z", -10, -50 + whizz01); 
        text("z", -20, -60 + whizz02);
      }
    }


    //*******************************

    noFill(); 
    popMatrix();
  }

  void update() {

    px += vx; 
    py += vy;

    vx = 0; 
    vy = 0;
  }
}

class Fly {
  float px; 
  float py; 
  float mass;
  float dx; 
  float dy;  
  float vx; 
  float vy; 
  float offset;
  float angle; 


  Fly(float x, float y, float m ) {
    px = x; 
    py = y; 
    mass = m;
  }

  void nextPoint(float nx, float ny) { 
    dx = px - nx; 
    dy = py - ny;
  }

  void applyForce(float fx, float fy) {
    float ax = fx/mass; 
    float ay = fy/mass;
    float friction = 0.8;

    if (abs(vx) + ax > 5.0) {
      vx *= friction;
      vy *= friction;
    }
    else {
      vx += ax; 
      vy += ay;
    }
  }


  void render() {
    pushMatrix();
    translate(px, py); 
    angle = atan2(dy, dx); 
    rotate(angle); // turns the creature

    fill(#F7CF2C);
    stroke(#54481A); 
    ellipse(0, 0, 10, 7);
    fill(255); 
    ellipse(0, -5, 6, 5);
    ellipse(0, 5, 6, 5);
    noFill(); 
    stroke(0); 

    popMatrix();
  }

  void update() {
    px += vx + cos(millis()/30) ; 
    py += vy + sin(millis()/30);
  }
}

/*
bezier(x1,y1,x2,y2,x3,y3,x4,y4)
 x1: x begining point on curve(end of line) 
 y1: y begining point on curve(end of line) 
 x2: x beginning of line1. 
 y2: y beginning of line1. 
 x3: x beginning of line2. 
 y3: y beginning of line2. 
 x4: x end of point on curve(end of line)
 y4: y end of point on curve(end of line)
 
 */

class Map {
  float hwidth; 
  float hheight;
  int steps;  
  float t; 

  ArrayList<Float> xpoints = new ArrayList<Float>(); 
  ArrayList<Float> ypoints = new ArrayList<Float>(); 

  Map() {
    hwidth = width/2; 
    hheight = height/2;
    steps = 10; // number of points on curve
  }


  void render() {
     

    //lines
    fill(255, 255, 255, 0);

    line(250, 800, 208, 802); 
    line(177, 753, 204, 691);
    bezier(250, 800, 208, 802, 177, 753, 204, 691);
    curvePoints(250, 800, 208, 802, 177, 753, 204, 691); 

    line(204, 691, 243, 606); 
    line(263, 610, 234, 544);
    bezier(204, 691, 243, 606, 263, 610, 234, 544); 
    curvePoints(204, 691, 243, 606, 263, 610, 234, 544);

    line(234, 544, 198, 473); 
    line(94, 438, 100, 400);
    bezier(234, 544, 198, 473, 94, 438, 100, 400);
    curvePoints(234, 544, 198, 473, 94, 438, 100, 400);

    line(100, 400, 116, 295); 
    line(62, 285, 102, 190);
    bezier(100, 400, 116, 295, 62, 285, 102, 190);
    curvePoints(100, 400, 116, 295, 62, 285, 102, 190);

    line(102, 190, 182, 27); 
    line(211, 9, 300, 50);
    bezier(102, 190, 182, 27, 211, 9, 300, 50);
    curvePoints(102, 190, 182, 27, 211, 9, 300, 50);

    line(300, 50, 316, 58); 
    line(403, 93, 502, 38);
    bezier(300, 50, 316, 58, 403, 93, 502, 38);
    curvePoints(300, 50, 316, 58, 403, 93, 502, 38);

    line(502, 38, 565, 5); 
    line(650, 198, 568, 252);
    bezier(502, 38, 565, 5, 650, 198, 568, 252);
    curvePoints(502, 38, 565, 5, 650, 198, 568, 252);

    line(568, 252, 535, 268); 
    line(619, 437, 576, 501);
    bezier(568, 252, 535, 268, 619, 437, 576, 501);
    curvePoints(568, 252, 535, 268, 619, 437, 576, 501);

    line(576, 501, 547, 536); 
    line(498, 584, 500, 700);
    bezier(576, 501, 547, 536, 498, 584, 500, 700);
    curvePoints(576, 501, 547, 536, 498, 584, 500, 700);

    line(500, 700, 498, 730); 
    line( 369, 791, 250, 800);
    bezier(500, 700, 498, 730, 369, 791, 250, 800);
    curvePoints(500, 700, 498, 730, 369, 791, 250, 800);
    
  }

  void curvePoints(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {

    for (int i = 0; i <= steps; i++) {
      t = i/float(steps); // calculates distance of next point
      float x = bezierPoint(x1, x2, x3, x4, t);
      float y = bezierPoint(y1, y2, y3, y4, t);
      ellipse(x, y, 5, 5); 
      
      if (xpoints.contains(x) == false){
        xpoints.add(x);
      }
      
      if (ypoints.contains(y) == false){
        ypoints.add(y);
      }
      
    }
  }
}


class Tongue {
  float px; 
  float py; 
  float mass; 
  float vx; 
  float vy; 


  Tongue(float x, float y, float m) {
    px = x; 
    py = y; 
    mass = m;
  }

  void applyForce(float fx, float fy) {
    float ax = fx/mass; 
    float ay = fy/mass;
  }

  void render() {
    ellipse(px, py, mass, mass);
  }

  void update() {
    px += vx; 
    py += vy;
  }
}



