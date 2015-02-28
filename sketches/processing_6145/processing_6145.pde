
PImage a; 
PImage b;
PImage c;
PImage d;
float x;
float y;
float currentx; 
float currenty; 
PImage Image;
float speedx;
float speedy;
int counter; 

ParticleSystem ps;

void setup() {
  frameRate(50);
  size(1200, 500);
  colorMode(RGB, 255, 255, 255, 100);
  ps = new ParticleSystem(0, new PVector(width, height,0));
  smooth();
  scale(0.5,0.5);
  
  x = 0;
  y = 0;
   while(speedx < 5)
  speedx = (random (33));
  speedy = (random (40));


  
  a = loadImage("Mushroom.gif");  
  b = loadImage("Fungi.gif");
  c = loadImage("Mushroom 2.gif");
  d = loadImage("Cricket.gif");


}




void draw(){
  background(255);
  ps.run();
  ps.addParticle(mouseX,mouseY);

  x = x + speedx;
  y = y + speedy;

  image(a, x , y ,a.width/8, a.height/8);
 
  
  image(b,x + 250, y,b.width/1.5, b.height/1.5);
 
  
  image(c, x + 510, y,c.width/1.5, c.height/1.5);
  
  
  image(d, x + 775, y,d.width/1.5, d.height/1.5);
  

  if( x > 200){
    speedx = speedx * -1;
    counter = counter +1;
  }

  if( x < 0){
    speedx = speedx * -1;
    counter = counter +1;
  }

  if( y > 200){
    speedy = speedy * -1;
    counter = counter +1;
  }

  if( y < 0){
    speedy = speedy * -1;
    counter = counter +1;

  }
}

class ParticleSystem {

  ArrayList particles;   
  PVector origin;        


    ParticleSystem(int num, PVector f) {
    particles = new ArrayList();              
    origin = f.get();                       
    for (int i = 500; i < num; i++) {
      particles.add(new Particle(origin));
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = (Particle) particles.get(i);
      p.run();
      if (p.dead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void addParticle(float x, float y) {
    particles.add(new Particle(new PVector(x,y)));
  }


  void addParticle(Particle p) {
    particles.add(p);
  }

  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } 
    else {
      return false;
    }
  }

}

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;


  Particle(PVector l) {
    acc = new PVector(.15, .15);
    vel = new PVector(.20, .20);
    loc = l.get();
    r = 200;
    timer = 100.0;
  }

  void run() {
    update();
    render();
  }


  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 0.0;
  }


  void render() {
    ellipseMode(CENTER);
    stroke(255,0);
    fill(random(255), random (255), random(255), random(20));
    ellipse(loc.x,loc.y,r,r);

  }

 
  boolean dead() {
    if (timer <= 0.0) {
      return false;
    } 
    else {
      return false;
    }
  }
}  




