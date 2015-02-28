
/**
 * <p>Draggable particle demo showing how to handle mouse events on
 * particles and allow them to be dragged around with the mouse.</p>
 *
 * <p>See original discussion at:
 * http://processing.org/discourse/yabb2/YaBB.pl?num=1266335586</p>
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

VerletPhysics2D physics;
VerletParticle2D selected=null;

// squared snap distance for picking particles
float snapDistSquared=10*10;

void setup() {
  size(680,382);
  smooth();
  physics=new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0,0,width,height));
  // create 20 particle strings of 20 particles each
  Vec2D origin=new Vec2D(width/2,height/2);
  for(float theta=0; theta<TWO_PI; theta+=TWO_PI/20) {
    // create direction vector in polar space then convert to cartesian
    Vec2D dir=new Vec2D(8,theta).toCartesian();
    ParticleString2D s=new ParticleString2D(physics,origin,dir,20,1,0.5);
  }
}

void draw() {
  background(255);
  noFill();
  physics.update();
  // draw all springs
  for(Iterator<VerletSpring2D> i=physics.springs.iterator(); i.hasNext();) {
    VerletSpring2D s=i.next();
    line(s.a.x,s.a.y,s.b.x,s.b.y);
  }
  // draw all particles
  for(Iterator<VerletParticle2D> i=physics.particles.iterator(); i.hasNext();) {
    VerletParticle2D p=i.next();
    // selected particle in cyan, all others in black
    stroke(p==selected ? 0xff00ffff : 0xff000000);
    ellipse(p.x,p.y,5,5);
  }
}

// check all particles if mouse pos is less than snap distance
void mousePressed() {
  selected=null;
  Vec2D mousePos=new Vec2D(mouseX,mouseY);
  for(Iterator<VerletParticle2D> i=physics.particles.iterator(); i.hasNext();) {
    VerletParticle2D p=i.next();
    // if mouse is close enough, keep a reference to
    // the selected particle and lock it (becomes unmovable by physics)
    if (p.distanceToSquared(mousePos)<snapDistSquared) {
      selected=p;
      selected.lock();
      break;
    }
  }
}

// only react to mouse dragging events if we have a selected particle
void mouseDragged() {
  if (selected!=null) {
    selected.set(mouseX,mouseY);
  }
}

// if we had a selected particle unlock it again and kill reference
void mouseReleased() {
  if (selected!=null) {
    selected.unlock();
    selected=null;
  }
}


