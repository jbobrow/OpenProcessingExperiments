
float counter = 0;
ParticleSystem ps; //aus ProcessingReferences - teilweise geändert


void setup()
{
  size(500, 500);
  background(100, 40, 10);


  ps = new ParticleSystem(new PVector(width/2, 50));
}

void draw() {
  background(0);
  ps.addParticle();
  ps.run();
}





// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector locationy) {
    origin = locationy.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    if (mouseX>=400)
    {
      for (int i = particles.size ()-1; i >= 1; i--) {
        Particle p = particles.get(i);
        p.run();
        if (p.isDead()) {
          particles.remove(i);
        }
      }
    }
  }
}


// A simple Particle class

/* class Particle {
  PVector locationy;
  PVector velocity1;
  PVector acceleration1;
  float lifespan1;

  Particle(PVector l) {
    acceleration1 = new PVector(0, 0.05);
    velocity1 = new PVector(random(-1, 1), random(-2, 0));
    locationy = l.get();
    lifespan1 = 255.0;
  }

  void run() {
    updatez();
    displayz();
  }

  // Method to updatez locationy
  void updatez() {
    velocity1.add(acceleration1);
    locationy.add(velocity1);
    lifespan1 -= 1.0;
  }
  float amplitude1 = map(sin(counter), -1, 1, 10, 360);

  // Method to displayz
  void displayz() {
    float amplitude1 = map(sin(counter), -1, 1, 10, 360);
    float rgb1 = map(mouseX, 0, 500, 167, 163);
    float rgb2 = map(mouseX, 0, 500, 223, 15);
    float rgb3 = map(mouseX, 0, 500, 234, 22);
    noStroke();
    fill(rgb1, rgb2, rgb3, amplitude1*3);
    triangle(locationy.x-240, locationy.y-45, locationy.x-260, locationy.y-45, locationy.x-250, locationy.y-30
      );
    ellipse(locationy.x-254, locationy.y-50, 15, 17);
    ellipse(locationy.x-246, locationy.y-50, 15, 17);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan1 < 0.0) {
      return true;
    } else {
      return false;
    }
  }


  {

    float amplitude1 = map(sin(counter), -1, 1, 10, 360);
    float rgb1 = map(mouseX, 0, 400, 167, 163);
    float rgb2 = map(mouseX, 0, 400, 223, 15);
    float rgb3 = map(mouseX, 0, 400, 234, 22);
    background(247, 238, 100);


    translate(width/2, height/2);
    fill(rgb1, rgb2, rgb3);// 32,178,170



    float arm1 = map(mouseX, 400, 0, 0, 500);
    float arm2 = map(400, mouseX, 0, 0, 500);
    
    //if Funktion
    
if (mouseX<400) {
  
     ellipse(0, 0, 100, 100);
    ellipse(0, arm1, 100, 100);
    ellipse(0, arm2, 100, 100);
    fill(247, 238, 100);
    ellipse(0, arm1, 50, 50);
    ellipse(0, arm2, 50, 50);
    noStroke();

}
  
    fill(rgb1, rgb2, rgb3, amplitude1);
    ellipse(0, 0, 55, 55);

    println(sin(counter));
    println(mouseX);
    counter += 0.1; /*
  }
}

