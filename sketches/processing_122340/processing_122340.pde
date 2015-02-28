
// Created by Michal Huller
// on Aug 4th 2013
// additions on Aug 7th
// Project: Sinus dream creating Mandala or 
// The flower with seven petals
PVector bigCircleC;
float bigCircleR;
circle [] manyCircles;
int MANY=floor(random(4, 10));
int butWide = 80;
PImage haltBut;
PImage contBut;
PImage newBut, clickBut, neatBut, fuzzyBut, scrShot, saveScr;
boolean halt = false;
boolean aligned = false;
boolean newK = false;
boolean saveK = false;
boolean fuzzyK = false;
int divPai=5;

void setup() {
  size(600, 400);
  rectMode(CORNER);
  imageMode(CORNER);
  smooth();

  haltBut = loadImage("halt.png");
  contBut = loadImage("cont.png");
  newBut = loadImage("new.png");
  clickBut = loadImage("click.png");
  neatBut = loadImage("neat.png");
  fuzzyBut = loadImage("fuzzy.png");
  saveScr = loadImage("saveb.png");
  scrShot = createImage(width - butWide, height, 1);
  bigCircleC = new PVector ((width+butWide)/2, height/2);
  bigCircleR = min((width-butWide), height);
  background(25, 12, 3);
  divPai = floor(random(3, 9));
  manyCircles = new circle[MANY];
  // if not aligned every circle has different numbers of petals
  if (!aligned) {
    for (int i=0; i < MANY; i++) {
      manyCircles[i] = new circle(random(20, bigCircleR/2.5), 
      bigCircleC, random(bigCircleR*(2/3), bigCircleR), 
      TWO_PI/divPai, 0.02);
    }
  }
  else {
    int thFactor = floor(random(6, 13));
    for (int i=0; i < MANY; i++) {
      manyCircles[i] = new circle(random(20, bigCircleR/2.5), 
      bigCircleC, random(bigCircleR*(2/3), bigCircleR), 
      TWO_PI/divPai, 0.02, thFactor);
    }
  }
}

void draw() {
  noStroke();
  fill(25, 12, 3);
  rect(0, 0, butWide, height);
  if (aligned) {
    image(neatBut, 10, 20+ 2*(10+neatBut.height));
  }
  else {
    image(fuzzyBut, 10, 20+ 2*(10+fuzzyBut.height));
  }

  image(saveScr, 10, 20+ 3*(10+saveScr.height));

  if (!halt) {
    image(haltBut, 10, 20);

    for (int i=0; i < MANY; i++) {
      manyCircles[i].drawit();
      manyCircles[i].update();
    }
  }
  else {
    noStroke();
    fill(25, 12, 3);
    rect(butWide/2, height/2, butWide, height);
    image(contBut, 10, 20);
  }
  image(newBut, 10, 20+10+newBut.height);
  if (newK) {
    image(clickBut, 10, 20+10+clickBut.height);
    newK=false;
  }
  if (fuzzyK) {
    image(clickBut, 10, 20+ 2*(10+neatBut.height));
    fuzzyK=false;
  }
  if (saveK) {
    image(clickBut, 10, 20+ 3*(10+saveScr.height));
    saveK=false;
  }
}

void mouseClicked() {
  // new mandala flash a click
  if (mouseX >= 10 && mouseX <= 10 + newBut.width && 
    mouseY >= 20 + 10 + newBut.height && 
    mouseY <= 20 + 10 + 2*haltBut.height ) {
    newK = true;
  }

  // neat was clicked
  if (mouseX >= 10 && mouseX <= 10 + neatBut.width && 
    mouseY >= 20+ 2*(10+neatBut.height) && 
    mouseY <= 20+ 2*(10+neatBut.height) + neatBut.height ) {
    fuzzyK = true;
  }

  // save was clicked
  if (mouseX >= 10 && mouseX <= 10 + saveScr.width && 
    mouseY >= 20+ 3*(10+saveScr.height) && 
    mouseY <= 20+ 3*(10+saveScr.height) + neatBut.height ) {
    saveK = true;
  }
}
void mouseReleased() {
  if (mouseX >= 10 && mouseX <= 10 + haltBut.width && 
    mouseY >= 20 && mouseY <= 20 + haltBut.height && 
    !halt) {
    halt = true;
  }
  else if (mouseX >= 10 && mouseX <= 10 + haltBut.width && 
    mouseY >= 20 && mouseY <= 20 + haltBut.height && 
    halt) {
    halt = false;
  }
  // new mandala
  if (mouseX >= 10 && mouseX <= 10 + newBut.width && 
    mouseY >= 20 + 10 + newBut.height && 
    mouseY <= 20 + 10 + 2*haltBut.height ) {
    halt = false;
    setup();
  }
  // fuzzy or neat? choose and represh
  if (mouseX >= 10 && mouseX <= 10 + neatBut.width && 
    mouseY >= 20+ 2*(10+neatBut.height) && 
    mouseY <= 20+ 2*(10+neatBut.height) + neatBut.height ) {
    aligned = !aligned;
    halt = false;
    setup();
  }

  // save flower
  if (mouseX >= 10 && mouseX <= 10 + saveScr.width && 
    mouseY >= 20+ 3*(10+saveScr.height) && 
    mouseY <= 20+ 3*(10+saveScr.height) + neatBut.height ) {
    scrShot=get(butWide, 0, width - butWide, height);
    String fname="flower_" + frameCount + ".png";
    scrShot.save(fname);
  }
}

class circle {
  PVector center;
  float radius;
  PVector spot; // the brush tip
  PVector bigC; // center of big circle
  float bigR; // big circle radius
  float theta;
  float acc;
  color R, G, B;
  int thFactor;

  // each circle has it's own number of petals
  circle(float r, PVector bc, 
  float bigr, float th, float ac
    ) {
    theta = th;
    acc = ac;
    center = new PVector(0.0, 0.0);
    radius = r;
    spot = new PVector(0.0, 0.0);
    bigC = new PVector(bc.x, bc.y);
    bigR = bigr;
    R = floor(random(100, 255));
    G = floor(random(100, 255));
    B = floor(random(100, 255));
    thFactor = floor(random(6, 13));
    update();
  }
  
  // all circle have the same number of petals
  circle(float r, PVector bc, 
  float bigr, float th, float ac, int tfactor
    ) {
    theta = th;
    acc = ac;
    center = new PVector(0.0, 0.0);
    radius = r;
    spot = new PVector(0.0, 0.0);
    bigC = new PVector(bc.x, bc.y);
    bigR = bigr;
    R = floor(random(100, 255));
    G = floor(random(100, 255));
    B = floor(random(100, 255));
    thFactor = tfactor;
    update();
  }

  void update() {
    theta+=acc;
    PVector moveto = new PVector(cos(theta), sin(theta), 0);
    moveto.normalize();
    moveto.mult((bigR-radius)/2);
    center= PVector.add(bigC, moveto);
    moveto.set(cos(theta*thFactor), sin(theta*thFactor));
    moveto.normalize();
    moveto.mult(-(radius/2));
    spot= PVector.add(center, moveto);
  }

  void drawit() {
    pushStyle();

    noFill();
    strokeWeight(2);
    stroke(R, G, B, 50);
    line(center.x, center.y, spot.x, spot.y);
    ellipse(spot.x, spot.y, 4, 4);

    popStyle();
  }
}



