
/**
 * <p>This is a solution to the well known Pulley Belt Problem (http://en.wikipedia.org/wiki/Belt_problem)
 * using several features of the toxiclibs geometry classes to compute the location of
 * tangent points and the position of the belt crossing.</p>
 *
 * <p><strong>Usage:</strong><ul>
 * <li>move mouse to move one of the pulley wheels</li>
 * </ul></p>
 */
 
/* 
 * Copyright (c) 2011 Karsten Schmidt
 * 
 * This library is free software; you can redistribute it and/or
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
import toxi.processing.*;

// define pulley wheels
Circle c1=new Circle(140,190,50);
Circle c2=new Circle(340,190,100);

ToxiclibsSupport gfx;

void setup() {
  size(680,382);
  noFill();
  gfx=new ToxiclibsSupport(this);
}

void draw() {
  background(255);
  // lock circle to mouse
  c1.set(mouseX,mouseY);
  // sort circles based on X position
  Circle[] wheels;
  if (c1.x<c2.x) {
    wheels=new Circle[] { c1,c2 };
  } 
  else {
    wheels=new Circle[] { c2,c1 };
  }
  // length between circle centers
  float len=c1.distanceTo(c2);
  // compute angle between circle centers
  float theta=wheels[1].sub(wheels[0]).heading();
  // compute angle of tangent point
  float phi=acos((c1.getRadius()+c2.getRadius())/len);
  // compute tangent point on left wheel using polar coordinates
  // adding theta as offset to take into account direction between wheel
  Vec2D c1A=wheels[0].add(new Vec2D(wheels[0].getRadius(),phi+theta).toCartesian());
  // tangent point on right circle is opposite (phi+PI)
  Vec2D c2A=wheels[1].add(new Vec2D(wheels[1].getRadius(),phi+theta+PI).toCartesian());
  // flip angle for vertically opposite tangent points
  phi=TWO_PI-phi;
  // compute 2nd set of tangent points
  Vec2D c1B=wheels[0].add(new Vec2D(wheels[0].getRadius(),phi+theta).toCartesian());
  Vec2D c2B=wheels[1].add(new Vec2D(wheels[1].getRadius(),phi+theta+PI).toCartesian());
  // compute intersection point of ropes
  Line2D la=new Line2D(c1A,c2A);
  Line2D lb=new Line2D(c1B,c2B);
  Vec2D isec=la.intersectLine(lb).getPos();
  if (isec!=null) {
    gfx.circle(isec,5);
    // draw rope
    gfx.line(la);
    gfx.line(lb);
  }
  // draw wheels
  gfx.ellipse(c1);
  gfx.ellipse(c2);
}

