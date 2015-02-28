
/* Dont' touch me
 Coded by Rodrigo Amaya, 27 Nov 2013
 Native Processing Compatible/JS compatible
 */

//------------------------ INITIALISE VARIABLES ------------------------

int num = 100; //how many particles we'll have in the system. More particles = slower sketch.
int enemy_spawn_speed = 240; 
int score = 0;
int best_score = 0;

boolean life = true;

//Estados del juego
final int INTRO = 0, PLAYING = 1, DIED = 2;
int game_state = INTRO;

Particle[] particles = new Particle[num]; //Initialise array of particles of length "num"

/*//Paleta de colores originales
final color 
BACKGROUND = #1E1E11,  
PLAYER = #6A5500, 
ENEMIES = #B22A00,
TEXTCOL = #FFFFFF,
TEXTPLAY = #6A5500,
TEXTDIED = #B22A00;*/

//Paleta de colores originales
final color 
BACKGROUND = #1B78B2,  
PLAYER = #C0C0C0, 
ENEMIES = #FF3333,
TEXTCOL = #FFFFFF,
TEXTPLAY = PLAYER,
TEXTDIED = ENEMIES;

//------------------------ SETUP ---------------------------------------

void setup() {
  size(640, 480);
  //smooth();  //turn on anti-aliasing
  noStroke();
  background(BACKGROUND);

  //Iniciamos con una particula
  particles[0] = new Particle(new PVector(random(0, width), random(0, height)), 8, 12, 9);
}

//------------------------ DRAW ----------------------------------------

void draw() {

  background(BACKGROUND);
  textAlign(CENTER);
  textSize(32);
  
  switch (game_state) {
  case INTRO:
    fill(TEXTCOL);
    text("Don't touch me!", width/2, height/2);
    textSize(16);
    text("( Touch to start )", width/2, height/2+32);
    
    break;
  case PLAYING:
    //draw trails, trail length can be altered by making alpha value in fill() lower
    //fill(#1E1E11, 55);
    //rect(0, 0, width, height);
    fill(TEXTPLAY);
    text(score, width/2, height/2);
    textSize(16);
    text("Don't touch me!", width/2, height/2+32);

    //run all the particles in the array every frame
    if (frameCount % enemy_spawn_speed == 0 && life) {
      for (int i = 0; i < particles.length; i++) {
        if (particles[i] == null) {
          Particle p = new Particle(new PVector(random(0, width), random(0, height)), 8, 12, 9);
          particles[i] = p;
          break;
        }
      }
    }

    for (int i = 0; i < particles.length; i++) {
      if (particles[i] != null) {
        particles[i].run(mouseX, mouseY); //run() method takes two arguments - x and y values to apply forces to
      }
    }
    
    drawPlayer();
    
    break;
  case DIED:
    fill(TEXTDIED);
    text(score, width/2, height/2);
    textSize(16);
    text("( Touch to continue )", width/2, height/2+32);
    
    if(score > best_score) best_score = score;
    break;
  } 

  if(best_score > 0){
    fill(TEXTPLAY);
    textSize(10);
    textAlign(LEFT);
    text("Best score: " + best_score, 10, height-10);
  }

  //checkReset();
}

void mousePressed(){
  if(game_state == INTRO){
    game_state = PLAYING;
  } else if (game_state == DIED){
    reset();
    game_state = INTRO;
  }
}

void drawPlayer() {
  if (life && game_state == PLAYING) {
    ellipseMode(CENTER);

    stroke(PLAYER);
    fill(PLAYER);
    ellipse(mouseX, mouseY, 8, 8);

    //stroke(PLAYER);
    //stroke(#FFFFFF);
    noFill();
    ellipse(mouseX, mouseY, 8*10, 8*10);
  } else {
    game_state = DIED;
  }
}


void checkReset() {
  if (keyPressed) {
    if (key == 'r') {
      reset();
    }
  }
}

void reset() {
  life = true;
  score = 0;
  for (int i = 0; i < particles.length; i++) {
    particles[i] = null;
  }
  particles[0] = new Particle(new PVector(random(0, width), random(0, height)), 8, 12, 9);
}


//------------------------ OBJECT --------------------------------------

class Particle {
  /*
    PVector is a class in Processing that makes it easier to store
   values, and make calculations based on these values. It can make
   applying forces to objects much easier and more efficient!
   */
  PVector loc; //location vector
  PVector vel; //velocity vector
  PVector acc; //acceleration vector
  int sz;  //size of particle
  float gravity;  //gravity variable
  float mass;  //mass variable
  int velocityLimit = 15;  //the maximum velocity a particle can travel at
  float d;  //distance variable between particle and the target co-ordinates

  //CONSTRUCTOR
  Particle(PVector _loc, int _sz, float _gravity, float _mass) {
    loc = _loc.get();  //when calling loc, return current location of the selected particle
    vel = new PVector(0, 0);  //set vel and acc vectors to 0 as default
    acc = new PVector(0, 0);
    sz = _sz;
    gravity = _gravity;
    mass = _mass;
  }


  //method to render the particle. control how it looks here!
  void display() {
    ellipseMode(CENTER);
    //fill(d, 0, 255);
    fill(ENEMIES);
    stroke(ENEMIES);

    ellipse(loc.x, loc.y, sz, sz);
  }

  //math for attraction and repulsion forces
  //tx and ty are the co-ordinates attraction/repulsion will be applied to
  void forces(float tx, float ty) {
    PVector targetLoc = new PVector(tx, ty);  //creating new vector for attractive/repulsive x and y values
    PVector dir = PVector.sub(loc, targetLoc);  //calculate the direction between a particle and targetLoc
    d = dir.mag();  //calculate how far away the particle is from targetLoc
    dir.normalize();  //convert the measurement to a unit vector

    //calculate the strength of the force by factoring in a gravitational constant and the mass of a particle
    //multiply by distance^2
    float force = (gravity*mass) / (d*d);

    //if the mouse is pressed, turn on repulsion by multiplying direction by 1
    if (mousePressed) {
      dir.mult(1);
    }
    //else multiply the direction by -1 to switch the direction the particle travels in (attraction)
    else {
      dir.mult(-1);
    }

    //apply directional vector
    applyForce(dir);
  }

  //method to apply a force vector to the particle
  void applyForce(PVector force) {
    force.div(mass);
    acc.add(force);
  }

  //method to update the location of the particle, and keep its velocity within a set limit
  void update() {
    vel.add(acc);
    vel.limit(velocityLimit);
    loc.add(vel);
    acc.mult(0);

    //if (x-center_x)**2 + (y-center_y)**2 <= radius**2:
    //# inside circle

    //x^2 + y^2 <= r^2
    if (life) {
      float ar = pow(loc.x-mouseX, 2) + pow(loc.y-mouseY, 2);
      float cr0 = pow(8, 2);
      float cr1 = pow(8*10, 2);
      if (ar <= cr1 && ar >= cr0) {
        score++;
      } 
      else if (ar <= cr1 && ar <= cr0) {
        life = false;
      }
    }
  }

  //method to bounce particles of canvas edges
  void bounds() {
    if (loc.y > height || loc.y < 0) {
      vel.y *= -1;
    }
    if (loc.x > width || loc.x < 0) {
      vel.x *= -1;
    }
  }

  //main method that combines all previous methods, and takes two arguments
  //tx and ty are inherited from forces(), and set the attractive/repulsive co-ords
  void run(float tx, float ty) {
    if (life){   
      forces(tx, ty);
    }
    display();
    bounds();
    update();
  }
}
