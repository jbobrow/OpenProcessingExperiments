
/**
 * Copyright (c) 2012 Martin Prout
 *
 * Features processing-2.0a6 features
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

import java.awt.event.MouseWheelEvent;       // zoom using mousewheel
import java.awt.event.MouseWheelListener;    // processing does normally support mouse wheel

PVector[] pts = {              // points of the unit tetrahedron
  new PVector(-0.5, -0.5, -0.5), 
  new PVector(0.5, 0.5, -0.5), 
  new PVector(-0.5, 0.5, 0.5), 
  new PVector(0.5, -0.5, 0.5)
  };

  int TETRA_SIZE = 600;
PShape sierpinski;
int zoom = 0;
color[] cols = new color[] {
  #BD11ED, #ED2711, #4EED11, #1128ED
};

void setup() {
  size(800, 800, P3D);
  sierpinski = createShape(PShape.GROUP);
  createSierpinski(pts);
}

void draw() {
  background(0);
  configureLights();
  translate(width/2, height/2, -200 + zoom);
  rotateX(cos(radians(frameCount)));
  rotateY(sin(radians(frameCount)));
  shape(sierpinski);       // render retained shape
}

void configureLights() {
  ambientLight(60, 60, 60);
  directionalLight(90, 120, 120, 0, 1, -1);
  directionalLight(120, 120, 90, 0, 1, 1);
}

PVector midPoint(PVector a, PVector b) {
  PVector result = PVector.add(a, b);
  result.div(2);
  return result;
}

void createSierpinski(PVector[] pts) {
  if (pts[0].dist(pts[1]) < 0.1) {    // limits recursion on relative size
    PShape tetra = createTetrahedron(pts, TETRA_SIZE); // render the tetrahedra
    tetra.enableStyle();
    tetra.ambient(50);
    tetra.specular(100);
    sierpinski.addChild(tetra);
  }
  else {
    PVector av = midPoint(pts[0], pts[1]); // a tetrahedron midpoint vertices
    PVector bv = midPoint(pts[0], pts[2]); // b
    PVector cv = midPoint(pts[0], pts[3]); // b
    PVector dv = midPoint(pts[1], pts[2]); // d
    PVector ev = midPoint(pts[1], pts[3]); // e
    PVector fv = midPoint(pts[3], pts[2]); // e
    PVector[] aa = {
      pts[0], 
      av, 
      bv, 
      cv
    };
    PVector[] bb = {
      av, 
      ev, 
      dv, 
      pts[1]
    };
    PVector[] cc = {
      cv, 
      ev, 
      fv, 
      pts[3]
    };
    PVector[] dd = {
      bv, 
      dv, 
      fv, 
      pts[2]
    };
    createSierpinski(aa); // calculate further inner tetrahedra coordinates
    createSierpinski(bb);
    createSierpinski(cc);
    createSierpinski(dd);
  }
}

PShape createTetrahedron(PVector[] pts, float sz) {
  noStroke();
  PShape tetrahedron = createShape(TRIANGLES);
  tetrahedron.fill(cols[0]);
  tetrahedron.vertex(pts[0].x*sz, pts[0].y*sz, pts[0].z*sz);  // 1
  tetrahedron.vertex(pts[1].x*sz, pts[1].y*sz, pts[1].z*sz);  // 2
  tetrahedron.vertex(pts[2].x*sz, pts[2].y*sz, pts[2].z*sz);  // 3
  tetrahedron.fill(cols[1]);
  tetrahedron.vertex(pts[2].x*sz, pts[2].y*sz, pts[2].z*sz);  // 3
  tetrahedron.vertex(pts[0].x*sz, pts[0].y*sz, pts[0].z*sz);  // 1
  tetrahedron.vertex(pts[3].x*sz, pts[3].y*sz, pts[3].z*sz);  // 4
  tetrahedron.fill(cols[2]);
  tetrahedron.vertex(pts[3].x*sz, pts[3].y*sz, pts[3].z*sz);  // 4
  tetrahedron.vertex(pts[2].x*sz, pts[2].y*sz, pts[2].z*sz);  // 3
  tetrahedron.vertex(pts[1].x*sz, pts[1].y*sz, pts[1].z*sz);  // 2
  tetrahedron.fill(cols[2]);
  tetrahedron.vertex(pts[1].x*sz, pts[1].y*sz, pts[1].z*sz);  // 2
  tetrahedron.vertex(pts[3].x*sz, pts[3].y*sz, pts[3].z*sz);  // 4
  tetrahedron.vertex(pts[0].x*sz, pts[0].y*sz, pts[0].z*sz);  // 1
  tetrahedron.end();
  return tetrahedron;
}


MouseWheelListenerClass wheel = new MouseWheelListenerClass();

public class MouseWheelListenerClass implements MouseWheelListener {
  public MouseWheelListenerClass() {
    addMouseWheelListener(this);
  }
  public void mouseWheelMoved(MouseWheelEvent e) {
    zoom += e.getWheelRotation() * 9;
  }
}


