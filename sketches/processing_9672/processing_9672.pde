
/**
 * <p>This demo demonstrates how to use a ParticleConstraint implementation to
 * create box obstactles in the physical simulation space. Two boxes are defined and attached as
 * constraint to each particle. The particles themselves are connected via springs to form a long
 * string/thread with one of its ends anchored in space. The ParticleString class is used to create
 * this string.</p>
 * 
 * <p>Usage: Press 'r' to restart the simulation</p>
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

import toxi.processing.*;
import toxi.geom.*;
import toxi.physics.*;
import toxi.physics.constraints.*;

BoxConstraint[] boxes=new BoxConstraint[2];

int NUM_PARTICLES = 90;
int REST_LENGTH=10;

VerletPhysics physics;
VerletParticle head;
ToxiclibsSupport gfx;

void setup() {
  size(680,382,P3D);
  gfx=new ToxiclibsSupport(this);
  // create 2 boxes
  boxes[0]=new BoxConstraint(new Vec3D(100,-100,-100),new Vec3D(150,100,100));
  boxes[1]=new BoxConstraint(new Vec3D(-150,-100,-100),new Vec3D(-100,100,100));
  initPhysics();
}

void draw() {
  physics.update();
  background(255);
  translate(width/2,height/2,0);
  rotateX(-0.33);
  rotateY(frameCount*0.01);
  scale(0.66);
  lights();
  noStroke();
  fill(0x80ff40e0);
  // draw the box obstacles
  for(int i=0; i<boxes.length; i++) {
    gfx.box(boxes[i].getBox());
  }
  stroke(0);
  noFill();
  gfx.lineStrip3D(physics.particles);
  for(Iterator i=physics.particles.iterator(); i.hasNext();) {
    VerletParticle p=(VerletParticle)i.next();
    float r=p.getWeight()*2;
    ellipse(p.x,p.y,r,r);
  }
}

void initPhysics() {
  // setup physics engine
  physics=new VerletPhysics();
  physics.setGravity(Vec3D.Y_AXIS.scale(0.05));
  // string start position & direction
  Vec3D startPos=new Vec3D(-NUM_PARTICLES/2*REST_LENGTH+30, -110, 0);
  Vec3D dir=new Vec3D(REST_LENGTH,0,0);
  // create the string as a line along the direction vector
  ParticleString string=new ParticleString(physics,startPos, dir, NUM_PARTICLES, 1, 0.5);
  // add the 2 boxes as constraints to all string particles
  for(int j=0; j<boxes.length; j++) {
    VerletPhysics.addConstraintToAll(boxes[j],string.particles);
  }
  // anchor the 1st particle in space 
  string.getHead().lock();
  string.getTail().setWeight(2);
  string.particles.get(20).setWeight(4);
}

void keyPressed() {
  if (key=='r') {
    initPhysics();
  }
}


