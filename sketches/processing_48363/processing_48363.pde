
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// Creates a set of randomized particles held in an arraylist,
// determines their position inside an arbitrary container that
// is controlled by the position of the mouse. Try changing
// the number of particles it creates and see the results!

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////



// Declaring our particle class, our arraylist of particles, our arraylist of planes, and our variable declaring the distance to the center from the edge.
Particle particle;
ArrayList particles;
ArrayList planes;
float distanceToCenter = 250;

// This specifies the number of particles we want to add to our box
int NumParticles = 900;


//vectors to hold the arbitrary 
PVector plane0;
PVector plane1;
PVector plane2;
PVector plane3;

// Vectors that will hold the corners of the  arbitrary edges of the bounding box, so we can draw it to the screen
PVector cornerTopLeft;
PVector cornerTopRight;
PVector cornerBotLeft;
PVector cornerBotRight;

// Storing the location of the mouse, and the normalized (unit vector) version of that
PVector mouse;
PVector mouseNorm;

void setup() {
  size(500, 500);
  smooth();
  background(255);
  particles = new ArrayList();
  planes = new ArrayList();
  
  // Add our specified number of particles to the arraylist we created above, each one gets a random position and velocity
  for (int i = 0; i<NumParticles; i++) {
    particles.add(new Particle(random(width)-width/2, random(height)-height/2, random(5), random(5)));
  }

  // Add our edges into the arraylist, each is defined by the unit vector perpendicular to it, e.g. the RIGHT side of our theoretical 1 by 1 box, would be 1 unit to the right horizontally, and 0 vertically.
  planes.add(new PVector(0, -1));
  planes.add(new PVector(-1, 0));
  planes.add(new PVector(1, 0));
  planes.add(new PVector(0, 1));
}

void draw() {
  translate(250, 250);
  background(255);
  //noStroke();
  fill(10);
  
  // defining the coordinates of the mouse
  PVector mouse = new PVector(mouseX - 250,mouseY - 250);
  
  // Defining the corners of the box relative to the mouse
  PVector cornerTopLeft = new PVector(-mouse.x + mouse.y, -mouse.y - mouse.x);
  PVector cornerTopRight = new PVector(mouse.x + mouse.y, mouse.y - mouse.x);
  PVector cornerBotLeft = new PVector(-mouse.y - mouse.x, -mouse.y + mouse.x);
  PVector cornerBotRight = new PVector(-mouse.y + mouse.x, mouse.y + mouse.x);
  
  // Drawing the box based on the corners we defined
  line(cornerTopLeft.x,cornerTopLeft.y,cornerBotLeft.x,cornerBotLeft.y);
  line(cornerBotLeft.x,cornerBotLeft.y,cornerBotRight.x,cornerBotRight.y);
  line(cornerBotRight.x,cornerBotRight.y,cornerTopRight.x,cornerTopRight.y);
  line(cornerTopRight.x,cornerTopRight.y,cornerTopLeft.x,cornerTopLeft.y);
  

  distanceToCenter = mouse.mag();
  mouse.normalize();
  
  
  plane0 = (PVector) planes.get(0);
  plane1 = (PVector) planes.get(1);
  plane2 = (PVector) planes.get(2);
  plane3 = (PVector) planes.get(3);
  
  plane0.set (mouse.x,mouse.y,0.0);
  plane1.set (-mouse.x,-mouse.y,0.0);
  plane2.set (mouse.y,-mouse.x,0.0);
  plane3.set (-mouse.y,mouse.x,0.0);
  
  //println(plane0.x);
  //println(plane1.x);
  //println(plane2.x);
  //println(plane3.x);

 
  for (int i = 0; i< particles.size(); i++) {
    Particle particle = (Particle) particles.get(i);
    particle.update();
    particle.checkEdges();
    particle.display();
  }
}

class Particle {
  PVector location;
  PVector velocity;
  PVector locNorm;

  // the constructor for our particles
  Particle(float posx, float posy, float velx, float vely) {
    location = new PVector( posx, posy);
    velocity = new PVector( velx, vely);
  }

  // move the particles
  void update() {
    location.add(velocity);
  }

  // check the location of the particles, reflect them or move them if necessary
  void checkEdges() {
    locNorm = location.get();
    locNorm.normalize();
    
    for (int j =0; j < 4; j ++) {
      PVector plane = (PVector) planes.get(j);
      float distance = location.dot(plane) + distanceToCenter;

      // If a particle is hitting an edge and has not yet been reflected, reflect it
      if (distance < 0 && velocity.dot(plane) < 0)
      { 
        PVector temp = plane.get();
        temp.mult(2*plane.dot(velocity));
        velocity.sub(temp);
      }
      
      // If a particle finds its way out of the box, subtract that distance from the location, and put it back in the box.
      if (distance<0){
        location.set(location.x - distance * plane.x, location.y - distance * plane.y,0.0);
      }
    }
  }
  // Draw the particles
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 3, 3);
  }
}


