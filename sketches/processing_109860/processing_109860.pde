
Worm[] worms;
int numWorms = 1000;
PVector pulse;
boolean pulsed;
PImage img;
float dotSize;
int imgIndex = 1;

void setup() {
  size(640, 415);
  smooth();
  noStroke();
  colorMode(HSB, 255);
  img = loadImage("img1.jpg");
  worms = new Worm[numWorms];
  for (int i=0; i<numWorms; i++) {
    worms[i] = new Worm(width/2+random(-width/2,width/2), height/2+random(-20,20), random(0, 2*PI));
  }
  pulsed = false;
  frameRate(50);
}

void draw() {
  if (frameCount == 580){
    background(255);
    frameCount = 0;
    imgIndex = (imgIndex +1)%5+1;
    img = loadImage("img"+imgIndex+".jpg");
    for (int i=0; i<numWorms; i++) {
      worms[i].loc.x=width/2+random(-width/2,width/2);
      worms[i].loc.y=height/2+random(-20,20);
    }
  } 
  if (frameCount > 500){
    //print("dotSize: "+(10-frameCount/50));
    image(img,1,1);
  }
  dotSize = constrain(11-frameCount/50,1,10);
  fill (240, dotSize-3);
  noStroke ();
  rect (0, 0, width, height);
  if (dotSize>3){
    stroke(0,dotSize*20);
    strokeWeight(0.1);
  } 
  for (int i=0; i<numWorms; i++) {
    int xPos = int(worms[i].loc.x);
    int yPos = int(worms[i].loc.y);
    try {
      fill(img.pixels[yPos * width + xPos]);
    } 
    catch (Exception e) {
      fill(255);
    }
    //fill(map(noise(0.01*worms[i].loc.x,0.01*worms[i].loc.y),0,1,0,255),255,255);
    ellipse(worms[i].loc.x, worms[i].loc.y, dotSize, dotSize);
    if (pulsed) {
      worms[i].move(pulse);
    }
    else 
      worms[i].move();
  }
  pulsed = false;
}

void mousePressed() {
  pulse = new PVector(mouseX, mouseY);
  pulsed = true;
}

class Worm {
  PVector dir;
  PVector loc;
  float angle;
  float speed=4;
  float agility = 0.2;

  public Worm(float x, float y, float angle) {
    this.angle = angle;
    loc = new PVector(x, y);
    dir = new PVector(cos(angle), sin(angle));
    dir.normalize();
    dir.mult(speed);
  } 

  void move() {
    angle += random(-agility, agility);
    updateDir();
  }
  void updateDir() {
    dir = new PVector(cos(angle), sin(angle));
    dir.normalize();
    dir.mult(speed);
    if (loc.x+dir.x<0 || loc.x+dir.x>width) { 
      angle = PI-angle;
      //move();
    }
    else if (loc.y+dir.y<0 || loc.y+dir.y>height) { 
      angle = 2*PI-angle;
      //move();
    }
    else 
      loc.add(dir);
  }
  void move(PVector pulse) {
    if (PVector.dist(pulse, loc)<100) {
      PVector d = new PVector(loc.x, loc.y);
      d.sub(pulse);
      angle = atan(d.y/d.x);
      //angle = PVector.angleBetween(d,new PVector(1,0));
      println(angle);
    }
    updateDir();
  }
}



