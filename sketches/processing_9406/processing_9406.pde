
// HYPERBOLIC CORAL //

// Kerrin Jefferis and Patrick Stein, May 2010

// ~ Computational Nature Study for Generative Design (Masters of Digital Design, University of Canberra) ~ //
    // A hyperbolic coral generator inspired by a similar system using crochet exhibited by the Institute for Figuring
    // number of nodes in and circumference of concentric rings increase exponentially as new outward growth rings are added
    // nodes are connected to neighbours by springs of given rest length and move to a position where all springs are at this length
    // creating a continous (hyperbolic) surface that expands exponentially with crenations (or ruffles) at edges

    // any keypress to regenerate coral

// Built using Traer Physics System - http://www.cs.princeton.edu/~traer/physics/

// Uses PeasyCam to navigate view with mouse - http://mrfeinberg.com/peasycam/
    // mouse left-click-drag to rotate 
    // mouse wheel, or right-click-drag up and down to zoom 
    // mouse middle-click-drag (cmd-left-click-drag on mac) to pan 
    // mouse double-click to reset


// - - - - - - - - Libraries - - - - - - - - //

import traer.physics.*;
import peasy.*;


// - - - - - - - - Variables - - - - - - - - //

ParticleSystem physics;
PeasyCam cam;

ArrayList nodes;  // ArrayList (of ArrayLists) contains all nodes (particles)

int[] pattern = { // Growth pattern
  2,3};
int patterncount = 0; // Counter for total of growth pattern

Particle start;  // Centre node
int startnodes = 4;  // Number of nodes in first ring
int numgenerations = 5; // Number of generations (rings)
int radius = 12; // Starting distance between rings 

int restlength = 10;  // Rest length of springs between nodes
float strength = 0.1;  // Strength of springs between nodes
float damping = 0.05;  // Damping of springs between nodes

float repulsion = -3;  // Repulsion force between nodes
float repulsion_mindist = 1;  // Distance from node where repulsion force begins to decrease

float drag = 0.03;  // Physics System drag (friction)
float speed = 3;  // Physics System speed of simulation update (clock)

int colR = int(random(255));  // Coral red colour value
int colG = int(random(255));  // Coral green colour value
int colB = int(random(255));  // Coral blue colour value


// - - - - - - - - Setup - - - - - - - - //

void setup(){
  size(600,600,P3D);
  frameRate(30);
  cursor(CROSS);
  noStroke();

  cam = new PeasyCam(this,700);
  cam.setMinimumDistance(100);
  cam.setMaximumDistance(1000);

  physics = new ParticleSystem( 0, drag );

  makeCoral();

}


// - - - - - - - - Draw - - - - - - - - //

void draw(){

  rotateX(-0.5);
  rotateY(-0.5);
  scale(1);
  background(255);
  lights();
  smooth();

  physics.tick(speed); 

  drawSurfaceGeometry();

}


// - - - - - - - - Make Coral - - - - - - - - //

void makeCoral(){

  nodes = new ArrayList();

  for (int i=0; i<pattern.length; i++){
    patterncount = patterncount + pattern[i];
  }
  float ringmult = (patterncount*1.0)/pattern.length;

  int numnodes = startnodes;
  int newradius = radius;
  float newangle;

  // - - - - Make Centre Node - - - - //

  start = physics.makeParticle(1.0,0,0,0);
  start.makeFixed();

  // - - - - Make Rings - - - - //

  for (int j=0; j<numgenerations; j++){

    ArrayList ring = new ArrayList();

    for (int i=0; i<numnodes; i++){

      newangle = i*2*PI/numnodes;

      // - - Make Nodes - - //

      Particle P  = physics.makeParticle(1.0,cos(newangle)*newradius,sin(newangle)*newradius,random(-5,5));
      ring.add(P);

      // - - Make Concentric Springs Between Neighbouring Nodes - - //

      if (i>0) {
        Particle L = (Particle) ring.get(i-1);
        Spring S = physics.makeSpring(P,L,strength,damping,restlength);

        if (i == numnodes-1 ){    
          Particle M = (Particle) ring.get(0);  
          Spring T = physics.makeSpring(P,M,strength,damping,restlength); 
        }
      }
    }

    nodes.add(ring);
    numnodes = int(numnodes*ringmult);
    newradius = newradius + radius;
  }

  // - - - - Make Radial Springs Between Start Node and First Ring - - - - //

  ArrayList firstring = (ArrayList) nodes.get(0);

  for (int i=0; i<firstring.size(); i++){
    Particle P = (Particle) firstring.get(i);   

    Spring S = physics.makeSpring(P,start,strength,damping,restlength/2); 
  }

  // - - - - Make Radial Springs Between Rings - - - - //

  for (int j=0; j<nodes.size()-1; j++){

    ArrayList thisring = (ArrayList) nodes.get(j);
    ArrayList nextring = (ArrayList) nodes.get(j+1);

    int counter = 0; 

    for (int i=0; i<thisring.size(); i++){   
      Particle P = (Particle) thisring.get(i); 

      for (int k=counter; k<counter+pattern[i%pattern.length]; k++){
        Particle L = (Particle) nextring.get(k%nextring.size()); 
        L.position().set(L.position().x(), L.position().y(), P.position().z() + random(-1,1) );

        Spring S = physics.makeSpring(P,L,strength,damping,restlength*(j*j+1)); 
      }

      counter = counter+pattern[i%pattern.length];
    }
  }

  // - - - - Make Repulsion Forces Between All Nodes - - - - //

  for (int p=0; p< physics.numberOfParticles(); p++){

    Particle P = physics.getParticle(p);

    for (int q=0; q< physics.numberOfParticles(); q++){

      Particle Q = physics.getParticle(q);

      physics.makeAttraction(P,Q,repulsion,repulsion_mindist);
    }
  }

  // - - - - Print Key Variables - - - - //
  
  println (pattern);
  println ("startnodes =  " + startnodes + ", numgen = " + numgenerations);
  println ("patternlength = " + pattern.length + ", patterncount = " + patterncount + ", ringmult = " + ringmult);
  println ("numparticles = " + physics.numberOfParticles());
  println (" ");

}


// - - - - - - - - Draw Surface Geometry - - - - - - - - //

void drawSurfaceGeometry(){
  
  fill(colR,colG,colB,225);
  
  // - - - - Draw Centre - - - - //
  
  ArrayList firstring = (ArrayList) nodes.get(0);
  
  beginShape(TRIANGLE_FAN);
    vertex(start.position().x(),start.position().y(),start.position().z());
    for (int i=0; i<firstring.size(); i++){
        Particle P = (Particle) firstring.get(i);   
        vertex(P.position().x(),P.position().y(),P.position().z());
      }
    Particle A = (Particle) firstring.get(0);   
    vertex(A.position().x(),A.position().y(),A.position().z());
  endShape(CLOSE);

  // - - - - Draw Between Rings - - - - //

  for (int j=0; j<nodes.size()-1; j++){

    ArrayList thisring = (ArrayList) nodes.get(j);
    ArrayList nextring = (ArrayList) nodes.get(j+1);

    int counter = 0; 

    for (int i=0; i<thisring.size(); i++){
      Particle P = (Particle) thisring.get(i);
      
      // - - Draw Between Springs From This Node - - //

      for (int k=counter; k<counter+pattern[i%pattern.length]-1; k++){

        Particle L = (Particle) nextring.get(k%nextring.size()); 
        Particle M = (Particle) nextring.get((k+1)%nextring.size()); 

        beginShape(TRIANGLES);
          vertex(M.position().x(),M.position().y(),M.position().z());
          vertex(L.position().x(),L.position().y(),L.position().z());
          vertex(P.position().x(),P.position().y(),P.position().z()); 
        endShape(CLOSE); 
      }
      
      counter = counter+pattern[i%pattern.length];
      
      // - - Draw Between Last Spring From This Node And First Spring From Next Node - - //
  
      Particle O = (Particle) nextring.get((counter-1)%nextring.size()); 
      Particle Q = (Particle) nextring.get(counter%nextring.size()); 
      Particle N = (Particle) thisring.get((i+1)%thisring.size()); 

      beginShape(QUADS);
        vertex(N.position().x(),N.position().y(),N.position().z());
        vertex(Q.position().x(),Q.position().y(),Q.position().z());
        vertex(O.position().x(),O.position().y(),O.position().z());
        vertex(P.position().x(),P.position().y(),P.position().z());      
      endShape(CLOSE);  
    }
    
    // - - Patch Hole At End Of Ring - - //
    
    // this bug occurs when pattern length doesnt divide evenly into number of nodes in next ring 
    // and is caused because number of nodes in a new ring is determined by a multiplier (the average of the pattern) 
    // rather than each new node being grown directly by the corresponding node in the previous ring as happens in crochet between rows of stiches
    
    if(nextring.size() % pattern.length > 0){
        
      Particle R = (Particle) thisring.get(thisring.size()-1);
      Particle S = (Particle) nextring.get(nextring.size()-1); 
      Particle T = (Particle) nextring.get(0); 
      Particle U = (Particle) thisring.get(0); 
  
      beginShape(TRIANGLES);
        vertex(U.position().x(),U.position().y(),U.position().z());
        vertex(T.position().x(),T.position().y(),T.position().z());
        vertex(S.position().x(),S.position().y(),S.position().z());    
      endShape(CLOSE);
      }
    
  }
}


// - - - - - - - - Regenerate Coral - - - - - - - - //

void keyPressed(){
  
  background(255);

  nodes.clear();
  physics.clear();
  patterncount = 0;  

  pattern = new int[] {
    int(random(2,4)),int(random(3,6))};

  startnodes = 2*int(random(2,5));

  colR = int(random(255));
  colG = int(random(255));
  colB = int(random(255));

  makeCoral();
}









