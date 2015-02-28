

Cluster cluster;
Stage stage;
Stage2 stage2;

void setup() {
  size(600, 600);
  cluster = new Cluster(); //Initialize the arrayList that contains all the moving objects
  stage = new Stage(width/2, height/2); //Draws a circular stage that contains the moving objects
  stage2 = new Stage2(width/2, height/2); //Draws a circular stage that contains the moving objects

  for (int i = 0; i < 20; i++) {
    cluster.addFworm(new Fworm(new PVector(width/2+50, height/2+50), 2.0f)); //Adds a new object to the arrayList (first boid 
    //to the flock)
  }
}

void draw() {
  background(200);
  stage.display();    
  stage2.display();
  cluster.run(); //animates every object in the ArrayList
}

class Stage {
  float x; 
  float y; 
  

  Stage(float x_, float y_/*, float r_*/) {
    x = x_;
    y = y_;
    
  }

  void display() {
    //fill(240);
    noStroke();
    rect(10, 10, 580, 580);
  }
}

class Stage2 {
  float x; 
  float y; 
  //float r;

  Stage2(float x_, float y_/*, float r_*/) {
    x = x_;
    y = y_;
    //r = r_;
  }

  void display() {
    fill(200);
    stroke(255);
    rect(x, y, 50, 50);
  }
}

class Cluster { //the 'flock' class from boids. 
  ArrayList fworms; // contains all objects
  Cluster() {
    fworms = new ArrayList();
  }

  void run() {
    for (int i = 0; i < fworms.size(); i++) {
      Fworm f = (Fworm) fworms.get(i);
      f.run(fworms); //animates each individual object
    }
  }

  void addFworm(Fworm f) { //the add object function
    fworms.add(f);
  }
}

class Fworm {
  PVector loc; 
  PVector vel;
  float max_wander_offset; //upper and lower ends of the range that generates a random number for changing 
  float wander_theta; //the randomized value assigned to the velocity
  float wander_offset;
  float maxspeed; //prevents the velocity from steadily increasing
  float r;

  Fworm(PVector l, float ms) {
    loc = l.get();
    max_wander_offset = 0.1;
    wander_theta = random(TWO_PI);
    vel = new PVector();
    maxspeed = ms;
    r = 6.0;
  }

  void run(ArrayList fworms) {
    update();
    render();
  }

  void update() {
    wander_offset = random(-max_wander_offset, max_wander_offset);
    wander_theta += wander_offset;
    vel.x += cos(wander_theta);
    vel.y += sin(wander_theta);
    vel.limit(maxspeed);

    if (dist(stage.x, stage.y, loc.x, loc.y) > 210) {
      float ang = atan2(height/2-loc.y, width/2-loc.x);
      // adjust direction a bit in that direction...
      if (wander_theta > PI)
        wander_theta -= TWO_PI;
      else if (wander_theta < -PI) {
        wander_theta += TWO_PI;
      }
      float delta = ang - wander_theta;
      while (delta < -PI)  delta += TWO_PI;
      while (delta > PI)  delta -= TWO_PI;
      wander_theta += delta/20;
    }
    if ((dist(stage2.x, stage2.y, loc.x, loc.y) < 50)) {
      float ang = atan2(height/2-loc.y, width/2-loc.x);
      // adjust direction a bit in that direction...
      if (wander_theta > PI)
        wander_theta -= TWO_PI;
      else if (wander_theta < -PI) {
        wander_theta += TWO_PI;
      }
      float delta = ang - wander_theta;
      while (delta < PI)  delta += TWO_PI;
      while (delta > -PI)  delta -= TWO_PI;
      wander_theta += delta/20;
    }  
    loc.add(vel);
  }

  void render() {
    float direction = vel.heading2D() + PI/2;
    fill(255); // the fill and stroke is only for the 
    stroke(0); // temporary placeholder triangle
    pushMatrix();
    translate(loc.x, loc.y);
    ellipse(10, 10, 10, 10);
    endShape();
    popMatrix();
  }
}

