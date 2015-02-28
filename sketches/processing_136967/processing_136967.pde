
Particula polvo;
ArrayList<Flare> flares;

void setup(){
  size(600,600);
  background(0);
  smooth();
  colorMode(HSB);
  flares = new ArrayList<Flare>();
  
  for(int cantPolvo = 0; cantPolvo <= 100; cantPolvo++){
    
    int flareX = (int)random(width);
    int flareY = (int)random(height);
    int cantRayos = (int)random(10,50);
    //PVector ini = new PVector(flareX,flareY);
    
    flares.add(new Flare(cantRayos, flareX, flareY));    
  } 
 
}


void draw(){
  
  for(int i = 0; i < flares.size(); i++){
    flares.get(i).update();
  }
}
class Flare {
  ArrayList<Particula> bombetas; 
  int we, he;

  Flare(int cantBombetas, int w, int h) {
    bombetas = new ArrayList<Particula>();
    we = w;
    he = h;
    PVector ini = new PVector(w/1.5, h/1.5);
    for (int cant = 0; cant <= cantBombetas; cant++) {
      bombetas.add(new Particula(ini));
    }
  }

  void update() {
    for (int i = 0; i < bombetas.size(); i++) {
      bombetas.get(i).display();
      bombetas.get(i).update(we-10, he-10);
    }
  }
}

class Particula {
  PVector position;
  PVector velocity;
  PVector acceleration;
  color colour;
  int h,s,b,a;


  Particula(PVector initial) {
    position = initial.get();
    h = (int)random(0,30);//(int)random(240);
    s = (int)random(100,240);
    b = (int)random(100,240);
    a = 255;
    //color colour = new color(r,g,b);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0.0001);
    
  }

  void update(int w, int h) {
    if(position.x <= 10 || position.x >= w){
      velocity.x = 0;
      velocity.y = random(0,1);
    }
    position.add(velocity);
    velocity.add(acceleration);
    a-=0.00005;
  }

  void display() {
    fill(h,s,b,a);
    noStroke();
    ellipse(position.x, position.y, 2, 2);
  }
}



