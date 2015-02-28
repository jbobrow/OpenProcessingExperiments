
import java.io.File;
import povmesh.mesh.POVMesh;
import povmesh.mesh.Textures;
import toxi.color.TColor;
import toxi.geom.AABB;
import toxi.geom.Matrix4x4;
import toxi.geom.Vec3D;
import toxi.geom.mesh.Mesh3D;
import toxi.geom.mesh.TriangleMesh;
import toxi.processing.ToxiclibsSupport;


/**
 * This example shows how to dynamically create a simple box mesh and align
 * it with a given direction vector using the pointTowards() method of the
 * TriangleMesh class.
 */
/*
 * Copyright (c) 2010 Karsten Schmidt & 2012 Martin Prout for PovRAY export
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General License as published by
 * the Free Software Foundation; either version 2.1 of the License, or (at
 * your option) any later version.
 *
 * http://creativecommons.org/licenses/LGPL/2.1/
 *
 * This library is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser
 * General License for more details.
 *
 * You should have received a copy of the GNU Lesser General License
 * along with this library; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 */
Vec3D BOX_SIZE = new Vec3D(2.5, 2.5, 10);
float SCALE = 130;

TriangleMesh[] boxes = new TriangleMesh[300];
ToxiclibsSupport gfx;


void setup() {
  size(400, 400, P3D);
  gfx = new ToxiclibsSupport(this);
  for (int i = 0; i < boxes.length; i++) {
    // create a new direction vector for each box
    Vec3D dir = new Vec3D(cos(i * TWO_PI / 75), sin(i * TWO_PI / 50), sin(i * TWO_PI / 25)).normalize();
    // create a position on a sphere, using the direction vector
    Vec3D pos = dir.scale(SCALE);
    // create a box mesh at the origin
    Mesh3D bm = new AABB(new Vec3D(), BOX_SIZE).toMesh();
    TriangleMesh b = (TriangleMesh) bm;
    // align the Z axis of the box with the direction vector
    b.pointTowards(dir);
    // move the box to the correct position
    b.transform(new Matrix4x4().translateSelf(pos.x, pos.y, pos.z));
    b.setName(String.format("obj%d", i));
    gfx.fill(TColor.WHITE);
    boxes[i] = b;
  }
  frameRate(15);
}

void draw() {
  background(51);

  translate(width / 2, height / 2, 0);
  rotateX(mouseY * 0.01f);
  rotateY(mouseX * 0.01f);
  for (int i = 0; i < boxes.length; i++) {
    gfx.setStrokeFill(false, TColor.newRandom());
    gfx.mesh(boxes[i]);
  }
}

void keyPressed() {
  if (key == 's') {
    noLoop();
    String fileID = "mesh_align";
    POVMesh pm = new POVMesh(this);
    pm.beginSave(new File(sketchPath(fileID + ".inc")));
    pm.setTexture(Textures.GLASS);
    pm.saveAsMesh(boxes, false); // calculated normals are crap
    pm.endSave();
    exit();
  }
}


