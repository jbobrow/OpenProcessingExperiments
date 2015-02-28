
/**
 * This demo shows the basic usage pattern of the Voronoi class in combination with
 * the ConvexPolygonClipper to constrain the resulting shapes within an octagon boundary.
 *
 * Usage:
 * mouse click: add point to voronoi
 * p: toggle points
 * t: toggle triangles
 * x: clear all
 * r: add random
 * c: toggle clipping
 * h: toggle help display
 * space: save frame
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
import toxi.geom.mesh.*;
import toxi.processing.*;
import toxi.math.*;

import toxi.util.*;
import toxi.util.datatypes.*;

import toxi.processing.*;

import processing.opengl.*;

// radius of the root delaunay triangle which encompasses (MUST) all other points
float DELAUNAY_SIZE = 10000;

// sphere radius
float EARTH_RADIUS=300;

// ranges for x/y positions of points
FloatRange xpos, ypos;

// helper class for rendering
ToxiclibsSupport gfx;

// empty voronoi mesh container
Voronoi voronoi = new Voronoi(DELAUNAY_SIZE);

// optional polygon clipper
PolygonClipper2D clip;

// 3D mesh
TriangleMesh mesh;

// switches
boolean doShowPoints = true;
boolean doShowDelaunay;
boolean doShowHelp=true;
boolean doClip;
boolean doSave;
boolean doMeshMode=false;

// Perimeter polygon
Polygon2D poly;

void setup() {
  size(1024, 768, OPENGL);

  smooth();
  smooth();

  gfx = new ToxiclibsSupport(this);
  textFont(createFont("SansSerif", 10));
   
  // create a regular polygon by sampling a circle
 // poly=new Circle(60).toPolygon2D(20);
  poly=new Circle(new Vec2D(width/2, height/2), 180).toPolygon2D(20);

  // setup clipper with centered octagon
  clip=new ConvexPolygonClipper(poly);
  
  // add perimeter points
  for (Vec2D v : poly.vertices) {
    voronoi.addPoint(v);
  }
  
  for(int i=0; i < 1000; i++){
    voronoi.addPoint(new Vec2D(random(width), random(height)));
    //  voronoi.addPoint(new Vec2D(random(width/2)+width/4, random(height/2)+height/4));
  }
  
}

void draw() {
  
   if (doMeshMode) {
    background(255);
    stroke(0);
    noFill();
    lights();
    translate(width/2, height/2, 0);
    rotateX(mouseY*0.01);
    rotateY(mouseX*0.01);
   // fill(255);
    noStroke();
//    sphere(EARTH_RADIUS*0.99);
    fill(0, 0, 0, 100);
    stroke(0);
    gfx.mesh(buildSurfaceMesh(voronoi.getTriangles(), EARTH_RADIUS) , true, 20);
  }
  else{
    background(255);
    stroke(0);
    noFill();
    // draw all voronoi polygons, clip them if needed...
    for (Polygon2D poly : voronoi.getRegions()) {
      if (doClip) {
        gfx.polygon2D(clip.clipPolygon(poly));
      } 
      else {
        gfx.polygon2D(poly);
      }
    }
    // draw delaunay triangulation
    if (doShowDelaunay) {
      stroke(0, 0, 255, 50);
      beginShape(TRIANGLES);
      for (Triangle2D t : voronoi.getTriangles()) {
        gfx.triangle(t, false);
      }
      endShape();
    }
    // draw original points added to voronoi
    if (doShowPoints) {
      fill(255, 0, 255);
      noStroke();
      for (Vec2D c : voronoi.getSites()) {
        ellipse(c.x, c.y, 5, 5);
      }
    }
  }
  if (doSave) {
    saveFrame("voronoi-" + DateUtils.timeStamp() + ".png");
    doSave = false;
  }
  if (doShowHelp) {
    fill(255, 0, 0);
    text("p: toggle points", 20, 20);
    text("t: toggle triangles", 20, 40);
    text("x: clear all", 20, 60);
    text("r: add random", 20, 80);
    text("c: toggle clipping", 20, 100);
    text("h: toggle help display", 20, 120);
    text("m: project on sphere", 20, 140); 
    text("space: save frame", 20, 160);
  }
}

void keyPressed() {
  switch(key) {
  case ' ':
    doSave = true;
    break;
  case 't':
    doShowDelaunay = !doShowDelaunay;
    break;
  case 'x':
    voronoi = new Voronoi();
    break;
  case 'p':
    doShowPoints = !doShowPoints;
    break;
  case 'c':
    doClip=!doClip;
    break;
  case 'h':
    doShowHelp=!doShowHelp;
    break;
  case 'r':
    for (int i = 0; i < 10; i++) {
      voronoi.addPoint(new Vec2D(xpos.pickRandom(), ypos.pickRandom()));
    }
    break;
  case 'm':
    doMeshMode=!doMeshMode; 
    break;
  }
}

void mousePressed() {
  voronoi.addPoint(new Vec2D(mouseX, mouseY));
}

boolean edge(Vec2D vrtx){
  if(vrtx.x <= 0 || vrtx.x >= width || vrtx.y <= 0 || vrtx.y >= height)
    return true; 
  else 
    return false;
}

// converts a list of 2D triangles into a 3D mesh on a sphere
TriangleMesh buildSurfaceMesh(List<Triangle2D> tris, float radius) {
  TriangleMesh mesh=new TriangleMesh();
  for (Triangle2D t : tris) {
    if (!doClip || abs(t.a.x)!=DELAUNAY_SIZE && abs(t.a.y)!=DELAUNAY_SIZE) {
      if (!doClip || poly.containsPoint(t.computeCentroid())) {
        // ensure all triangles have same orientation
        if (!t.isClockwise()) {
          t.flipVertexOrder();
        }
//        println("Triangle a" + t.a.x + ", " + t.a.y); 
//        println("Triangle b" + t.b.x + ", " + t.b.y); 
//        println("Triangle c" + t.c.x + ", " + t.c.y); 
        // lat/lon => spherical => cartesian mapping
        
        if(!edge(t.a) && !edge(t.b) && !edge(t.c))
         {
          int scale = 3; 
          Vec3D a = new Vec3D(radius, radians(t.a.x/scale), radians(t.a.y/scale)).toCartesian();
          Vec3D b = new Vec3D(radius, radians(t.b.x/scale), radians(t.b.y/scale)).toCartesian();
          Vec3D c = new Vec3D(radius, radians(t.c.x/scale), radians(t.c.y/scale)).toCartesian();
          // add 3D triangle to mesh
          mesh.addFace(a, b, c);
         // mesh.addFace(t.a.to3DXY(), t.b.to3DXY(), t.c.to3DXY());
         }
      }
     }
  }
  // needed for smooth shading
  mesh.computeVertexNormals();
  return mesh;
}


