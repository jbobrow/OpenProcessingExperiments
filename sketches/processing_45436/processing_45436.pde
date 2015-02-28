
// Barge Simulation
// Robin Gower Nov-2011
// License: CC-BY-SA
//
// Basic simulation of a canal boat with controls for engine speed (throttle) and tiller direction.
//
// Keys:
// W - engine forwards
// S - engine reverse
// A - tiller left
// D - tiller right
//
// You can also drag the boat around using the mouse.
//
// I reckon the boat behaviour is broadly accurate.  In reality I find that barges tend to have worse steering in reverse.  The tiller also has an effect when the boat is drifting whereas on the simulation torque is only applied when the engine is powered.  There's also a handful of parameters that could be tweaked for a more realistic model (e.g. mass/ power ratios).
//
// The canal is randomly generated circle formed of two banks.  I've had to created a horse-shoe for the outer bank as I can't see a way to make polygons with 'holes'.  This does give rise to warnings about "invalid polygons" and occasionally you can move through the outer bank.
//
// I've used the Fiscia wrapper for JBox2D.  The library does promise a method for applying-forces at a point other than the centre of mass but the function isn't implemented yet.  Instead I've combined addForce and addTorque with a simplistic tilllerForceRatio but I'm sure theres a more accurate way to model the mechanics.
//
//


import fisica.*;

FWorld world;
FPoly ib; // inner_bank
FPoly ob; // outer_bank
Boat cb;  // canal boat
Integer waterBlobCount = 30;
Integer outer_bank_width = 50;
Integer inlet_width = 10;
Integer outer_bank_points = 30;
Integer outer_bank_variance = 30;
Integer canal_width = 40;
Integer damage_count = 0;

void setup() {
  size(800, 800);

  Fisica.init(this);
  // Create world
  world = new FWorld();
  world.setEdges();
  world.setGravity(0,0);

  // Create canal boat and add it to world
  cb = new Boat();
  world.add(cb);
  
  // Create outer bank and add it to world
  ob = new FPoly();
  ob.setStatic(true);
  ob.setFill(0,128,0);
  ob.setStroke(64,64,0);
  ob.setStrokeWeight(2);
  ob.vertex(0,0);            //top left
  ob.vertex(width,0);        //top right
  ob.vertex(width,height);   //bot right
  ob.vertex(width/2+10,height); //inlet
  ob.vertex(width/2+10,height-outer_bank_width); //inlet
  for(int i=1; i<=outer_bank_points; i++) {
    float theta = 1.8*PI/outer_bank_points*i;
    float hyp = width/2-outer_bank_width + random(1)*outer_bank_variance;
    ob.vertex(hyp*sin(theta)+width/2,hyp*cos(theta)+height/2);    
  }
  ob.vertex(width/2-10,height-outer_bank_width); //inlet
  ob.vertex(width/2-10,height); //inlet
  ob.vertex(0,height);
//  ob.vertex(0,0); // don't think this is needed?
  world.add(ob);

  // Create inner bank and add it to world
  ib = new FPoly();
  ib.setStatic(true);
  ib.setFill(0,128,0);
  ib.setStroke(64,64,0);
  ib.setStrokeWeight(2);
  for(int i=1; i<=outer_bank_points; i++) {
    float theta = 2*PI/outer_bank_points*i;
    float hyp = width/2 - outer_bank_width - canal_width + random(0.5)*outer_bank_variance;
    ib.vertex(hyp*sin(theta)+width/2,hyp*cos(theta)+height/2);    
  }  
  world.add(ib);

//  for(int i=0; i<waterBlobCount; i++) {
//    FBlob b = new FBlob();
//    b.setAsCircle(random(1)*width, random(1)*height, 20);
//    b.setStrokeWeight(0);
//    b.setFill(0,0,255);
//    b.setFriction(0.0001);
//    b.setDensity(0.0001);
//    println(random(1)*width + "\t" + random(1)*height);
////    world.add(b);    
//  }
  
//  water = new FBox(width,height);
//  water.setStatic(true);
//  water.setDensity(0.1);
//  water.setFriction(0.1);
//  water.setPosition(width/2,height/2);
//  water.setFill(0,0,255);
//  world.add(water);
  
}

void draw() {
  background(0,0,128);

  cb.drive();
  world.step();
  world.draw();
  cb.drawIndicators();
  
  // debug - rotates boat automatically
//  if(frameCount % 20 == 1) {
//    cb.setRotation(cb.getRotation()+PI/12);
//    println(atan(height/width));
//    //println(cb.getRotation());
//  }

  smooth();
}


public class Boat extends FPoly {
  public float engSpeed;
  public float engPower;
  public float tiller_direction;
  public float boatLength;
  public float boatWidth;
  private float indicatorScale;
  private float maxAngle;
  private float torqueForceRatio;

  public Boat() {
    // parameters
    engSpeed = 0;
    engPower = 200;
    tiller_direction = 0;
    maxAngle = PI*3/4;
    boatLength = 56;//100;//
    boatWidth = 7;//15; //
    indicatorScale = 200;
    torqueForceRatio = 3;   // scaling factor between thrust and tiller effects
    
    // jbox2d FPoly settings
    this.setRotatable(true);
//    this.setDamping(0);
//    this.setRestitution(1);
//    this.setRotation(PI);
    this.setFill(128,256,0);
    this.setNoStroke();
    this.setDensity(5);
    this.setBullet(true);

    // build shape
    this.vertex(0,boatLength/4);
    this.vertex(boatWidth/2,0);
    this.vertex(boatWidth,boatLength/4);
    this.vertex(boatWidth,boatLength);
    this.vertex(0,boatLength);
    this.setPosition(outer_bank_width+canal_width/2,height/2);
    //this.vertex(0,10);
    
  }
  public void drawIndicators() {
    noStroke();

    // throttle indicator
    Float t_height = cb.engSpeed*indicatorScale;
    rect(0,height/2,20,t_height);   // engine setting indicator
    text("Throttle", 5, height/2 - indicatorScale -45);
    text("W", 5, height/2 - indicatorScale -30);
    text("S", 5, height/2 + indicatorScale +40);
    triangle(0,height/2+t_height-1,10,height/2+t_height-1-20,20,height/2+t_height-1);
    triangle(0,height/2+t_height+1,10,height/2+t_height+1+20,20,height/2+t_height+1);
    
    // tiller indicator
    rect(width/2,height-20,(cb.tiller_direction)*indicatorScale,20);
    text("Tiller", width/2-maxAngle/2*indicatorScale - 100, height-5);
    text("A", width/2-maxAngle/2*indicatorScale - 60, height-5);
    text("D", width/2+maxAngle/2*indicatorScale + 50, height-5);
    Float t_width = width/2 + cb.tiller_direction*indicatorScale;
    triangle(t_width-1,height,t_width-20-1,height-10,t_width-1,height-20);
    triangle(t_width+1,height,t_width+20+1,height-10,t_width+1,height-20);
//    triangle(0,height/2+t_height+1,10,height/2+t_height+1+20,20,height/2+t_height+1);

    // damage indicator
    stroke(128);
    text("Damage caused: £ "+damage_count,40,40);
    strokeWeight(1);
    stroke(255,0,0);
    point(cb.cenX(),cb.cenY()); // centre
    
    // Thrust indicator
    strokeWeight(2);
    stroke(0,0,255);
    line(cb.propX()-cb.thrustX()/10,cb.propY()-cb.thrustY()/10,cb.propX(),cb.propY());
    pushMatrix();
    translate(cb.propX()-cb.thrustX()/10,cb.propY()-cb.thrustY()/10);
    rotate(-(cb.tiller_direction-cb.getRotation()));
    triangle( -5, engSpeed*10, 0, 0, +5, engSpeed*10);
    popMatrix();
        
    // debug 
//    text(cb.getRotation(),40,40);
//    point(cb.propX(),cb.propY()); // propellor
//    stroke(255,255,0);
//    point(cb.getX(),cb.getY()); // draw pos
//    stroke(255,255,255);
    
  }
  public float cenX() { 
    return cb.getX() + cos(cb.getRotation() + atan(boatLength/boatWidth))*sqrt(pow(boatLength,2) + pow(boatWidth,2))/2;
  }
  public float cenY() {
    return cb.getY() + sin(cb.getRotation() + atan(boatLength/boatWidth))*sqrt(pow(boatLength,2) + pow(boatWidth,2))/2;
  }
  public float propX() {
    return cb.getX() + cos(cb.getRotation() + atan(boatLength/boatWidth*2))*sqrt(pow(boatLength,2) + pow(boatWidth/2,2));
  }
  public float propY() {
    return cb.getY() + sin(cb.getRotation() + atan(boatLength/boatWidth*2))*sqrt(pow(boatLength,2) + pow(boatWidth/2,2));
  }
  public float thrustX() {
    return engSpeed*sin(propDirection())*engPower;
  }
  public float thrustY() {
    return engSpeed*cos(propDirection())*engPower;
  }
  public float propDirection() {
    return -cb.getRotation()+tiller_direction;
  }
  public void drive() {
    //cb.resetForces();
    // forces to given point not implemented - must do force + torque
    //cb.addForce(cb.thrustX(),cb.thrustY(),cb.propX()-cenX(),cb.propY()-cenY());
    //cb.addForce(cb.thrustX(),cb.thrustY(), 0, 100); //,cb.propX(),cb.propY() );
    cb.addForce(cb.thrustX(),cb.thrustY());
    cb.addTorque(torqueForceRatio * tiller_direction * -engSpeed);// * engSpeed/sqrt(pow(engSpeed,2)));  // 
  }
  public void forward() {
    if (engSpeed > -1) {
      engSpeed -= 0.1;
    }
  }
  public void backward() {
    if (engSpeed < 1) {
      engSpeed += 0.1;
    }
  }
  public void turnleft() {
    if (tiller_direction >= -maxAngle/2) {
      tiller_direction -= PI/12;
    }
  }
  public void turnright() {
    if (tiller_direction <= maxAngle/2) {
      tiller_direction += PI/12;
    }
  }
  public void debug() {
    //println(tiller_direction);
    //println(cb.getX() + "\t" + cb.getY() + "\t" + cb.getRotation() + "\t" + cb.tiller_direction);
    println(cb.thrustX() + "\t" + cb.thrustY() + "\t" + cb.getRotation() + "\t" + cb.tiller_direction);
  }
}


void keyPressed() {
  switch(key) {
  case 'w':
    cb.forward();
    break;
  case 's':
    cb.backward();
    break;
  case 'a':
    cb.turnleft();
    break;    
  case 'd':
    cb.turnright();
    break;
  }
  //cb.debug();
}

void contactPersisted(FContact c) {
  damage_count += 1;
}



