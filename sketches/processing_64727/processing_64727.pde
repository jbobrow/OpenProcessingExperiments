

// references

// http://flight404.com/p5/levitatedTentacle8/levitatedTentacle8.java

Tentacle tentacle;

void setup() {

  tentacle = new Tentacle(270);

  size(800, 400);
  background(0);
  ellipseMode(CENTER_DIAMETER);
  
  noCursor();
  
}

void draw() {
  background(50, 200, 150);
  tentacle.move();
  tentacle.draw();
} 


// The Tentacle class
class Tentacle {

  int numNodes = 20;                                // total number of nodes
  PVector[] nodes = new PVector[numNodes];
  
  float girth = 8 + random(12);                     // the general speed
  float muscleFreq = 0.1 + random(100) / 250;       // muscular frequency
  float theta;
  float count;
  
  // constructor
  Tentacle (float initTheta) {
    theta = initTheta;

    for (int n = 0; n < numNodes; n++) {
      nodes[n] = new PVector(height/2, height/2);
    }
  }

  void move() {
        
    float thetaMuscle;
    float dx, dy, d;

    // node 0: position, direction, orbiting handle
    nodes[0].x = mouseX;
    nodes[0].y = mouseY;

    // node 1: muscule
    count += muscleFreq;
    if(keyPressed) {
      nodes[1].x = nodes[0].x ;
      nodes[1].y = nodes[0].y ;
    } else {
      nodes[1].x = nodes[0].x ; 
      nodes[1].y = nodes[0].y +sin(count) ;
    }
    
    // apply kinetic forces down through body nodes
    for (int i = 2; i < nodes.length; i++) {
      dx = nodes[i].x - nodes[i - 2].x;
      dy = nodes[i].y - nodes[i - 2].y;

      d = sqrt(dx * dx + dy * dy);
      nodes[i].x = nodes[i - 1].x + (dx * girth) / d;
      nodes[i].y = nodes[i - 1].y + (dy * girth) / d;
    }
  }

  void draw() {
    pushMatrix();

    for (int i=1; i<numNodes; i++) {
      stroke(0);
      line(nodes[i].x, nodes[i].y, 
      nodes[i-1].x, nodes[i-1].y);
    }
    noStroke();
    fill(255);
    ellipse(nodes[0].x, nodes[0].y, 3, 3);
    fill(0, 0, 0);
    ellipse(nodes[1].x, nodes[1].y, 3, 3);

    popMatrix();
  }
}


