
class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float timer;
  float amountParticles; 
  PImage img;
  

  // Another constructor (the one we are using here)
  Particle(PVector l,PImage img_,float amountParticles) {
    this.amountParticles = amountParticles;
    acc = new PVector(0.0,0.0,0.0);
    float x = (float) generator.nextGaussian()*0.3f;
    float y = (float) generator.nextGaussian()*0.3f - 1.0f;
    
    vel = new PVector(x,y,0);
    loc = l.get();
    timer = (float) amountParticles/20;
    img = img_;
  }

  void run() {
    update();
    render();
  }
  
  // Method to apply a force vector to the Particle object
  // Note we are ignoring "mass" here
  void add_force(PVector f) {
    acc.add(f);
  }  

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 2.5;
    acc.mult(0);
  }

  // Method to display
  void render() {
    imageMode(CORNER);
    float darkness = map(this.amountParticles, 15000, 255, 0, 0) + 1500;
    tint(255,100);
    image(img,loc.x-img.width/2,loc.y-img.height/2);
    tint(255,255);
  }

  // Is the particle still useful?
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

