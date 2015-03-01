
ArrayList<Cohete> castillo;
float timeout;
PVector disparo;
PVector posicion;
PVector viento = new PVector(random(0.1,0.5),0);
PVector gravity= new PVector(0,9.8);
float delta_t = 0.4;
int npart = 1;
int estilo = 0;
int cantidad_part = 200;

void setup() {
  size(438,600);
  castillo = new ArrayList<Cohete>();
}

void draw() {
  background(0);
  fill(239,162,245);
  textSize(15);
  text("Leyenda teclado:",20,20);
  text("'0' - Estilo 0",50,40);
  text("'1' - Estilo 1",50,60);
  text("'2' - Estilo 2",50,80);
  
  if(estilo==0)
     text("-ESTILO 0-",300,20);
  if(estilo==1)
     text("-ESTILO 1-",300,20);
  if(estilo==2)
     text("-ESTILO 2-",300,20);
  
  for(int i = 0; i<castillo.size(); i++){
    Cohete c = castillo.get(i);
    c.run();
  }
  
}

void mousePressed(){
  if(mousePressed){
    PVector pos = new PVector(mouseX,mouseY);
    Cohete c = new Cohete(pos, cantidad_part, 100, estilo);
    castillo.add(c);
  }
}

void keyPressed(){
  
  if(key == '0'){
    estilo = 0;
  }else if(key == '1'){
    estilo = 1;
  }else if(key == '2'){
    estilo = 2;
  }
  
}
  
    
// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class Cohete {
  ArrayList<Particle> particles;
  ArrayList<Particle2> particles2;
  PVector origin;
  PVector v_cohete;
  PVector a_cohete;
  float m_cohete = 2.0;
  int tiemp_v;
  boolean disparar = false;
  int est;


  Cohete(PVector location, int num, int tiemp_vida, int estilo) {
    origin = location.get();
    origin.y = height;
    v_cohete = new PVector(0,random(40,50));
    a_cohete = new PVector(0,0);
    npart = num;
    tiemp_v = tiemp_vida;
    est = estilo;
    particles = new ArrayList<Particle>();
    particles2 = new ArrayList<Particle2>();
  }
  
  void addParticle() {    
    for(int i = 0; i<npart; i++) {
      particles.add(new Particle(origin,est));
      if(est==2)
        particles2.add(new Particle2(origin,est));
    }
  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
    applyForce(viento);
    applyForce(gravity);
    
    v_cohete.sub(PVector.mult(a_cohete, delta_t*0.5));
    origin.sub(PVector.mult(v_cohete,delta_t));
    tiemp_v -=1;
    
    a_cohete.set(0,0,0);
  }
  
  void display() {
    
    if(v_cohete.y > 0){
       stroke(120);
       fill(255);
       rect(origin.x, origin.y, 3, 7);
       disparar=true;
    }else{
      if(disparar){
        this.addParticle();
        disparar=false;
      }
    
      // Cycle through the ArrayList backwards, because we are deleting while iterating
      for (int i = particles.size()-1; i >= 0; i--) {
        Particle p = particles.get(i);
        p.run();
        if (p.isDead()) {
          particles.remove(i);
        }
        if(est == 2){
          Particle2 p2 = particles2.get(i);
          p2.run();
          
          if (p2.isDead()){
            particles2.remove(i);  
          }
        }
      }
    }
  }
  
   void applyForce(PVector force) { //Carga en la aceleración, la aceleración correspondiente a cada fuerza
    PVector f = force.get();
    f.div(m_cohete);
    a_cohete.add(f);
  }
}

 
// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector viento;
  float lifespan;
  float mass;
  float angle;
  int est;

  Particle(PVector l, int estilo) {
    acceleration = new PVector(0,0);
    est = estilo;
    angle = random(0,TWO_PI);
    
    switch(est){
      case 0:
        velocity = new PVector(random(3,5),random(-10,10));
        break;
      case 1:       
        velocity = new PVector(5,5);
        break;   
      case 2:
        velocity = new PVector(random(-15,15),2);
    }
    
    velocity.x = velocity.x*cos(angle);
    velocity.y = velocity.y*sin(angle);
    viento = new PVector(-2, 0);
    location = l.get();
    lifespan = 100.0;
    mass = 100;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    applyForce(gravity);
    applyForce(viento);
    velocity.sub(PVector.mult(acceleration, delta_t*0.5));
    location.sub(PVector.mult(velocity, delta_t));
    lifespan -= 2.0;
    
    acceleration.set(0,0);
  }

  // Method to display
  void display() {
    
    if(est == 0){
      stroke(255,lifespan);
      fill(0,0,255,lifespan);
      ellipse(location.x,location.y,3,3);
    }else if(est == 1){
      stroke(255,lifespan);
      fill(255,0,0,lifespan);
      ellipse(location.x,location.y,3,3);
    }else if(est == 2){
      stroke(255,lifespan);
      fill(0,255,0,lifespan);
      ellipse(location.x,location.y,3,3);
    }
  }
  
  // Is the particle still useful?
  boolean isDead() {
    return (lifespan < 0.0);
  }
  
  void applyForce(PVector force) { //Carga en la aceleración, la aceleración correspondiente a cada fuerza
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
}

// A simple Particle class

class Particle2 {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector viento;
  float lifespan;
  float mass;
  float angle;
  int est;

  Particle2(PVector l, int estilo) {
    acceleration = new PVector(0,0);
    est = estilo;
    angle = random(0,TWO_PI);
    
    velocity = new PVector(2,random(-15,15));
    
    velocity.x = velocity.x*cos(angle);
    velocity.y = velocity.y*sin(angle);
    viento = new PVector(-2, 0);
    location = l.get();
    lifespan = 100.0;
    mass = 100;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    applyForce(gravity);
    applyForce(viento);
    velocity.sub(PVector.mult(acceleration, delta_t*0.5));
    location.sub(PVector.mult(velocity, delta_t));
    lifespan -= 2.0;
    
    acceleration.set(0,0);
  }

  // Method to display
  void display() {
    stroke(255,lifespan);
    fill(0,255,255,lifespan);
    ellipse(location.x,location.y,3,3);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    return (lifespan < 0.0);
  }
  
  void applyForce(PVector force) { //Carga en la aceleración, la aceleración correspondiente a cada fuerza
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
}



