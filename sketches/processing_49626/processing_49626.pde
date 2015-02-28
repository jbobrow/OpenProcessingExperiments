
/**
 *  Densities
 *
 *  by Ricard Marxer
 *
 *  This example shows how the density works.
 *  The density determines the mass per area of a body.
 *  In this example we show a column of balls all of same area and increasing densities from 0.1 to 0.9.
 *  These balls will collide against another column of balls all with the same density of 0.9.
 *  We can observe the different behavior of the collisions depending on the density.
 *
 *  Note that a density of 0.0 corresponds to a mass o 0 and the body will be considered static.
 */

import fisica.*;

FCircle circleButton;
FWorld world;
int AballCount = 2;
int BballCount = 300;

color buttonColor = #155AAD;
color hoverColor = #55AA11;
color bodyColor = #6E0595;

void setup() {
  size(900, 700);
  smooth();
 

  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 0);
  world.setEdges();
  world.remove(world.left);
  
  world.remove(world.right);

  for (int i=0; i<AballCount; i++) {
    FCircle b = new FCircle(25);
    b.setPosition(map(i, 0, AballCount-1,450, 450),40);
    b.setDensity(map(i, 0, AballCount-1, 0.1, 0.9));
    b.setVelocity(0,100);
    b.setDamping(0.0);
    b.setNoStroke();
    b.setFill(map(i, 0,AballCount-1, 225, 30));
    world.add(b);
  }

  for (int i=0; i<BballCount; i++) {
    FCircle b = new FCircle(4);
    b.setPosition(map(i, 0,BballCount-1, 40, width-40),height/2);
    b.setVelocity(0, 0);
    b.setDamping(0.0);
    b.setDensity(0.1);
    b.setNoStroke();
    b.setFill(3,173,255);
   
    world.add(b);
  }
  


}

void draw() {
  background(255);
  world.step();
  world.draw();
}

void contactEnded(FContact c) {  
  if (!c.getBody1().isStatic()) {
    FCircle b = (FCircle)c.getBody1();
    if (b.getSize()<100) {
      b.setSize(b.getSize()*1.01);
    }
  } 

  if (!c.getBody2().isStatic()) {
    FCircle b = (FCircle)c.getBody2();
    if (b.getSize()<10) {
      b.setSize(b.getSize()*1.02);
    }
  }
}








void keyPressed() {
  try {
    saveFrame("screenshot.png");
  } 
  catch (Exception e) {
  }
}


