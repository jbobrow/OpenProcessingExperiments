
/**
 * <strong>Merah Putih</strong> | 
 * Widianto Nugroho<br />
 * <br />
 * <span style="text-decoration: underline;">INSTRUKSI:</span><br />
 * Untuk melukis Merah Putih klik menggunakan mouse pada sembarang tempat di kanvas.<br />
 * Untuk memulai lagi ketikkan huruf 'r'.
 */

float lebar;
float pendek = 8;
float panjang = 64;
int jumlah = 17;

Flock flock;

void setup()
{
  size(730, 420);
  background(0);

  flock = new Flock();

  smooth();
}

void draw()
{
  flock.run();
}

void mousePressed()
{
  flock.addBoid(new Boid(new PVector(mouseX,mouseY), 2.0f, 0.05f, 255, 255, 255, random(pendek, panjang), random(1, 24), random(4), random(4)));
}

void keyPressed()
{
  if (key == 'r' || key == 'R') {
    setup();
  }
}


// The Boid class

class Boid
{
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

    // warna boid
  float merah;
  float hijau;
  float biru;

  float ubahsudut1;
  float ubahsudut2;

  float lebar;

  Boid(PVector l, float ms, float mf, float _merah, float _hijau, float _biru, float _lebar, float _r, float _ubahsudut1, float _ubahsudut2)
  {
    acc = new PVector(0,0);
    vel = new PVector(random(-1, 1),random(-1, 1));
    loc = l.get();
    r = _r;
    maxspeed = ms;
    maxforce = mf;

    merah = _merah;
    hijau = _hijau;
    biru = _biru;

    ubahsudut1 = _ubahsudut1;
    ubahsudut2 = _ubahsudut2;

    lebar = _lebar;
  }

  void run(ArrayList boids)
  {
    flock(boids);
    update();
    borders();
    bentuk1();
    bentuk2();
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList boids)
  {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    // Arbitrarily weight these forces
    sep.mult(2.0);
    ali.mult(1.0);
    coh.mult(1.0);
    // Add the force vectors to acceleration
    acc.add(sep);
    acc.add(ali);
    acc.add(coh);
  }

  // Method to update location
  void update()
  {
    // Update velocity
    vel.add(acc);
    // Limit speed
    vel.limit(maxspeed);
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }

  void seek(PVector target)
  {
    acc.add(steer(target,false));
  }

  void arrive(PVector target)
  {
    acc.add(steer(target,true));
  }

  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steer(PVector target, boolean slowdown)
  {
    PVector steer;  // The steering vector
    PVector desired = target.sub(target,loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0)) desired.mult(maxspeed*(d/100.0)); // This damping is somewhat arbitrary
      else desired.mult(maxspeed);
      // Steering = Desired minus Velocity
      steer = target.sub(desired,vel);
      steer.limit(maxforce);  // Limit to maximum steering force
    } 
    else {
      steer = new PVector(0,0);
    }
    return steer;
  }

  void bentuk1()
  {
    // Draw a triangle rotated in the direction of velocity
    float theta = vel.heading2D() + PI/2;
    smooth();
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta*ubahsudut1);

    //strokeWeight(abs(0.005*leftp));
    fill(255, 0, 0, 32);
    noStroke();
    rect(r, r, lebar, 1);

    popMatrix();
  }

  void bentuk2()
  {
    // Draw a triangle rotated in the direction of velocity
    float theta = vel.heading2D() + PI/2;
    smooth();
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta*ubahsudut2);

    //strokeWeight(abs(0.005*leftp));
    fill(255, 32);
    noStroke();
    rect(r, r, lebar, 1);

    popMatrix();
  }

  // Wraparound
  void borders()
  {
    if (loc.x < -r) {
      loc.x = width+r;
      merah = random(255);
      hijau = random(255);
      biru = random(255);
    }
    if (loc.y < -r) {
      loc.y = height+r;
      merah = random(255);
      hijau = random(255);
      biru = random(255);
    }
    if (loc.x > width+r) {
      loc.x = -r;
      merah = random(255);
      hijau = random(255);
      biru = random(255);
    }
    if (loc.y > height+r) {
      loc.y = -r;
      merah = random(255);
      hijau = random(255);
      biru = random(255);
    }
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList boids)
  {
    float desiredseparation = 25.0;
    PVector sum = new PVector(0,0,0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = loc.dist(other.loc);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = loc.sub(loc,other.loc);
        diff.normalize();
        diff.div(d);        // Weight by distance
        sum.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      sum.div((float)count);
    }
    return sum;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList boids)
  {
    //float neighbordist = 50.0;
    float neighbordist = 25.0;
    PVector sum = new PVector(0,0,0);
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = loc.dist(other.loc);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.vel);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.limit(maxforce);
    }
    return sum;
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion (ArrayList boids)
  {
    float neighbordist = 50.0;
    PVector sum = new PVector(0,0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = loc.dist(other.loc);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.loc); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      return steer(sum,false);  // Steer towards the location
    }
    return sum;
  }
}

// The Flock (a list of Boid objects)

class Flock
{
  ArrayList boids; // An arraylist for all the boids

    Flock()
  {
    boids = new ArrayList(); // Initialize the arraylist
  }

  void run()
  {
    for (int i = 0; i < boids.size(); i++) {
      Boid b = (Boid) boids.get(i);  
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }
}




