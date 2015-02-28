
/**
 *<p> toxiclib-demo Attraction 2D (s.unten) angepasst von Nicolas Ruh<br/>
 * Demonstriert die Benutzung von Subklassen (Vererbung), 
 * um Bibliotheks-Klassen zu erweitern - hier um den Partikeln die 
 * Möglichkeit zu geben, sich ihre jeweilige Farbe zu merken.</p>
 *
 *<p>This example demonstrates how to use the behavior handling
 * (new since toxiclibs-0020 release) and specifically the attraction
 * behavior to create forces around the current locations of particles
 * in order to attract (or deflect) other particles nearby.</p>
 *
 * <p>Behaviors can be added and removed dynamically on both a
 * global level (for the entire physics simulation) as well as for
 * individual particles only.</p>
 * 
 * <p>Usage: Click and drag mouse to attract particles</p>
 */

/* 
 * Copyright (c) 2010 Karsten Schmidt
 * 
 * This demo & library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */
 
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

int NUM_PARTICLES = 750;

VerletPhysics2D physics;
AttractionBehavior mouseAttractor;
Vec2D mousePos;
AttractionBehavior repulsor;
Vec2D repulsionPos;
Vec2D repulsorMovement = new Vec2D(5, 0);



void setup() {
  size(680, 382,P3D);
  colorMode(HSB);
  frameRate(40);
  // setup physics with 10% drag
  physics = new VerletPhysics2D();
  physics.setDrag(0.05f);
  physics.setWorldBounds(new Rect(10, 10, width-20, height-20));
  // the NEW way to add gravity to the simulation, using behaviors
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.15f)));
  // create a moving invisible repulsor 
  repulsionPos = new Vec2D(0, height-30);
  repulsor = new AttractionBehavior(repulsionPos, 100, -9.9f);
  physics.addBehavior(repulsor);
}

void addParticle() {
  VerletParticle2D p = new MyParticle(Vec2D.randomVector().scale(5).addSelf(width / 2, 0),random(25,80));
  physics.addParticle(p);
  // add a negative attraction force field around the new particle //particle,radius,strength,jitter
  physics.addBehavior(new AttractionBehavior(p, 20, 1.2f, 0.03f));
//  //adding second Particle, connected with mindistanceSpring
//  VerletParticle2D p2 = new MyParticle(Vec2D.randomVector().scale(5).addSelf(width / 2, 0),random(25,80));
//  physics.addParticle(p2);
//  // add a negative attraction force field around the new particle //particle,radius,strength,jitter
//  physics.addBehavior(new AttractionBehavior(p2, 20, -1.2f, 0.03f));
//  //create the spring between the two particles
//  VerletConstrainedSpring2D s = new VerletConstrainedSpring2D(p,p2,random(7,30),.7);
//  // add the spring to the physics system
//  physics.addSpring(s);
}

void draw() {
  fill(0,25);
  rect(0,0,width,height);
  noStroke();
  moveRepulsor();
  
  if (physics.particles.size() < NUM_PARTICLES) {
    addParticle();
  }
  physics.update();
  for (VerletParticle2D p : physics.particles) {
    //fill(((MyParticle) p).h,50+p.y,p.getVelocity().magnitude()*15);
    fill(((MyParticle) p).getColor());
    ellipse(p.x, p.y, 10, 10);
  }
}

void moveRepulsor(){
  if (repulsionPos.x < 0 || repulsionPos.x>width){
    repulsorMovement.x = -repulsorMovement.x;
  }
  if (repulsionPos.y < 0 || repulsionPos.y>height){
    repulsorMovement.y = -repulsorMovement.y;
  }
  repulsionPos.set(repulsionPos.add(repulsorMovement));
  //repulsionPos = repulsionPos.add(repulsorMovement);
  fill(10,255,255);
  ellipse(repulsionPos.x, repulsionPos.y, 30, 30); 
  physics.removeBehavior(repulsor);
  physics.addBehavior(repulsor);
}

void mousePressed() {
  mousePos = new Vec2D(mouseX, mouseY);
  // create a new positive attraction force field around the mouse position (radius=250px)
  mouseAttractor = new AttractionBehavior(mousePos, 250, 0.9f);
  physics.addBehavior(mouseAttractor);
}

void mouseDragged() {
  // update mouse attraction focal point
  mousePos.set(mouseX, mouseY);
}

void mouseReleased() {
  // remove the mouse attraction when button has been released
  physics.removeBehavior(mouseAttractor);
}

class MyParticle extends VerletParticle2D{
  float h = random(255);
  float s = 255;
  float b = random(200,255);
  
  MyParticle(Vec2D v){
    super(v);
  }
  
  MyParticle(Vec2D v, float h){
    this(v);
    this.h = h;
  }
  
  color getColor(){
    return color(h, s, b);
  }
}


