
//import processing.opengl.*;
//import peasy.*;

ArrayList Seeds = new ArrayList();
Seed Sample;
//PeasyCam cam;

void setup() {
  size(900,450);
  background(0);
  smooth();
  //cam = new PeasyCam(this,0,0,0,50);
  //cam.setMinimumDistance(50);
  //cam.setMaximumDistance(500);
}

void draw() {
  for (int i=0; i<Seeds.size(); i++) {
    Seed Sample = (Seed) Seeds.get(i);
    //Sample.colorchange();
    Sample.render();
    Sample.move();
    Sample.borderbounce();
  }
}

void keyPressed() {
  Seed Sample = new Seed(new PVector(mouseX,mouseY),random(1,20),random(1,20));
  Seeds.add(Sample);
}

class Seed {
  PVector position;
  PVector direction;
  float dimensionH1, dimensionH2;
  float dimensionW1, dimensionW2;
  float directionRoll;
  color kleur;
  
  Seed (PVector _position, float _dimensionW, float _dimensionH) { //Constructor
    
    position = _position;
    dimensionH1 = _dimensionH;
    dimensionW1 = _dimensionW;
    
    float directionRoll = random(0,4);  
  }
  
  void render() {
    //fill(kleur);
    fill(0);
    stroke(255);
    rectMode(CENTER);
    rect(position.x,position.y,dimensionW1,dimensionH1); 
  }
  
  void move() {
    
    dimensionW2 = random(1,20);
    dimensionH2 = random(1,20);
    
    float directionRoll = random(0,4); //Makes them choose different directions
    
    if       (directionRoll <= 1) { direction = new PVector ((( dimensionW1+dimensionW2)/2),0); } //right
    else if  (directionRoll <= 2) { direction = new PVector (-((dimensionW1+dimensionW2)/2),0); } //left
    else if  (directionRoll <= 3) { direction = new PVector (0,(( dimensionH1+dimensionH2)/2)); } //up
    else if  (directionRoll <= 4) { direction = new PVector (0,-((dimensionH1+dimensionH2)/2)); } //down
    
    position.add(direction);
    
    dimensionW1 = dimensionW2;
    dimensionH1 = dimensionH2;
  }
  
  void borderbounce() {
    //continues through edges
    
    if (position.x > width)  { position.x = 0; }
    if (position.x < 0)      { position.x = width; }
    if (position.y > height) { position.y = 0; }
    if (position.y < 0)      { position.y = height; }
    
    //bouncesback
    /*
    if (position.x > width)  { direction.x = -direction.x; }
    if (position.x < 0)      { direction.x = -direction.x; }
    if (position.y > height) { direction.y = -direction.y; }
    if (position.y < 0)      { direction.y = -direction.y; }*/
  }
  
  void colorchange() {
    kleur = color(random(0,255),random(0,255),random(0,255));
  }
  
}
