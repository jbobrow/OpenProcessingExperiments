
/*
 *
 * KEYS
 * r             : reset positions
 * s             : save png
 *
 */

import generativedesign.*;
import peasy.*;

PeasyCam cam;

// an array for the nodes
Node[] nodes = new Node[800];
// an array for the springs
Spring[] springs = new Spring[0];

// dragged node
Node selectedNode = null;

float nodeDiameter = 2;

void setup() {
  size(600, 600, OPENGL);
  smooth();
  
  cam = new PeasyCam(this, 1000);

  initNodesAndSprings();
}


void draw() {

  background(255);

  // let all nodes repel each other
  for (int i = 0 ; i < nodes.length; i++) {
    nodes[i].attract(nodes);
  } 
  // apply spring forces
  for (int i = 0 ; i < springs.length; i++) {
    springs[i].update();
  } 
  // apply velocity vector and update position
  for (int i = 0 ; i < nodes.length; i++) {
    nodes[i].update();
  } 
  
  // draw edges
  for (int i = 0 ; i < springs.length; i++) {
    stroke(0,200);
    strokeWeight(0.5);
    line(springs[i].fromNode.x, springs[i].fromNode.y, springs[i].fromNode.z, springs[i].toNode.x, springs[i].toNode.y, springs[i].toNode.z);
  }
  
    
  // draw nodes
  for (int i = 0 ; i < nodes.length; i++) {
    stroke(255,180,0,140);
    strokeWeight(8);
    point(nodes[i].x, nodes[i].y, nodes[i].z);
    stroke(255);
    strokeWeight(4);
    point(nodes[i].x, nodes[i].y, nodes[i].z);
    stroke(255,90,0);
    strokeWeight(2);
    point(nodes[i].x, nodes[i].y, nodes[i].z);
  }
}

void initNodesAndSprings() {
  // init nodes
  float rad = nodeDiameter/2;
  for (int i = 0; i < nodes.length; i++) {
    nodes[i] = new Node(100/2+random(-20, 20), 100/2+random(-20, 20), 100/2+random(-20, 20));
    nodes[i].setStrength(-5);
  } 

  // set springs randomly
  springs = new Spring[0];

  for (int j = 0 ; j < nodes.length-1; j++) {
    int rCount = floor(random(1, 2));
    for (int i = 0; i < rCount; i++) {
      int r = floor(random(j+1, nodes.length));
      Spring newSpring = new Spring(nodes[j], nodes[r]);
      newSpring.setLength(20);
      newSpring.setStiffness(1);
      springs = (Spring[]) append(springs, newSpring);
    }
  }

}

void keyPressed() {
  if(key=='s' || key=='S') saveFrame(timestamp()+"_##.png"); 

  if(key=='r' || key=='R') {
    background(255);
    initNodesAndSprings();
  }
}

String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}


