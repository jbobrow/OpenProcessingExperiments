
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
int AballCount = 3;
int BballCount = 850;

color buttonColor = #155AAD;
color bodyColor = #CEDEE5;

void setup() {
  size(400, 800);
  smooth();
 

  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 0);
  world.setEdges();
  

 // for (int i=0; i<AballCount; i++) {
 // FCircle a = new FCircle(30);
 // a.setPosition(map(i, 0, AballCount-1,random(400), random(400)),0);
 // a.setDensity(map(i, 0, AballCount-1, 0.1, 0.9));
 // a.setVelocity(random(-100,100), random(700));
 // a.setDamping(0.0);
 // a.setNoStroke();
 // a.setFill(random(1,10),random(1,10),random(0,100));
 //  world.add(a);
 // }

  for (int i=0; i<BballCount; i++) {
    FCircle b = new FCircle(random(10));
    b.setPosition(map(i, 0,BballCount-1,0, width),random(200,800));
    b.setVelocity(0, 0);
    b.setDamping(0.1);
    b.setDensity(0.1);
    b.setNoStroke();
    b.setFill(0,random(167,230),random(188,242));
   
    world.add(b);
  }
  
  circleButton = new FCircle(25);
  circleButton.setPosition(200, 30);
  circleButton.setStatic(true);
  circleButton.setFillColor(buttonColor);
  circleButton.setNoStroke();
  world.add(circleButton);

}

void draw() {
  background(255);
  world.step();
  world.draw();
}

void contactEnded(FContact c) {  
  if (!c.getBody1().isStatic()) {
    FCircle b = (FCircle)c.getBody1();
    if (b.getSize()<25) {
      b.setSize(b.getSize()*1);
    }
  } 

  if (!c.getBody2().isStatic()) {
    FCircle b = (FCircle)c.getBody2();
    if (b.getSize()<10) {
      b.setSize(b.getSize()*2);
    }
  }
  
}

void mousePressed() {
  FBody pressed = world.getBody(mouseX, mouseY); 
  if (pressed == circleButton) {
    FCircle myCircle = new FCircle(random(15,50));
    myCircle.setPosition(random(400), random(50,100));
    myCircle.setRotation(random(TWO_PI));
    myCircle.setVelocity(0, random(100,400));
    myCircle.setFillColor(bodyColor);
    myCircle.setNoStroke();
    world.add(myCircle);
  }
}


