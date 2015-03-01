
//PRACTICA 2 SIMULACION
ArrayList<Cohete> castillo;
Particula p;
PVector v = new PVector(150.0,150.0);
PVector g = new PVector(0.0, 9.8);
PVector r = new PVector(0,0);
float dt = 4;
float altura = height;
int npart = 20;
void setup(){
  size(800,560);
  castillo = new ArrayList<Cohete>();
}

void draw(){
   
   altura -= dt;
   background(0,0,30);
   fill(239, 179, 4);
   //text("Practica 2 - SIMULACION. Cristobal Belda", width/2.7, height/10.5);
  
   for(int i=0; i<castillo.size(); i++){
      Cohete c = castillo.get(i);
      c.run();
   }
   
   fill(0,255,0);
   text("frate: "+frameRate, 15, 15);
   text("Num Part: "+npart, 15, 35);
}
void mousePressed(){
  PVector pos = new PVector(mouseX,180);
  Cohete c = new Cohete(pos,100);
  npart = int(random(10,50));
  c.addParticle();
  castillo.add(c);
}


//Clase qe define el objeto cohete

class Cohete{
  
  ArrayList<Particula> particles;
  float masa = 5;
  PVector a;
  PVector v;
  PVector r;
  float lifespan;
  float altura = height;
  int explosion = 0;
  
  Cohete(PVector l, int num) {
    v = new PVector(0,70);
    a = new PVector(0,10);
    r = l.get();
    lifespan = num;
    particles = new ArrayList<Particula>();   // Initialize the arraylist
    
  }

  void applyForce(PVector f){
    PVector fres = f.get();
    fres.div(masa);
    a.add(fres);
  }
  
  void run() {
    update();
    display();
  }

  void update(){
    v.add(a);
    r.add(v);
    lifespan -= 1.0;
    a.set(0,0);
  }
  
  void display(){
    altura -= dt;
    if(lifespan>0){
      noStroke();
      fill(239,179,4);
      pushMatrix();
        translate(r.x, altura);
        ellipse(0,0,25,25);
      popMatrix();
      explosion = 1;
    }
    else{
      if(explosion == 1){
        this.addParticle();
        explosion = 0;
      }
      for(int i = particles.size()-1; i>0; i--){
        Particula p = particles.get(i);
        p.run();
        if(p.isDead()){
          particles.remove(i);
        }
      }
    }
  }
  
  void addParticle() {
    
    for(int i = 0; i < npart; i++){
      particles.add(new Particula(r));
    }
  }
  
  boolean dead() {
    return particles.isEmpty();
  }
}
//Clase que define el objeto PARTICULA

class Particula {
  PVector location;
  PVector velocity;
  PVector gravedad;
  PVector acceleration;
  float lifespan;
  float m = 1000.0;
  float colorR, colorG, colorB;
  float angle;
  
  
  Particula(PVector l) {
    angle = random(0, 3*PI);
    acceleration = new PVector(0,0.0);
    gravedad = new PVector(0.0, 9.8);
    velocity = new PVector(12,12);
    location = l.get();
    lifespan = 255.0;
    velocity.x *= cos(angle);
    velocity.y *= sin(angle);
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    applyForce(gravedad);
    lifespan -= 2.0;
  }

  
  
  //Sumatorio de Fuerzas:
  void applyForce(PVector f1){
    PVector f2 = f1.get();
    f2.div(m);
    acceleration.add(f2);
  }
  
  // Method to display
  void display() {
    colorR = random(0,255);
    colorG= random(0,255);
    colorB= random(0,255);
    noStroke();
    fill(239,179,4,lifespan);
    ellipse(location.x,location.y,25,25);
  }
  
  //COmprueba si tiene que dejar de verse
  boolean isDead() {
    return (lifespan < 0.0);
  }

}


