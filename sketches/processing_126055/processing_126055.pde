

PFont font;
PFont font2;
boolean button= false;
ParticleSystem ps;
Deer deers;
PImage landscapeGrey;
PImage landscapeWhite;
PImage landscapeFront;
float lighter=1;
int x= 16;
int w= 100;
int a;

void setup() {
  size (800, 400);  //setup the size frame 
  smooth();
  landscapeWhite= loadImage ("data/landscapeWhite.png");
  landscapeGrey= loadImage ("data/landscapeGrey.png");
  landscapeFront= loadImage ("data/landscapeFront.png");
  font= loadFont ("KinoMT-100.vlw");
 // font2 = loadFont ("Serif-20.vlw");
  textFont (font);

  deers= new Deer();
  ps = new ParticleSystem (new PVector(0, 0)  );
}

void draw () {
  background (0);
  image (landscapeGrey, 0, 10);
  image (landscapeWhite, 0, 0);

  deers.display();
  deers.move();

  ps.origin.set(mouseX, 0);// here is where you set the snow
  ps.addParticle();
  ps.run();
   fill (0);
   textSize (150);
 text ("Let it snow", width/2, height/2+111);

  if ( mouseX> 0 ) {
    button = true;
  }
  else {
    button= false;
  }
  if (button) {
    fill (0+mouseX/2.7);
  } 
  else {
    fill (0);
  }

  textAlign (CENTER);
  textSize (150);
  
    text ("Let it snow", width/2, height/2+112);
  image (landscapeFront, 0,-10);
fill (#D8A2FA);

    textSize (25);
      text ("gently move your mouse from left to right", width/2, 375);
     
  
}

class Deer {
  int maxImages = 14; // total of images
  int imageIndex = 0; // initial image to be displayed is the first
  PImage [] images = new PImage [maxImages]; // the array of images
  int xspeed;
  int yspeed;
  int x, y;

PImage singleDeer;
  Deer () {
    xspeed = 18;
    yspeed= 16;
    x=0;
    y=80;
    for (int i= 0; i< images.length; i++) {
      images [i] = loadImage ("data/deerws" +i + ".png");
    }
    frameRate (10);
  }

  void move () {
    x+= xspeed;
    if (x >= width) {
      x= -145;
    }
  y+= yspeed;
    if ((y> height-210) || (y<90)) {
      yspeed =-yspeed;
    }
  }

  void display  () {
    image (images[imageIndex], x, y); // display one image
    // increment image index with one
    // use modulo "%" to return to 0 once the max of the array is reached
    imageIndex = (imageIndex +1) % images.length;
  }
}




class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }
  
void addParticle(float x, float y) {
    particles.add(new Particle(new PVector(x, y)));
  }


  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
float a,b;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random (-0.2,0.4), random(-3, 5));
    location = l.get();
    lifespan = 600.0;
  a= random (3,7);
  b= random (5,12);
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    noStroke();
   // strokeWeight(2);
        fill(150, lifespan);
    ellipse(location.x, location.y, b, b);
        fill(255, lifespan);
    ellipse(location.x, location.y, a, a);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}



