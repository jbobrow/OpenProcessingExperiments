
//QUEUE LINE PROJECT//
//Norma Maldonado, Kailong Hou, Eric Camarena, Rodrigo Shiordia//
//reference code from http://www.openprocessing.org/sketch/5152
//Import Libraries.
import toxi.math.conversion.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.geom.mesh2d.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.math.noise.*;

//Global Variables//
ArrayList queue; //The name of the arraylist.
ArrayList attractors;
int agentcount=200;  //The number of agents.
int attractorcount = 2;


void setup() {
  background(255);
  size (600, 600);
  smooth();
  queue = new ArrayList();
  for (int i=0; i<agentcount;i++) {
    Vec3D initpos = new Vec3D(random(200, width-200), random(200, height-200), 0);
    agent myagent= new agent(initpos);
    queue.add(myagent);
  }
  attractors = new ArrayList();
  for (int i=0; i<attractorcount;i++) {
    Vec3D initpos = new Vec3D(random(0, width), random(0, height), 0);
    attractor myattractor= new attractor(initpos);
    attractors.add(myattractor);
  }
}

void draw() {
  fill(255);
  rect(0, 0, width, height);
  for (int i=0; i<agentcount;i++) {
    agent myagent= (agent) queue.get(i);
    myagent.run(attractors);
  }
  for (int i=0; i<attractorcount;i++) {
    attractor myattractor= (attractor) attractors.get(i);
    myattractor.run();
  }
  
  
}




