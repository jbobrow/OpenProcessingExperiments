
float gravity = 0.3;
float damping = 0.99;
float repulsion = 0.3;
particle[] Z = new particle[32];


void setup() {
  smooth();
  size(500, 500, P2D); 
  background(0);
  //frameRate(60);

  // initialize particles randomly   
  for (int i = 0; i < Z.length; i++) {
    Z[i] = new particle(random(width), random(height), random(1) - 0.5, random(1) - 0.5, 16 + random(32));
  }
}

void draw() {
  float r;

  // clear  
  background(0);

  // display particles
  for (int i = 0; i < Z.length; i++) {
    for (int j = i + 1; j < Z.length; j++) {
      Z[i].connect(Z[j]);
    }
    Z[i].display();  
  }
  
  // update particle position
  for (int i = 0; i < Z.length; i++) {
    for (int j = 0; j < Z.length; j++) {
      if (j != i)
        Z[i].gravitate(Z[j]);
    }
    Z[i].update();
    Z[i].dampen();
  }
}


