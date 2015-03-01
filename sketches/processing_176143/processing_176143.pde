
Flock flock;
boolean ok=false; // variable para cerrar la jaula 
float incr;
//PImage img, img2, img3, img4;

void setup() {
  size(840, 560, P2D);
  /*img= loadImage("tex.jpg");
  img2= loadImage("oveja.jpg");
  img3= loadImage("piedra.png");
  img4= loadImage("wolf.png");*/
  noStroke();
  
  flock = new Flock();
  // Añade las presas
  for (int i = 0; i < 50; i++) {
    flock.addBoid(new Boid(width/2,height/2, 0));
  }
  // añade los planos para q reboten (jaula)
  anyadeobstaculos();

  
}

void draw() {
  background(0);  
  
  //arranca el programa
  flock.run();
  fill(255,255,255);
  text(int(frameRate)+ " FPS",20,30);
  text("Pulsa una tecla para cerrar la valla",20,50);
}

//Funcion que añade los planos / jaula en el mapa
void anyadeobstaculos(){
  incr=300;
  for(int i=0; i<=10;i++){
    flock.addObstaculo(new Boid(30,incr, 2));
    incr+=20;
  }
  incr=300;
  for(int i=0; i<=10;i++){
    flock.addObstaculo(new Boid(210,incr, 2));
    incr+=20;
  }
  incr=30;
  for(int i=0; i<=8;i++){
    flock.addObstaculo(new Boid(incr,500, 2));
    incr+=20;
  }
  
  
  //paredes de los bordes
  incr=10;
  for(int i=0; i<=41;i++){
    flock.addObstaculo(new Boid(incr,10, 2));
    incr+=20;
  }
  
  incr=10;
  for(int i=0; i<=41;i++){
    flock.addObstaculo(new Boid(incr,550, 2));
    incr+=20;
  }
  incr=10;
  for(int i=0; i<=26;i++){
    flock.addObstaculo(new Boid(10,incr, 2));
    incr+=20;
  }
  incr=10;
  for(int i=0; i<=26;i++){
    flock.addObstaculo(new Boid(830,incr, 2));
    incr+=20;
  }
  
       
}


//Añade un depredador 
void mousePressed() {
  flock.addBoid(new Boid(mouseX,mouseY, 1));
  
}

//Reposiciona al depredador dependiendo de la posicion del ratón 
void mouseMoved(){
 flock.mover(mouseX, mouseY);
  
}

//Funcion que pulsando una tecla cualquiera cierra la jaula
void keyPressed(){
  if(!ok){
    ok=true;
    incr=30;
    for(int i=0; i<=8;i++){
    flock.addObstaculo(new Boid(incr,300, 2));
    incr+=20;
    }
    
  }else{ 
    flock.removeObstaculo();
    ok=false;
  }
}


// The Flock (Grupo de Boids, Manada)

class Flock {
  ArrayList<Boid> boids; // Boids que hacen de presa
  ArrayList<Boid> pred; //Boids que hacen de depredador 
  ArrayList<Boid> obstaculo; // Array de planos (jaula)
  boolean ok;

  Flock() {
    boids = new ArrayList<Boid>();
    pred = new ArrayList<Boid>();
    obstaculo = new ArrayList<Boid>();
  }

  void run() {
    //inicializacion de Boids presa
    for (Boid b : boids) {
      b.run(boids, pred, obstaculo);  
    }
    //inicializacion de Boids depredador
    for (Boid p : pred) {
      p.run2(boids, pred, obstaculo); 
    }
    for (Boid o : obstaculo) {
      o.run3(obstaculo); 
    }
    
  }
  
  void removeObstaculo(){
    for(int i=0; i<=8;i++)
    obstaculo.remove(obstaculo.size()-1);
  }
    
    
  

  //Añade boids al array (dependiendo de si es presa o depredador
  void addBoid(Boid b) {
    if(b.type==1) pred.add(b);
    else boids.add(b);
  }
  
  //Añade un plano al array de planos
  void addObstaculo(Boid o) {
     obstaculo.add(o);
  }
  
  //Actualiza la posicion del void si la modificamos mediante raton
  void mover(float x, float y){
    for (Boid p : pred) {
      p.mover(x, y);  
    }
    
  }


}
// The Boid class

class Boid {

  int type; //Para diferenciar si es presa, depredador o obstaculo
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector f;
  PVector sep;
  PVector ali;
  PVector coh;
  PVector eva;
  PVector obst;
  float r; 
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float maxevade;    // Maxima evasion
  float maxpurse;    // Maximo seguimiento
  float e;
  float angle;

  Boid(float x, float y, int d) {
    acceleration = new PVector(0, 0);
    type=d;
    // velocity = PVector.random2D();

    // Leaving the code temporarily this way so that this example runs in JS
    angle= random(TWO_PI);
    velocity = new PVector(cos(angle), sin(angle));

    location = new PVector(x, y);
    r = 4.0;
    maxspeed = 2;
    maxforce = 0.03;
    maxevade = 2.3;
    maxpurse = 4;
    e=maxevade;
  }

  void run(ArrayList<Boid> boids, ArrayList<Boid> pred, ArrayList<Boid> obs) { // Para boids presa
    flock(boids, pred, obs);
    update();
    borders();
    render();
  }

  void run2(ArrayList<Boid> boids, ArrayList<Boid> pred, ArrayList<Boid> obs) { //Para boids depredador
     f=purse(boids, pred);
     f.mult(maxpurse);
     applyForce(f);
     f=evade(pred, obs);
     applyForce(f);
     update();
     borders();
    render();
  }
  void run3(ArrayList<Boid> obs) { //Para obstaculos
    render();
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids, ArrayList<Boid> pred, ArrayList<Boid> obs) {

    sep = separate(boids);   // Separation
    ali = align(boids);      // Alignment
    coh = cohesion(boids);   // Cohesion
    eva = evade(boids, pred); // Evasion
    obst = evade(boids, obs);
    // Arbitrarily weight these forces
    sep.mult(2.0);               
    ali.mult(1.0);
    coh.mult(1.0);
    eva.mult(maxevade);
    obst.mult(e);
    // Añade a la aceleracion las fuerzas resultantes
    applyForce(eva);
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
    applyForce(obst);
  }

  // Method to update location
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  //Actualiza posicion del Boid mediante raton
  void mover(float x, float y) {
    location.x= x;
    location.y= y;
  }

  PVector evade(ArrayList<Boid> boids, ArrayList<Boid> pred) {
    PVector sum = new PVector();
    PVector pr= new PVector(location.x+velocity.x, location.y+velocity.y); //prediccion
    float m=80;

    for (int i = 0; i < pred.size (); i++) {
      Boid predator = (Boid) pred.get(i);
      float distance = location.dist(predator.location); // mide la distancia entre los Boids
      sum.normalize();

      if (predator.type==2) { 
        m=10; 
        e=100000;
      } else m=80;

      if (distance < m) { // A partir de cierta distancia empieza a evadir 
        sum = PVector.sub(pr, predator.location);
      }
    }
    return sum;
  }
  PVector purse(ArrayList<Boid> boids, ArrayList<Boid> pred) {
    PVector sum = new PVector();
    PVector pr= new PVector(location.x+velocity.x, location.y+velocity.y); //prediccion
    for (int i = 0; i < boids.size (); i++) {
      Boid presa = (Boid) boids.get(i);
      float distance = location.dist(presa.location);
      float v=maxspeed*distance/90; // variable de Arrive
      maxpurse=v;
      sum.normalize();
      if (distance < 90) {
        sum = PVector.sub(presa.location, pr);
      }
    }

    return sum;
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target
    // Scale to maximum speed
    desired.normalize();
    desired.mult(maxspeed);

    // Above two lines of code below could be condensed with new PVector setMag() method
    // Not using this method until Processing.js catches up
    // desired.setMag(maxspeed);

    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + radians(90);
    // heading2D() above is now heading() but leaving old syntax until Processing.js catches up
    if (type==0) {




      noStroke();
      pushMatrix();

      translate(location.x, location.y);
      rotate(theta);
      beginShape(TRIANGLES);
      fill(0, 255, 0);
      vertex(0, -r*2);
      vertex(-r, r*2);
      vertex(r, r*2);
      endShape();
      popMatrix();
      PVector dir = velocity.get();
      dir.normalize();
      line(location.x, location.y, location.x + dir.x*12, location.y + dir.y*12);
    } else if (type==1) {

      noStroke();
      pushMatrix();

      fill(255, 0, 0);
      ellipse(location.x, location.y, r*4, r*4);
      popMatrix();
    } else {
      fill(200, 200, 200);
      ellipse(location.x, location.y, 10, 10);
      noStroke();
    }
  }

  // Wraparound
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // First two lines of code below could be condensed with new PVector setMag() method
      // Not using this method until Processing.js catches up
      // steer.setMag(maxspeed);

      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      // First two lines of code below could be condensed with new PVector setMag() method
      // Not using this method until Processing.js catches up
      // sum.setMag(maxspeed);

      // Implement Reynolds: Steering = Desired - Velocity
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.location); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the location
    } else {
      return new PVector(0, 0);
    }
  }
}



