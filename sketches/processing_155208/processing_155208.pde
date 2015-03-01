
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Template for iOS devices (javascript mode) and the accelerometer
//Here we'll be using Accelerometer.js for the accelerometers
//For iOS devices 
import org.jbox2d.util.nonconvex.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.testbed.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;

Physics physics;
Body ballBody; //rigid body for the ball
CollisionDetector detector;

PImage ball;

void setup ()
{
  size(900, 450);
  frameRate(60);
  ball = loadImage("ball.png");
  imageMode(CENTER);
  physics = new Physics(this, width, height, 0, 0, width*2, height*2, width, height, 100);
  physics.setCustomRenderingMethod(this, "customRenderer");
  physics.setDensity(50.0);
  ballBody = physics.createCircle(800, 350, 50);  
  ballBody.setMass(100);
  
  detector = new CollisionDetector(physics, this);
}

void draw ()
{
  background(0);
}

void customRenderer(){
  stroke(0);
  Vec2 screenDroidPos = physics.worldToScreen(ballBody.getWorldCenter());
  
  pushMatrix();
  translate(screenDroidPos.x, screenDroidPos.y);
  image(ball, 0, 0);
  popMatrix();
}

void setBallPos ( float posX, float posY, float posZ, int modechoice)
{
  Vec2 impulse = new Vec2();
  impulse.set(ballBody.getWorldCenter());
  impulse = impulse.sub(new Vec2(posX,(posY*-1)));
  impulse = impulse.mul(0.1);
  ballBody.applyImpulse(impulse, ballBody.getWorldCenter());
}


