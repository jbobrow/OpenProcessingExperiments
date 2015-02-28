
Particle p;
PImage bg;
ArrayList<Particle> pList, pL2, pL3, pHinten, pH2, pH3;

void setup() {
  String url = "http://farm3.staticflickr.com/2924/13443683144_b0e63acd68_o";
  size(1280,960);
  bg = loadImage(url, "jpg");
  colorMode(HSB, 360, 100, 100);
  //p = new Particle(new PVector(width-width/4,height-height/4));
  pList = new ArrayList<Particle>();
  pL2 = new ArrayList<Particle>();
  pL3 = new ArrayList<Particle>();
  pHinten = new ArrayList<Particle>();
  pH2 = new ArrayList<Particle>();
  pH3 = new ArrayList<Particle>();
}

void draw() {
  background(0);
  image(bg,0,0);
  //Particles vorderrad
  pList.add(new Particle(new PVector(width-width/4-35,height-height/4+5)));
  pL2.add(new Particle(new PVector(width-width/4-60,height-height/4-10)));
  pL3.add(new Particle(new PVector(width-width/4-70,height-height/4-20)));
  //Particles back rad
  pHinten.add(new Particle(new PVector(width/4-60,height-height/4)));
  pH2.add(new Particle(new PVector(width/4-80,height-height/4-10)));
  pH3.add(new Particle(new PVector(width/4-90,height-height/4-20)));
  
  for(int i=0; i<pList.size(); i++){
    Particle p = pList.get(i);
    p.run();
    if(p.isDead()){
      pList.remove(i);
    }
  }
  
   for(int i=0; i<pL2.size(); i++){
    Particle p = pL2.get(i);
    p.run();
    if(p.isDead()){
      pL2.remove(i);
    }
  }
  
    for(int i=0; i<pL3.size(); i++){
    Particle p = pL3.get(i);
    p.run();
    if(p.isDead()){
      pL3.remove(i);
    }
  }
  
  for(int i=0; i<pHinten.size();i++){
    Particle pH = pHinten.get(i);
    pH.run();
    if(pH.isDead()){
      pHinten.remove(i);
    }
  }
  
    for(int i=0; i<pH2.size();i++){
    Particle pH = pH2.get(i);
    pH.run();
    if(pH.isDead()){
      pH2.remove(i);
    }
  }
  
    for(int i=0; i<pH3.size();i++){
    Particle pH = pH3.get(i);
    pH.run();
    if(pH.isDead()){
      pH3.remove(i);
    }
  }
}

//------------ Klasse Particle ---------------
class Particle {
  PVector location, velocity, acceleration;
  int lifespan;
  float winkel;
  float v0 = 6;

  Particle(PVector l) {
    //[offset-up] For demonstration purposes we assign the Particle an initial velocity and constant acceleration.
    acceleration = new PVector(0,-0.08);
    winkel = PI/4+random(-0.2,0.4);
    velocity = new PVector(v0*sin(winkel),v0*cos(winkel));
    location = l.get();
    lifespan = 255;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.sub(velocity);
    lifespan -= 2;
  }

  void display() {
    // normal rgb color mode
    //float r = random(255,200);
    //float g = random(lifespan,lifespan-50);
    //float alpha = 300-lifespan;
    //stroke(r, g, 0, alpha); 
    //fill(r, g, 0, alpha);
    
    // hsb color mode
    color c1 = color(random(0,60),100, 100); 
    float alpha = lifespan;
    stroke(c1, alpha);
    fill(c1, alpha);
    
    // draw circle
    ellipse(location.x,location.y,8,8);
  }

  boolean isDead(){
    if(location.y > (height-height/4+5)) return true;
    else return false;
  }
}




