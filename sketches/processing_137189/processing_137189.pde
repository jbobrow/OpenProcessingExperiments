
//based heavily on Nature of Code example 4_09_Additive Blending by Daniel Shiffman, natureofcode.com

ParticleSystem ds;

PImage dogeimg;
PImage sparkle;
PImage dogecoin;
PFont font;


ArrayList<ParticleSystem> systems;

void setup() {
  size(1000, 750, P2D);

  systems = new ArrayList<ParticleSystem>();

  dogecoin = loadImage("dogecoin.png");
  dogeimg = loadImage("dogenowords2.jpg");
  sparkle = loadImage("sparkles.png");

  ds = new ParticleSystem(0, new PVector(0, 0));  //the second Pvector is where the location is set
  font = loadFont("ComicSansMS-Bold-40.vlw");
  //  rgb = (ArrayOfColors[(int) random(ArrayOfColors.length)]);
}

void draw() {

  // blendMode(ADD);  //Other modes SUBTRACT, LIGHTEST, DARKEST, DIFFERENCE, EXCLUSION,or MULTIPLY.
  //background(255);


  for (ParticleSystem ds: systems) {
    ds.run();
    ds.addParticle();
  }
  imageMode(CENTER);
  image(dogeimg, width/2, height/2);

  //  pushMatrix();  //THE GOGGLES THEY DO NOTHING
  fill(255);
  textFont(font, 32);
  text("click mouse to add particle systems", 10, height-30);
  //  popMatrix();  //NOTHING!!!
}


void mousePressed() {
  systems.add(new ParticleSystem(1, new PVector(mouseX, mouseY)));
  textFont(font, random(6, 45));
}

//based heavily on Nature of Code example 4_09_Additive Blending by Daniel Shiffman, natureofcode.com

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;

  String[] words = { 
    "wow", "much processing", "very Java", "much codee", "very scare", "PVectro", "much force", "frictoin", 
    "wow", "very Newton", "much law",
  };

  int index = int(random(words.length)); 

  color[] ArrayOfColors = { 
    color(181, 230, 29), color(63, 72, 204), color(255, 174, 201), color(0, 162, 232), color(255, 127, 39), color(255, 242, 0), color(136, 0, 21), color(212, 176, 190), color(207, 209, 100), color(200, 120, 87)
  };
  color rgb = (ArrayOfColors[(int) random(ArrayOfColors.length)]);  //add psychedelic color spray


  Particle(PVector l) {
    // Boring example with constant acceleration  //I don't think it's boring
    acc = new PVector(0, 0.05, 0);
    vel = new PVector(random(-1, 1), random(-1, 0), 0);
    vel.mult(2);
    loc = l.get();
    lifespan = 60;  //under 50 is too low, 255 is kinda too high

  }

  void run() {
    update();
    render();
  }

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    lifespan -= 0.01;  //0.5 is really long, higher numbers are shorter
  }

  // Method to display
  void render() {




    imageMode(CENTER);
    tint(255, 255, 255, lifespan); 
    //tint(255, lifespan); 
    //tint(lifespan);
    image(dogecoin, loc.x, loc.y);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan <= 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

//based heavily on Nature of Code example 4_09_Additive Blending by Daniel Shiffman, natureofcode.com

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;        // An origin point for where particles are birthed

  PImage tex;

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList();              // Initialize the arraylist
    origin = v.get();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));    // Add "num" amount of particles to the arraylist
    }
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

  void addParticle() {
    float r = random(1);
    if (r <= 0.1) { 
      particles.add(new Particle(origin));
    } 
    else if (r <= 0.3 && r >0.1 ) {
      particles.add(new Words(origin));
    }
    else
    {
      particles.add(new Sparkle(origin));
    }
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } 
    else {
      return false;
    }
  }
}

//based heavily on Nature of Code example 4_05_Additive Blending by Daniel Shiffman, natureofcode.com


class Sparkle extends Particle {

  // We could add variables for only Confetti here if we so

  Sparkle(PVector l) {
    super(l);
  }

  // Inherits update() from parent

  // Override the display method
  void render() {
    imageMode(CENTER);
    tint(255, 255, 255, lifespan); 
    //tint(255, lifespan); 
    //tint(lifespan);

   image(sparkle, loc.x, loc.y);
  
  }
}

//based heavily on Nature of Code example 4_05_Additive Blending by Daniel Shiffman, natureofcode.com


class Words extends Particle {





  Words(PVector l) {
    super(l);
  }

  // Inherits update() from parent

  void render() {
    tint(255, 255, 255, lifespan); 
    fill(rgb);
    text((words[index]), loc.x, loc.y);
    //    image(sparkle, loc.x, loc.y);
  }
}



