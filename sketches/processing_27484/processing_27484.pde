
/**
* collapse:
* (NomBot)
* physics simulation
* 
* uses fisica & pbox2d
*/

import fisica.*;
import pbox2d.*;

FWorld world;

FBox[] block = new FBox[18];

void setup() {
  size(400, 400);
  smooth();
  
  Fisica.init(this);

  world = new FWorld();
  
  world.setGravity(0, 400);
  
  world.setEdges();
  
// erect the building 
 
 for (int i=0; i < 18; i++){
  int h = i/2; 
  block[i] = new FBox(40, 40);
  block[i].setPosition(100+i%2*200,height-40*h);
  block[i].setFill(128);
  block[i].setStroke(255);
  world.add(block[i]);
 } 
 
 
  FBox vbox = new FBox(300, 40);
  vbox.setPosition(width/2,40);
  vbox.setFill(128);
  vbox.setStroke(255);
  world.add(vbox);
  
   

}

void draw() {

 background(0);
 
// drop the balls

  FCircle ball = new FCircle(10);
  ball.setPosition(width/2,0);
  
  world.add(ball);

  world.step();

  world.draw(this);
}


