
//IRENE ALFARO. RV -  MUAD 2014
// CERVEZA PARTIENDO DEL CÓDIGO DE DANIEL SHIFFMAN 
//http://natureofcode.com
// Forces (Gravity and Fluid Resistence) with Vectors .
//CODIGO BASE.
//https://github.com/shiffman/The-Nature-of-Code-Examples/tree/master/chp2_forces/NOC_2_5_fluidresistance

 


// 700 moving bodies 
Mover[] movers = new Mover[700];

// Liquid
Liquid liquid;
Liquid espuma;

void setup() {
  size(300, 500);
  
  reset();
  // Create liquid object
  liquid = new Liquid(0, height/2, width, height/2, 0.1, #DBA901);
  espuma = new Liquid(0, 220, width, 50, 1, #F5DA81);
}

void draw() {
  background(255);
  
  // Draw cerveza & espuma
  liquid.display();
  espuma.display();

  for (int i = 0; i < movers.length; i++) {
    
    // Is the Mover in the liquid?
    //Comprobación de si las burbujas estan dentro del liquido cerveza
    if (liquid.contains(movers[i])) {
      // Calculate drag force
      PVector dragForce = liquid.drag(movers[i]);
      // Apply drag force to Mover
      movers[i].applyForce(dragForce);
    }
    //Comprobación de si las burbujas estan dentro del liquido cerveza
    if (espuma.contains(movers[i])) {
      // Calculate drag force
      PVector dragForce = espuma.drag(movers[i]);
      // Apply drag force to Mover
      movers[i].applyForce(dragForce);
    }
    // Gravity is scaled by mass here!
    PVector gravity = new PVector(0, -0.1*movers[i].mass);
    // Apply gravity
    movers[i].applyForce(gravity);
   
    // Update and display
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
  
  fill(0);
  text("click mouse to reset",10,30);
  
}

void mousePressed() {
  reset();
}

// Restart all the Mover objects randomly
void reset() {
  for (int i = 0; i < movers.length; i++) {
    //1º parametro massa,2º posicion en x,3º posicion en y.
    movers[i] = new Mover(random(0.5, 3),random(10, width-10), random(255, height));
  }
}

//COMPORTAMIENTO DEL FLUIDO
 // Liquid class 
 class Liquid {

  
  // Liquid is a rectangle
  float x,y,w,h;
  // Coefficient of drag
  float c;
  color col;

  Liquid(float x_, float y_, float w_, float h_, float c_, int col_) {
    x = x_;//posicion en x
    y = y_;// posicion en i
    w = w_;//ancho
    h = h_;//alto
    c = c_; //densidad del líquido (resistencia)
    col = col_; // variable de color
  }
  
  // Is the Mover in the Liquid?
  boolean contains(Mover m) {
    PVector l = m.location;
    return l.x > x && l.x < x + w && l.y > y && l.y < y + h;
  }
  
  // Calculate drag force
  PVector drag(Mover m) {
    // Magnitude is coefficient * speed squared
    float speed = m.velocity.mag();
    float dragMagnitude = c * speed * speed;

    // Direction is inverse of velocity
    PVector dragForce = m.velocity.get();
    dragForce.mult(-1);
    
    // Scale according to magnitude
    // dragForce.setMag(dragMagnitude);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }
  
  void display() {
    noStroke();
    fill(col);
    rect(x,y,w,h);
  }

}
//COMPORTAMIENTO DE LAS BURBUJAS

class Mover {

  // location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  // Mass is tied to size
  float mass;
  float sz;

  Mover(float m, float x, float y) {
    mass = m; 
    //println(mass);
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  // Newton's 2nd law: F = M * A
  // or A = F / M
  void applyForce(PVector force) {
    // Divide by mass 
    PVector f = PVector.div(force, mass);
    // Accumulate all forces in acceleration
    acceleration.add(f);
  }

  void update() {
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Location changes by velocity
    location.add(velocity);
    // We must clear acceleration each frame
    acceleration.mult(0);
  }
  
  // Draw Mover
  void display() {
    sz=mass*3;
    stroke(#886A08);
    strokeWeight(2);
    fill(#F7F2E0);
    ellipse(location.x, location.y, sz, sz);
  }
  
  // Bounce off bottom of window
  void checkEdges() {
    if (location.y <= 210+sz/2) {
      velocity.y = 0;  
      location.y = random(250,height);
      
    }
  }
}



