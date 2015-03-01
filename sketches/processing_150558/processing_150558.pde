
/*************************

Alumno: Ignacio Dolz MonzÃ�Â³
Practica2: Emisores. Simula, modela y visualiza un cohete de fuegos artificiales empleando nuestros emisores de particulas.Ã�Â§
Mediante la interaccion del viento que se representa por un vector en la parte superior y la fuerza de la gravedad.
Asignatura: simulaciÃ�Â³n.
Centro: Universidad de valencia IngenierÃ�Â­a multimedia

************************/

ArrayList <Cohete> castillo;
int npart=1;
float dt=0.5;
int tipoExp=3;
int num_exp;
PVector wind;
PVector gravity= new PVector(0,9.8);


void drawVector(PVector v, PVector loc, float scayl) {
  
  pushMatrix();
  float arrowsize = 4;
  // Translate to location to render vector
  translate(loc.x,loc.y);
  stroke(255);
  // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
  rotate(v.heading2D());
  // Calculate length of vector & scale it to be bigger or smaller if necessary
  float len = v.mag()*scayl;
  // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
  line(0,0,len,0);
  line(len,0,len-arrowsize,+arrowsize/2);
  line(len,0,len-arrowsize,-arrowsize/2);
  popMatrix();
}



void setup(){
   size(460,500);
  castillo= new ArrayList<Cohete>();
}

void draw(){
  background(0);
  if(tipoExp==0){
    
    text("Tipo de explosion estandar ",width-240, 30);
    
  }
  
  else if(tipoExp==1){
    
    text("Tipo de explosion  circular ",width-240,  30);
    
  }
  
  else if(tipoExp==2){
    
    text("Tipo de explosion  elipse ",width-240, 30);
    
  }
  
  else if(tipoExp==3){
    
    text("Tipo de explosion  multiple ",width-240,  30);
  }
   else if(tipoExp==4){
    
    text("Tipo de explosion   cono ",width-240, 30);
    
  }
  
 //Flecha del viento y calculo del viento segun la posicion de raton
 float dx = map(mouseX,0,width,-0.2,0.2);
  wind = new PVector(dx*75, 0);
 drawVector(wind, new PVector(width/2,70,0),15);
 
  for(int i=0; i<castillo.size();i++){ //creacion de un array de particulas, que simula castillo
    Cohete c = castillo.get(i);
    c.run();
  }
  
  fill(255);
  text("frate: "+ frameRate,15,15);
  text("Num Part: " +npart,15,35); 
     

}

void mousePressed(){
 if (mousePressed){  
    PVector pos = new PVector(mouseX,mouseY);
    Cohete c= new Cohete(pos, 150, tipoExp);  //creacion de una particula con una posicion y un tiempo de vida
    castillo.add(c);
    
    if(tipoExp==3){
      num_exp=1;
    }
  }
  
}

 void keyPressed(){
   
  if (key == '0'){
    tipoExp = 0; 
  }
  else if (key == '1'){
    tipoExp = 1; 
  }
  else if (key == '2'){
    tipoExp = 2; 
  }
  else if (key == '3'){
    tipoExp = 3; 
    
  }
   else if (key == '4'){
    tipoExp = 4; 
   }
 }



// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class Cohete {
  
  ArrayList<Particula> particles;
  PVector locat_Cohe;
  PVector veloc_Cohe;
  PVector acce_Cohe;
  float masa_cohe=5.0;
  float lifespan_Cohe; 
  boolean explosion= false; 
  int tipo=0;

  Cohete(PVector locat, float life, int tipoExp) {
    tipo= tipoExp;
    acce_Cohe = new PVector(0,0);
    veloc_Cohe = new PVector(0,random(20,30));
    locat_Cohe = locat.get();
    locat_Cohe.y= height;
    lifespan_Cohe= life;
    particles = new ArrayList<Particula>();   // Inicializamos array de partÃ�Â­culas
  }
  
  void applyForce_Cohe(PVector force) {
    PVector fuerza_Cohe = force.get();
    fuerza_Cohe.div(masa_cohe);
    acce_Cohe.add(fuerza_Cohe);
  }
  
    //aÃ�Â±adimos las particulas al cohete
  void Partilucas_Cohe(){
    if(tipo==3)
      npart=100;
    else
      npart=150;
      
    for(int  i = 0; i < npart; i++){
    PVector pos = new PVector(locat_Cohe.x, locat_Cohe.y);
    particles.add(new Particula(pos,tipo)); 
    }
  }
 
  
   void run() {
    update();
    display();
  }

    // Actualizamos posiciÃ�Â³n del cohete
  void update() {
    applyForce_Cohe(gravity);
    applyForce_Cohe(wind);
    veloc_Cohe.sub(PVector.mult(acce_Cohe,dt*0.5));
    locat_Cohe.sub(PVector.mult(veloc_Cohe, dt));
    lifespan_Cohe -= 1.0;
    
    acce_Cohe= new PVector(0,0);
  }
  
  //Metodo de pintado para el cohete
  void display(){
    //Mientras le queden frames de vida el cohete sube
    if (veloc_Cohe.y > 0){
      stroke(120);
     fill(255);
     ellipse(locat_Cohe.x,locat_Cohe.y,2.5,2.5);
     explosion= true;
    }
    
    else{
      if(explosion){
        this.Partilucas_Cohe();
        explosion = false;
      }
  //Dibuja explosiÃ�Â³n de partÃ�Â­culas de array creado previamente
      for (int i = particles.size()-1; i >=0; i--) {
        Particula p = particles.get(i);
        p.run();
          if (p.isDead()) {
            particles.remove(i);
         }  
       }  
    }
  }
}

class Particula {
  
  ArrayList<Particula> particula;
  PVector location= new PVector(0,0);
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float masa=50;
  float angle;
  boolean exp=false;
  int tipo;
  
  Particula(PVector pos, int tipoExp) {
    tipo= tipoExp;
    
    acceleration = new PVector(0,0);
    
    if(tipo==0){ //explosion estandar
      angle= random(0,2*PI);
    velocity = new PVector(random(4,8),random(-2,4)); 
    }
    
   else if(tipo==1){ //circuo
    angle= random(0,2*PI);
      velocity= new PVector(6,6);
    }
    
    else if(tipo==2){ //elipse
    angle= random(0,2*PI);
       velocity= new PVector(random(7,9),random(2,3));
    }
    
   else  if(tipo==3){ //multiple
    particula=  new ArrayList<Particula>();
      velocity= new PVector(random(12,17),random(8,13));
    angle= random(0,2*PI);   
    }
    
    else if(tipo==4){ //cono
      angle= random(PI/4,2*PI/4);
      velocity= new PVector(8,8);
    }
      
      
    
    velocity.x= velocity.x*cos(angle)*dt;
    velocity.y= velocity.y*sin(angle)*dt;
    location = pos;
    lifespan = int(random(150,200));
    
  }
  
    //F=m*a  
    void applyForce_Particula(PVector force) {
    PVector f = force.get();
    f.div(masa);
    acceleration.add(f);
    }

 
 void Particulas(){
    for(int  i = 0; i < int(random(1,2)) ; i++){
    PVector pos = new PVector(location.x, location.y);
    particula.add(new Particula(pos,tipo)); 
    }
  }


  void run() {
    update();
    display();
  }
 

  // Method to update location de la particula.
  void update() {
    applyForce_Particula(gravity);
    applyForce_Particula(wind);
    velocity.sub(PVector.mult(acceleration,dt));
    location.sub(PVector.mult(velocity, dt));
    
    if(tipo==3) 
      lifespan -= 1.6;
    else
      lifespan -= 0.8;
    
    //reiniciamos el vector aceleracion
    //acceleration.set(0,0);
    acceleration= new PVector(0,0);
  }

  // Method to display //dibujamos partilula
  void display() {
    
    if(tipo!=3 || num_exp==0){
    noStroke();
    fill(random(0,255),random(0,255),random(0,255),lifespan);
    ellipse(location.x,location.y,7,7);
    
    }    
    
    if(tipo==3){
      if(lifespan>=150 && num_exp>0){
        noStroke();
        fill(random(0,255),random(0,255),random(0,255),lifespan);
        ellipse(location.x,location.y,7,7);
    
         exp=true;
     
       if(lifespan==150){
         num_exp--;
       }
      }
      
    else if(exp){
      this.Particulas();
      exp=false;
    }
    
      for(int i = particula.size()-1; i >=0; i--){
        Particula p = particula.get(i);
        p.run();
        
        if(p.isDead()){
          particula.remove(i);
        }
      }
    }
  }
  
  // si la particula debe desaparecer.
  boolean isDead() {
    if (lifespan < 0.0)
      return true;
    
    else 
      return false;
    
  }
}





