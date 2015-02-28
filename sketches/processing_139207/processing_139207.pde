
Particle polvo;
ArrayList<ParticleSystem> ParticleSystems;
int systemQty = 100;

//@pjs preload="http://fc06.deviantart.net/fs17/f/2007/189/3/0/Rough_Wall_Texture_by_Phoxly.png";  

PImage bg;

void setup(){
  size(600,600);
  background(255);
  //bg = loadImage("http://fc06.deviantart.net/fs17/f/2007/189/3/0/Rough_Wall_Texture_by_Phoxly.png");
  //background(bg);
  //http://fc06.deviantart.net/fs17/f/2007/189/3/0/Rough_Wall_Texture_by_Phoxly.png
  smooth();
  //colorMode(HSB);
  ParticleSystems = new ArrayList<ParticleSystem>();
  
  for(int cantPolvo = 0; cantPolvo <= systemQty; cantPolvo++){
    
    int ParticleSystemX = (int)random(width);
    int ParticleSystemY = (int)random(height);
    int cantRayos = (int)random(10,25);
    //PVector ini = new PVector(ParticleSystemX,ParticleSystemY);
    
    ParticleSystems.add(new ParticleSystem(cantRayos, ParticleSystemX, ParticleSystemY));    
  } 
 
}


void draw(){
  
  for(int i = 0; i < ParticleSystems.size(); i++){
    ParticleSystems.get(i).update();
  }
}
class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  color colour;
  int h, s, b, a;
  boolean magnet;
  int brushWidth;


  Particle(PVector initial) {
    position = initial.get();
    float willBeMagnet = random(0, 1);
    magnet = false;
    //h = 188;
    //h = 0;
    //s = 24;
    //b = 178;
    h = 178;
    s = 21;
    b = 20;
    brushWidth = (int)random(1, 2);
    if (willBeMagnet > 0.5) {
      magnet = true;
      //h = 19;
      h = 0;//255;
      s = 0;//82;
      b = 0;
      brushWidth = (int)random(2, 5);
    }
    //s = 100;
    //b = 100;
    a = 255;
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0.0001);
  }  

  void update(int w, int h) {
    if (position.x <= 10 || position.x >= w) {
      velocity.x = 0;
      velocity.y = random(0, 1);
    }

    //rebound if it gets to the top of the screen
    if (position.y<=1) {
      velocity.y = 1;//random(-1, 0);
      //println(position.y);
    }

    //rebound if it gets to the bottom of the screen
    if (position.y >= height-2) {
      velocity.y = 0;//random(-1, 0);
      if (magnet) {
        velocity.x = 1;
      }
      else {
        velocity.x = -1;
      }

      //println(position.y);
    }
    position.add(velocity);
    velocity.add(acceleration);
    a-=0.00005;
  }

  void display() {
    fill(h, s, b, a);
    noStroke();
    ellipse(position.x, position.y, 2, brushWidth);
  }
}

class ParticleSystem {
  ArrayList<Particle> bombetas; 
  int we, he;

  ParticleSystem(int cantBombetas, int w, int h) {
    bombetas = new ArrayList<Particle>();
    we = w;
    he = h;
    //PVector ini = new PVector(w/1.5, h/1.5);
    PVector ini = new PVector(w/1.5, h/1.5);
    boolean isMagnet = false;
    float m = random(0,1);
    if(m >= 0.5){
      isMagnet = true;
    }
    for (int cant = 0; cant <= cantBombetas; cant++) {
      bombetas.add(new Particle(ini));
    }
  }

  void update() {
    for (int i = 0; i < bombetas.size(); i++) {
      bombetas.get(i).display();
      bombetas.get(i).update(we-10, he-10);
    }
  }
}



