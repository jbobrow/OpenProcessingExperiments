
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/143842*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//Raven Kwok aka Guo, Ruiwen
//ravenkwok.com
//vimeo.com/ravenkwok
//flickr.com/photos/ravenkwok

ArrayList<Particle> pts;
boolean onPressed, showInstruction;
PFont f;

void setup() {
  size(2160, 1040, P2D);
  smooth();
  frameRate(30);
  colorMode(HSB);
  rectMode(CENTER);

  pts = new ArrayList<Particle>();

  showInstruction = true;
  f = createFont("Calibri", 24, true);

  background(0);
}

void draw() {
  if (showInstruction) {
    background(0);
    fill(128);
    textAlign(CENTER, CENTER);
    textFont(f);
    textLeading(36);
    text("BONJOUR!!" + "\n" +
      "JÂ´aimeDolo." + "\n"
      , width*0.5, height*0.5);
  }

  if (onPressed) {
    for (int i=0;i<10;i++) {
      Particle newP = new Particle(mouseX, mouseY, 24, i+pts.size());
      pts.add(newP);
    }
  }

  for (int i=0; i<pts.size(); i++) {
    Particle p = pts.get(i);
    p.update();
    p.display();
  }

  for (int i=pts.size()-15; i>-1; i--) {
    Particle p = pts.get(i);
    if (p.dead) {
      pts.remove(i);
    }
  }
}

void mousePressed() {
  onPressed = true;
  if (showInstruction) {
    background(0);
    showInstruction = false;
  }
}

void mouseReleased() {
  onPressed = false;
}

void keyPressed() {
  if (key == 'c') {
    for (int i=pts.size()-1; i>-1; i--) {
      Particle p = pts.get(i);
      pts.remove(i);
    }
    background(255);
  }
}

class Particle{
  PVector loc, vel, acc;
  int lifeSpan, passedLife;
  boolean dead;
  float alpha, weight, weightRange, decay, xOffset, yOffset;
  color c;
  
  Particle(float x, float y, float xOffset, float yOffset){
    loc = new PVector(x,y);
    
    float randDegrees = random(90);
    vel = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    vel.mult(random(5));
    
    acc = new PVector(0,0);
    lifeSpan = int(random(0, 190));
    decay = random(0, 1);
    c = color(255);
    weightRange = random(3,50);
    
    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }
  
  void update(){
    if(passedLife>=lifeSpan){
      dead = true;
    }else{
      passedLife++;
    }
    
    alpha = float(lifeSpan-passedLife)/lifeSpan * 70+50;
    weight = float(lifeSpan-passedLife)/lifeSpan * weightRange;
    
    acc.set(0,0);
    
    float rn = (noise((loc.x+frameCount+xOffset)*0.01, (loc.y+frameCount+yOffset)*0.01)-0.5)*4*PI;
    float mag = noise((loc.y+frameCount)*0.01, (loc.x+frameCount)*0.01);
    PVector dir = new PVector(cos(rn),sin(rn));
    acc.add(dir);
    acc.mult(mag);
    
    float randDegrees = random(8);
    PVector randV = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    randV.mult(0.5);
    acc.add(randV);
    
    vel.add(acc);
    vel.mult(decay);
    vel.limit(3);
    loc.add(vel);
  }
  
  void display(){
    strokeWeight(weight+1.5);
    stroke(0, alpha);
    point(loc.x, loc.y);
    
    strokeWeight(weight);
    stroke(c);
    point(loc.x, loc.y);
  }
}



