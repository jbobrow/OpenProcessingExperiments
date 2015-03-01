
//Práctica 2 de Simulación: Fuegos artificiales
//Juan Carlos Leal de la Rosa y Pablo Casanova Salas

ArrayList<Cohete> castillo;
float dirWind = 1;
String sWind = "Derecha";
PVector wind = new PVector(0.08*random(18.5,20), 0);//0.012*random(-5,0));
PVector gravity = new PVector(0, 9.8);
float dt = 0.4;
int npart = 1;
int nExp;
int tipo = 3; //tipo de partículas


void setup(){
  size(800,500);
  castillo = new ArrayList<Cohete>();  
}

void draw(){
  background(0);
  
  for(int i = 0; i < castillo.size(); i++){
    Cohete c = castillo.get(i);
    c.run();
  }
  
  fill(255);
  text("frate: " + frameRate, 15, 15);
  text("Num Part: " + npart, 15, 35);
  
  if(dirWind > 0){
    text("Dir. Viento: "+sWind, 15, 55);
  }
  else{
    text("Dir. Viento: "+sWind, 15, 55);
  }
  
  if(tipo == 0)
    text("Explosión: Clásico", 15, 75);
  else if(tipo == 1)
    text("Explosión: Círculo", 15, 75);
  else if(tipo == 2)
    text("Explosión: Elipsis", 15, 75);
  else if(tipo == 3)
    text("Explosión: Arco", 15, 75);
  else if(tipo == 4)
    text("Explosión: Múltiple", 15, 75);
    
}

void mousePressed(){
  if(mousePressed){      
    PVector pos = new PVector(mouseX, mouseY);
    Cohete c = new Cohete(pos, 100, tipo);//int(random(0,4))); //tiempo en frames hasta la explosión
    castillo.add(c);
    
    if(tipo == 4)
      nExp = 1;
    
  }    
}

void keyPressed(){
  if(key == 'z'){
    tipo = 0;
  }
  else if(key == 'x'){
    tipo = 1;
  }
  else if(key == 'c'){
    tipo = 2;
  }
  else if(key == 'v'){
    tipo = 3;
  }   
  else if(key == 'b'){
    tipo = 4;
  }
  else if(key == 'r'){
    tipo = int(random(0,3));
  }
  
  if(keyCode == RIGHT){
    dirWind *= -1;
    sWind = "Derecha";
  }
  else if(keyCode == LEFT){
    dirWind *= -1;
    sWind = "Izquierda";
  }
}

// Clase Cohete

class Cohete{
  ArrayList<Particle> particle;
  PVector locationCoh;
  PVector velocityCoh;
  PVector accelerationCoh;
  float lifespanCoh;
  float masaCoh = 5.0;
  boolean explosion = false;  
  int tipo = 0; //tipo de partículas
  
  Cohete(PVector c, float life, int tip){
    accelerationCoh = new PVector(0,0);
    velocityCoh = new PVector(0,random(18,30));
    locationCoh = c.get();
    locationCoh.y = height;
    lifespanCoh = life;
    particle = new ArrayList<Particle>();
    tipo = tip;
  }
  
  void applyForce(PVector f){
    PVector force = PVector.div(f.get(), masaCoh);
    accelerationCoh.add(force);
  }
  
  void addParticles(){
    if(tipo == 4)
      npart = 25;
    else
      npart = 150;
      
    for(int  i = 0; i < npart; i++){
      PVector pos = new PVector(locationCoh.x, locationCoh.y);
      particle.add(new Particle(pos, tipo));
    }
  }
 
  void run(){
    update();
    display();
  }
  
  // Método para actualizar la posición
  void update(){
    wind.x = wind.x * dirWind;
    applyForce(wind);
    applyForce(gravity);
    //Integrador RK2
    velocityCoh.sub(PVector.mult(accelerationCoh, dt*0.5));
    locationCoh.sub(PVector.mult(velocityCoh, dt));
    lifespanCoh -= 1.0;
    
    //Reiniciamos el PVector acceleration
    accelerationCoh = new PVector(0,0);
    
  }
  
  // Método display para el cohete
  void display(){    
    if(velocityCoh.y > 0){
      stroke(120);
      fill(255);
      rect(locationCoh.x, locationCoh.y, 3, 7);
      explosion = true;
    } 
    else{
      if(explosion){
        this.addParticles();
        explosion = false;
      }
      
      for(int i = particle.size()-1; i >= 0; i--){
        Particle p = particle.get(i);
        p.run();
        
        if(p.isDead()){
          particle.remove(i);
        }
      }
    }     
  }
}
// Clase Particula

class Particle{
  ArrayList<Particle> particle;
  PVector location = new PVector(0,0);
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float masa = 40;
  float angle;
  boolean exp = false;
  int tipo;
  
  
  Particle(PVector pos, int tip){
    tipo = tip;
    
    acceleration = new PVector(0,0);
    angle = random(0, 2*PI);
    
    //Calculo del radio de la explosión velocity = radio
    if(tipo == 0){ //Normal
      velocity = new PVector(random(3,5), random(-4,6));
    }
    else if(tipo == 1){ //Círculo
      velocity = new PVector(4, 4);  
    }
    else if(tipo == 2){ //Elipsis
      velocity = new PVector(random(2,4), random(5,7));
    }
    else if(tipo == 3){ //Arco
      velocity = new PVector(6,8);
      angle = random(0, PI);  
    }
    else if(tipo == 4){ //Múltiple
      particle = new ArrayList<Particle>();
      velocity = new PVector(random(10,15), random(8,13));
    }
    //Velocidad = Radio* Cos * dt
    //El radio es nuestro vector velocidad
    velocity.x *= cos(angle)*dt;
    velocity.y *= sin(angle)*dt;
    location = pos;
    lifespan = int(random(150,220));
  }
  
  //F = m * a
  void applyForceP(PVector f){
    PVector force = PVector.div(f.get(), masa);
    acceleration.add(force);
  } 
 
  void addParticles(){
    for(int i = 0; i < int(random(1,3)); i++){
      PVector pos = new PVector(location.x, location.y);
      particle.add(new Particle(pos, tipo));
    }
  }
  
  void run(){
    update();
    display();
  }
  
  //Método para actualizar la posición
  void update(){
    wind.x = wind.x * dirWind;
    applyForceP(wind);
    applyForceP(gravity);
    velocity.sub(PVector.mult(acceleration, dt*0.5));
    location.sub(PVector.mult(velocity, dt));
    
    if(tipo == 4)
      lifespan -= 1.5;
    else
      lifespan -= 1.0;
    
    //Reiniciamos el PVector acceleration
    acceleration = new PVector(0,0);
  }
  
  //Método para el display
  void display(){
    if(tipo != 4 || nExp == 0){
        stroke(random(0,255),random(0,255),random(0,255),lifespan);
        fill(random(0,255),random(0,255),random(0,255),lifespan);
        ellipse(location.x, location.y, 3, 3);
    }
    
    if(tipo == 4){
      if(lifespan >= 130 && nExp > 0){
        stroke(105);
        fill(255);
        ellipse(location.x, location.y, 3.5, 3.5);
        
        exp = true;
      
        if(lifespan == 130){
          nExp--;
        }
      }    
      else if(exp){
          this.addParticles();
          exp = false;
      }
          
      for(int i = particle.size()-1; i >= 0; i--){
        Particle p = particle.get(i);
        p.run();
        
        if(p.isDead()){
          particle.remove(i);
        }
      }
    }
  }
  
  //Si la partícula está muerta
  boolean isDead(){
    if(lifespan < 0.0)
      return true;
    else
      return false;    
  }     
}



