
/**
 * This demo shows the basic usage pattern of the Voronoi class in combination with
 * the SutherlandHodgeman polygon clipper to constrain the resulting shapes.
 *
 * Usage:
 * mouse click: add point to voronoi
 * p: toggle points
 * t: toggle triangles
 * x: clear all
 * r: add random
 * h: toggle help display
 *
 * Voronoi class ported from original code by L. Paul Chew
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
import toxi.geom.mesh2d.*;

// empty voronoi mesh container
Voronoi voronoi = new Voronoi();

// switches
boolean doShowPoints = true;
boolean doShowDelaunay;
boolean doShowHelp=true;

void setup() {
  size(600, 600);
  smooth();
  textFont(createFont("SansSerif", 10));
}

void draw() {
  background(255);
  stroke(0);
  noFill();

  // draw delaunay triangulation
  if (doShowDelaunay) {
    stroke(0, 0, 255, 50);
    beginShape(TRIANGLES);
    for (Triangle2D t : voronoi.getTriangles()) {
      triangle(t.a.x, t.a.y, t.b.x, t.b.y, t.c.x, t.c.y);
    }
    endShape();
  }else {
    // draw all voronoi polygons, clip them if needed...
    for (Polygon2D poly : voronoi.getRegions()) {
      beginShape();
      for(Vec2D vector : poly.vertices){
        vertex(vector.x,vector.y);
      }
      endShape(CLOSE);
    }
  }
  // draw original points added to voronoi
  if (doShowPoints) {
    fill(255, 0, 255);
    noStroke();
    for (Vec2D c : voronoi.getSites()) {
      ellipse(c.x, c.y, 5, 5);
    }
  }

  if (doShowHelp) {
    fill(255, 0, 0);
    text("p: toggle points", 20, 20);
    text("t: toggle triangles", 20, 40);
    text("x: clear all", 20, 60);
    text("r: add random", 20, 80);
    text("h: toggle help display", 20, 120);
  }
  
  if(!online)saveFrame("frame.png");
}

void keyPressed() {
  switch(key) {
  case 't':
    doShowDelaunay = !doShowDelaunay;
    break;
  case 'x':
    voronoi = new Voronoi();
    break;
  case 'p':
    doShowPoints = !doShowPoints;
    break;
  case 'h':
    doShowHelp=!doShowHelp;
    break;
  case 'r':
    for (int i = 0; i < 10; i++) {
      voronoi.addPoint(new Vec2D(random(width), random(height)));
    }
    break;
  }
}

void mousePressed() {
  voronoi.addPoint(new Vec2D(mouseX, mouseY));
}


