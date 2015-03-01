
Planet[] planets = new Planet[8];
int i;
float z;

color[] pColors = {color(223,137,9),color(213,255,95),color(76,168,208), color(222,99,85), color(255,51,0), color(174,131,212), color(0,171,255), color(0,0,255)};

void setup() {
  size(400,400,P3D);
  smooth();
 background(0); 


 //will make the planets leave a path
  
  
  // The planet objects are initialized using the counter variable
  for (i = 0; i < planets.length; i++ ) {
    
    planets[i] = new Planet(20 + i*10,i + 8);
  }
}

void draw() {
   frameRate(10);
    fill(0, 20);
  rect(0, 0, width, height);
  
  fill(255);
  ellipse(random(width), random(height), 3, 3);
  //background(0);
    frameRate(100);
  // Drawing the Sun
  pushMatrix();

  translate(width/2,height/2,50);
  noStroke();
  lights();
  fill(232,225,13);
  //ellipse(0,0,20,20);

  sphere(10);
  popMatrix();
 pushMatrix();
 translate(width/2,height/2);
  // Drawing all Planets
  for (int i = 0; i < planets.length; i++ ) {
        fill(pColors[i]);
    planets[i].update();
    planets[i].display();
  }
popMatrix();
}


class Planet {
  // Each planet object keeps track of its own angle of rotation.
  float theta;      // Rotation around sun
  float diameter;   // Size of planet
  float distance;   // Distance from sun
  float orbitspeed; // Orbit speed
  
  Planet(float distance_, float diameter_) {
    distance = distance_;
    diameter = diameter_;
    theta = 0;
    orbitspeed = random(0.01,0.03);
    distance=distance+10;
  }
  
  void update() {
    // Increment the angle to rotate
    theta += orbitspeed;
  }
  
  void display() {
    
    // Before rotation and translation, the state of the matrix is saved with pushMatrix().
    pushMatrix(); 
    // Rotate orbit
    rotateX(theta);
    rotate(theta);
    // translate out distance
    translate(distance,0,z); 
    stroke(0);
    noStroke();
    sphere(diameter/2);
    //ellipse(0,0,diameter,diameter);
    // Once the planet is drawn, the matrix is restored with popMatrix() so that the next planet is not affected.
    popMatrix(); 
  }
}


