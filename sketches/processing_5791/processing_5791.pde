

//GOBI (assignment5)
//designed by Rue Song for Interactivity
//November 8, 2009

PShape gobivbody;
PShape gobivsoilcover;
PShape gobivleftleaf;
PShape gobivrightleaf;
PShape gobiveye;
PShape sun;
PShape earth;
PShape sky;
PShape foreground;
PImage gradientSky;
PImage gradientEarth;
float x;
float y;
float targetX, targetY;
float easing = 0.03;
float dx, dy;
float tx = 0;

void setup () {
  size(480,320);
  smooth();
  gobivbody = loadShape ("GobiVBody.svg");
  gobivsoilcover = loadShape ("GobiVSoilCover.svg");
  gobivleftleaf = loadShape ("GobiVLeftLeaf.svg");
  gobivrightleaf = loadShape ("GobiVRightLeaf.svg");
  gobiveye = loadShape ("GobiVEye.svg");
  sun = loadShape ("UndergroundFluries.svg");
  earth = loadShape ("backgroundEarth.svg");
  sky = loadShape ("backgroundSky.svg");
  foreground = loadShape ("foreground.svg");
  gradientSky = loadImage ("gradientSky.png");
  gradientEarth = loadImage ("gradientEarth.png");
}

void draw () {
  float gobiShiver = map(mouseX, width-5, 0, 0, random(-4,4));
  float leavesScale = map(mouseX, 0, width, 0.47, 1.4);
  float leavesFreq = map(mouseX, width, 0, 10, 100);
  float buttonGColor = map(mouseY, height, 0, 0, 255);
  background (255);
  sky ();
  sun ();
  earth ();
  gobibody (gobiShiver);
  gobileaves(leavesScale, leavesScale, leavesFreq);
  gobibuttons(0, buttonGColor, 0);
  foreground ();
}

void sky () {
  float skyRotate = map (mouseY, 0, height, 0, -PI);
  pushMatrix();
    translate (240, 420);
    rotate (skyRotate);
    image (gradientSky, -500, -500, 1000, 1000);
    shape (sky, -500, -500, 1000, 1000);
  popMatrix();
}

void earth () {
  float earthRotate = map(mouseX, width, 0, 0, -PI);
  pushMatrix();
    translate (240, 480);
    rotate (earthRotate);
    image (gradientEarth, -500, -500, 1000, 1000);
  popMatrix();
}

void foreground () {
  float foregroundRotate = map(mouseX, width, 0, -0.1, -PI+0.2);
  pushMatrix();
  translate (240, 480);
  rotate (foregroundRotate);
  shape (foreground, -500, -500, 1000, 1000);
  popMatrix();
}

void sun () {
  noStroke();
  fill(255,236,157,80);
  for (int s = (320-mouseY)/2; s > 0; s -= 10){
    ellipse(mouseX,mouseY,s,s);
  }
}

void gobibody (float shiver) {
  pushMatrix();
    translate (width/2+shiver, height/2+shiver);
    shape(gobivbody,-240,-175, 480, 320);
    pushMatrix();
      translate (-88, -144);
      shape (gobiveye, -36, -36, 72, 72);
    popMatrix();
    pushMatrix();
      translate (-204, -144);
      shape (gobiveye, -36, -36, 72, 72);
    popMatrix();
}

void gobileaves (float leafW, float leafH, float leafA) {
    pushMatrix();
      translate(-10,-61);
      tx += PI/(leafA);
      rotate(((sin(tx)/4)+0.2));
      scale (leafW,leafH);
      shape (gobivleftleaf,-227,-120,480, 320);
    popMatrix();
    pushMatrix();
      strokeWeight(1);
      translate(5,-61);
      rotate((sin(-tx)/4)-0.2);
      scale (leafW, leafH);  
      shape (gobivrightleaf,-250,-120, 480, 320);
    popMatrix();
    shape (gobivsoilcover, -240, -165, 480, 320);
}

void gobibuttons (float R, float G, float B) {
    stroke(0);
    fill(random(0,R), random(50,G), random(0,B));
    rect(-10,35,5,5);
    fill(random(0,R), random(50,G), random(0,B));
    rect(-5,35,5,5);
    fill(random(0,R), random(50,G), random(0,B));
    rect(0,35,5,5);
    fill(random(0,R), random(50,G), random(0,B));
    rect(5,35,5,5);
  popMatrix();
}


