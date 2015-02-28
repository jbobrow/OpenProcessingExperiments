

int particleMax = 200;
Particle[]p = new Particle[particleMax]; //yup - particles
int boundry = 190; //radius of particle area
PVector center; //center of particle area
PImage back, base, bar, handle, tip; //static images
int activeSlider = -1; //keeps track of which slider being adjusted
Slider attraction, repulsion, repulsionDistance, count, friction, limiter; //slider controls

//================================================================

void setup() {
  size(600, 400);
  smooth();

  center = new PVector(400, 200); //center of particle area

  //load static images
  back = loadImage("back.jpg");
  base = loadImage("base.png");
  bar = loadImage("bar.png");
  handle = loadImage("handle.png");
  tip = loadImage("tip.png");

  setupSliders(); //setup the sliders (duh)

  //create particles
  for (int i=0; i<particleMax; i++)
    p[i] = new Particle();
}

//================================================================

void draw() {
  background(0);
  image(back, 0, 0);

  //check each slider
  fill(255);
  attraction.check();
  repulsion.check();
  repulsionDistance.check();
  count.check();
  friction.check();
  limiter.check();

  //check each particle
  for (int i=0; i<count.val; i++)
    p[i].check();
}

//================================================================

void mouseReleased() {
  activeSlider = -1; //release slider
}

//================================================================

void mousePressed() {
  //one of our sliders might have been clicked
  if (count.mouseOver()) activeSlider = count.id;
  if (repulsion.mouseOver()) activeSlider = repulsion.id;
  if (repulsionDistance.mouseOver()) activeSlider = repulsionDistance.id;
  if (friction.mouseOver()) activeSlider = friction.id;
  if (limiter.mouseOver()) activeSlider = limiter.id;
  if (attraction.mouseOver()) activeSlider = attraction.id;
}

//================================================================

void setupSliders() {
  //create our sliders and give 'em default values
  int pos = 15;

  count = new Slider(10, pos, 0);
  count.label = "Particle Count";
  count.flagShowPercent = false;
  count.setLimits(10, particleMax);
  count.val = 80;
  pos += base.height + 15;

  repulsion = new Slider(10, pos, 1);
  repulsion.label = "Particle Repulsion Strength";
  repulsion.val = .5;  
  pos += base.height + 15;

  repulsionDistance = new Slider(10, pos, 2);
  repulsionDistance.label = "Particle Repulsion Distance";
  repulsionDistance.flagShowPercent = false;
  repulsionDistance.setLimits(10, 40);
  repulsionDistance.val = 20;
  pos += base.height + 15;

  friction = new Slider(10, pos, 3);
  friction.label = "Particle Friction";
  friction.val = .1;
  pos += base.height + 15;

  limiter = new Slider(10, pos, 4);
  limiter.label = "Particle Speed Limiter";
  limiter.val = .25;
  pos += base.height + 15;

  attraction = new Slider(10, pos, 5);
  attraction.label = "Mouse Attraction Strength";
  attraction.val = .75;
}

//================================================================

class Particle {
  PVector pos, dir; //just position and movement direction
  //-----------------------------------
  Particle() {
    pos = new PVector(center.x, center.y); //they all start in the middle of the particle area
    dir = new PVector(random(-1, 1), random(-1, 1)); //have 'em move in a random direction
    dir.normalize();
  }
  //-----------------------------------
  void check() {

    //boundry check
    if (pos.dist(center) > boundry) {
      PVector changeDir = PVector.sub(center, pos);
      dir = new PVector(changeDir.x, changeDir.y);
      changeDir.normalize();
      changeDir.mult(5);
      //flash a red arc along boundry
      stroke(255, 0, 0);
      noFill();
      float angle = atan2(-changeDir.y, -changeDir.x);
      arc(center.x, center.y, boundry*2, boundry*2, angle - 0.1, angle + 0.1);
    }

    //attraction
    if (mousePressed && activeSlider == -1) {
      PVector mousePos = new PVector(mouseX, mouseY);
      if (mousePos.dist(center) < boundry) {
        PVector changeDir = PVector.sub(mousePos, pos);
        changeDir.normalize();
        changeDir.mult(attraction.val); 
        dir.add(changeDir);
      }
    }

    //repulsion
    for (int i=0; i<count.val; i++) {
      if (pos.dist(p[i].pos) < repulsionDistance.val && p[i] != this) {
        PVector changeDir = PVector.sub(pos, p[i].pos);
        changeDir.normalize();
        changeDir.mult(repulsion.val);
        dir.add(changeDir);
        //draw green line between repulsing
        stroke(0, 255, 0, 32);
        line(p[i].pos.x, p[i].pos.y, pos.x, pos.y);
      }
    }

    //update pos and draw ellipse
    dir.mult(1 - friction.val * 0.1); //friction
    dir.limit(4 * limiter.val); //speed limiter
    pos.add(dir);
    stroke(0);
    fill(255);
    ellipse(pos.x, pos.y, 3, 3);
  }
}

//================================================================

class Slider {
  int posX, posY;
  float limitMin, limitMax, span, val;
  String label;
  int id;
  boolean flagShowPercent;
  //-----------------------------------
  Slider(int x, int y, int sliderNum) {
    posX = x;
    posY = y;
    id = sliderNum; //each slider is given a unique number to keep from stepping on each other's toes
    setLimits(0.0, 1.0); //set min, max, and span
    val = 0.5; //default value
    label = "Label " + id; //default blank label
    flagShowPercent = true; //value is showed as a %
  }
  //-----------------------------------
  boolean mouseOver() {
    //just returns whether or not the mouse is currently positioned over the slider
    return ( mouseX > posX && mouseX < posX + base.width &&
             mouseY > posY && mouseY < posY + base.height );
  }
  //-----------------------------------
  void setLimits(float sliderMin, float sliderMax) {
    limitMin = sliderMin;
    limitMax = sliderMax;
    span = limitMax - limitMin;
  }
  //-----------------------------------
  void check() {
    if (activeSlider == id) //the mouse is controlling this slider - adjust accordingly
      val = constrain((limitMax - limitMin) * (mouseX - posX - 10) / bar.width + limitMin, limitMin, limitMax);

    pushMatrix();
      //position and draw the base first
      translate(posX, posY);
      image(base, 0, 0); 
      
      //draw the label
      textSize(11);
      textAlign(LEFT, CENTER);
      text(label, 12, 12);
      
      //show the bar and the handle
      float handleX = (val - limitMin)/(limitMax - limitMin)*bar.width;
      image(bar, 10, 30, handleX, bar.height); //this just squishes the bar (yuck)
      image(handle, handleX - 10, 17);
      
      if (activeSlider == id) { //mouse is in control - show the "tool-tip" value
        textSize(9);
        textAlign(CENTER, CENTER);
        image(tip, handleX - 9, 4);
        if (flagShowPercent) text(int(val*100)+"%", handleX + 12, 12);
        else text(int(val), handleX + 12, 12);
      }
    popMatrix();
  }
}


