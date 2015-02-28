
import damkjer.ocd.*;

import processing.opengl.*;
int a = 0;
int b = 0;
int c = 400;

  Camera camera1;
int cubes = 50;
float x, y, z;
float ox, oy, oz;
Flock flock;
PVector[] Cube = new PVector[cubes];
void setup() {
  size(screen.width,screen.height, OPENGL);
camera1 = new Camera(this, a, b, c);
 ox = random(-50, 50);
    oy = random(-50, 50);
    oz = random(-50, 50);
  flock = new Flock();

  for (int i = 0; i < cubes; i++) {
    x = random(-50, 50);
    y = random(-50, 50);
    z = random(-50, 50);
    Cube[i] = new PVector(x, y, z);
  }
  // Add an initial set of boids into the system
  for (int i = 0; i < 50; i++) {
    flock.addBoid(new Boid(new PVector(ox,oy, oz),6.0,3, random(255), 150, random(255), random(2, 5)));
  }
  smooth();
}

void draw() {
  background(255, 240, 200);
  camera1.feed();
  
  rotateY(frameCount*0.002);
   flock.run();
  directionalLight(250, 250, 250, 0, 1,  -1);
  pushMatrix();
  for (int i = 0; i < cubes; i++) {
    pushMatrix();
    stroke(150);
    fill(150, 200, 150, 200);
    translate(Cube[i].x, Cube[i].y, Cube[i].z);
    box(10);
    popMatrix();
  }



  popMatrix();
 

}



class Boid {

  PVector loc;
  PVector vel;
  PVector acc;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  float rouge;
  float vert; 
  float bleu;
  float xoff = 0.0;
  float xincrement = 0.01; 
  int num = 200;
  PVector[] location = new PVector[num];
 



  Boid(PVector l, float ms, float mf, float rge, float vrt, float blu, float siz) {
    acc = new PVector(0,0, 0);
    vel = new PVector(random(-0.1,0.1),random(-0.1,0.1), random(-0.1,0.1));
    loc = l.get();
    maxspeed = ms;
    maxforce = mf;
    rouge = rge;
    vert = vrt;
    bleu = blu;
    for(int i = 0; i <num; i++) {
      location[i] = new PVector(0, 0, 0);
    }
  }

  void run(ArrayList boids) {
    flock(boids);
    update();
    // borders();
    render();
    seek(new PVector(0, 0, 0));
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    // Arbitrarily weight these forces
    float n = noise(xoff)*200;
    xoff+=xincrement;

    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    // Add the force vectors to acceleration
    acc.add(sep);
    acc.add(ali);
    acc.add(coh);
  }

  // Method to update location
  void update() {
    // Update velocity
    vel.add(acc);
    // Limit speed
    vel.limit(maxspeed);
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }

  void seek(PVector target) {
    acc.add(steer(target,false));
  }

  void arrive(PVector target) {
    acc.add(steer(target,true));
  }


  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steer(PVector target, boolean slowdown) {
    PVector steer;  // The steering vector
    PVector desired = PVector.sub(target,loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0f)) desired.mult(maxspeed*(d/100.0f)); // This damping is somewhat arbitrary
      else desired.mult(maxspeed);
      // Steering = Desired minus Velocity
      steer = PVector.sub(desired,vel);
      steer.limit(0.25);  // Limit to maximum steering force
    } 
    else {
      steer = new PVector(0,0, 0);
    }
    return steer;
  }

  void render() {
    float t = 0;
    float cx = 0;
    float cy = 0;
    float cz = 0;
    // Draw a triangle rotated in the direction of velocity
    for(int i=1; i<num; i++) {
      location[i-1] = location[i];
    }
    location[num-1] = loc.get(); 
    PVector l = new PVector(0, loc.y, 0);
    PVector v ;
    float tail = 5;
    v = vel.get();
    v.normalize();
    PVector crss = vel.cross(l);
    crss.normalize();
    l.normalize();
    float theta = PVector.angleBetween(v, l);
    for(int i=1; i<num; i++) {
      pushMatrix();

     
     rotate(t, cx, cy, cz);
      beginShape(QUADS);
      fill(rouge, vert/5,bleu/5);
     noStroke();
     vertex(location[i-1].x, location[i-1].y, location[i-1].z);
      vertex(location[i-1].x, location[i-1].y+1, location[i-1].z);
      vertex(location[i].x, location[i].y+1, location[i].z);
    vertex(location[i].x, location[i].y, location[i].z);

      
      
      endShape();
      popMatrix();
    
    }
 t = -theta;
 cx = crss.x;
 cy = crss.y;
 cz = crss.z;


  }


  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList boids) {
    float desiredseparation = 2.50f;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (int j = 0 ; j < cubes; j++) {
      for (int i = 0 ; i < boids.size(); i++) {
        Boid other = (Boid) boids.get(i);
        float d = PVector.dist(loc,other.loc);

        // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
        if ((d > 0) && (d < desiredseparation)) {
          // Calculate vector pointing away from neighbor
          PVector diff = PVector.sub(loc,other.loc);
          diff.normalize();
          diff.div(d);        // Weight by distance
          steer.add(diff);
          count++;            // Keep track of how many
        }
        float dl = PVector.dist(loc, Cube[j]);
        if ((dl > 0) && (dl < 13)) {
          PVector dif = PVector.sub(loc,Cube[j]);
          dif.normalize();
          dif.div(dl);        // Weight by distance
          steer.add(dif);

        }

      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList boids) {
    float neighbordist = 5.0;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      if ((d > 0) && (d < neighbordist)) {
        steer.add(other.vel);
        count++;
      }
    }
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion (ArrayList boids) {
    float neighbordist = 5.0;
    PVector sum = new PVector(0,0,0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
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
class Flock {
  ArrayList boids; // An arraylist for all the boids

    Flock() {
    boids = new ArrayList(); // Initialize the arraylist
  }

  void run() {
    for (int i = 0; i < boids.size(); i++) {
      Boid b = (Boid) boids.get(i);  
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }

}

void mouseDragged()
{
  if (mouseButton == CENTER)
  {
    // Look around
    camera1.truck(mouseX - pmouseX);
    camera1.boom(mouseY - pmouseY);
  }
  else if (mouseButton == LEFT) {
    camera1.tilt(radians(mouseY - pmouseY) / 2.0);
    camera1.pan(radians(mouseX - pmouseX) / 2.0);
  }
  else {
    camera1.dolly((pmouseX-mouseX)+(pmouseY-mouseY)/2);
  }
}
// One more to handle the keyboard
void keyPressed() {
  switch(key) {
  case 'r':
    // Reset camera position and orientation
    camera1.jump(a,b,c);
    camera1.aim(0,0,0);
    break;
  case 'w':
    // dolly forwards
    camera1.dolly(-10);
    break;
  case 's':
    // dolly backwards
    camera1.dolly(10);
    break;
  case 'a':
    // truck left
    camera1.truck(-10);
    break;
  case 'd':
    // truck right
    camera1.truck(10);
    break;
  case ' ':
    // boom up
    camera1.boom(-10);
  case CODED:
    if (keyCode == CONTROL) {
      // boom down
      camera1.boom(10);
    }
    break;
  }
}


