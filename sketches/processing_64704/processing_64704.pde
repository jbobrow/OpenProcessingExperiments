
/* 
 * Copyright (c) 2010 Karsten Schmidt as modified by Martin Prout 2012
 * to use retained shape, and a function variation
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
import toxi.geom.mesh.*;
import toxi.math.*;
import toxi.volume.*;

int RES = 64;  // increase resolution to 128 for great detail
float ISO = 0.2;
float MAX_ISO=0.66;

WETriangleMesh mesh;
ArcBall arcball;   // NB: also provides mousewheel zoom
PShape retained;
Status state = Status.STARTING;

void setup() {
  size(1280, 720, P3D);
  arcball = new ArcBall(this);
  smooth(16);
  VolumetricSpace vol = new EvaluatingVolume(new Vec3D(400, 400, 400), RES, MAX_ISO);
  IsoSurface surface = new HashIsoSurface(vol);
  mesh = new WETriangleMesh();
  surface.computeSurfaceMesh(mesh, ISO);
  noStroke();  // NB: currently need to call this before createShape
}

void draw() {  
  switch(state) {
  case STARTING:     // avoid unecessary update of reatained shape
    background(0);
    state = Status.UPDATING;
    retained = meshToRetained(mesh, true);
    state = Status.READY;
    break;
  case CHANGED:     // update retained shape on change
    state = Status.UPDATING;
    System.out.println(state);
    PShape changed = meshToRetained(mesh, true);
    retained.updateRoot(changed);
    state = Status.READY;
    System.out.println(state);
    break;
  case READY:      // only display shape when ready
    background(0);
    translate(width / 2, height / 2, 0);
    arcball.update();
    lights();
    lightSpecular(80, 80, 80);
    directionalLight(80, 80, 80, 0, 0, -1);
    ambientLight(50, 50, 50);
    shape(retained);
    break;
  }
}

void keyPressed() {
  if (key == 'l' && state == Status.READY) {    
    new LaplacianSmooth().filter(mesh, 1);
    state = Status.CHANGED;
  }
}

PShape meshToRetained(Mesh3D mesh, boolean smth) {        
  PShape retained = createShape(TRIANGLES);
  retained.enableStyle();
  retained.fill(200, 200, 200);
  retained.ambient(50);
  retained.shininess(10);
  retained.specular(50);
  if (smth) {
    mesh.computeVertexNormals();
    for (Face f : mesh.getFaces()) {
      retained.normal(f.a.normal.x, f.a.normal.y, f.a.normal.z);
      retained.vertex(f.a.x, f.a.y, f.a.z);
      retained.normal(f.b.normal.x, f.b.normal.y, f.b.normal.z);
      retained.vertex(f.b.x, f.b.y, f.b.z);
      retained.normal(f.c.normal.x, f.c.normal.y, f.c.normal.z);
      retained.vertex(f.c.x, f.c.y, f.c.z);
    }
  } 
  else {
    for (Face f : mesh.getFaces()) {
      retained.normal(f.normal.x, f.normal.y, f.normal.z);
      retained.vertex(f.a.x, f.a.y, f.a.z);
      retained.vertex(f.b.x, f.b.y, f.b.z);
      retained.vertex(f.c.x, f.c.y, f.c.z);
    }
  }
  retained.end();
  return retained;
}


