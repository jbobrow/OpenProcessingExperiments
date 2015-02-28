
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/17190*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/**
 * <p>This example uses the attraction behavior to inflate a 3D mesh.
 * The mesh vertices are re-created as physics particles and connected
 * using springs. Upon mouse press the inflation force is applied,
 * counteracting the forces created by the springs, causing the mesh to
 * expand and deform.</p>
 * 
 * <p>Usage: Move up to inflate mesh. Move to down to deflate mesh. Rotation si controlled y x and y movements</p>
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
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;
import toxi.physics.constraints.*;
import toxi.processing.*;
import toxi.physics.behaviors.AttractionBehavior;


VerletPhysics physics;
AttractionBehavior inflate;
WETriangleMesh box;

ToxiclibsSupport gfx;



void setup() {
    size(1000,600, P3D);
    gfx = new ToxiclibsSupport(this);
    initPhysics();
    
}

void draw() {
    
    physics.update();
    for (Vertex v : box.vertices.values()) {
        v.set(physics.particles.get(v.id));
    }
    box.center(null);
    for (Vertex v : box.vertices.values()) {
        physics.particles.get(v.id).set(v);
    }
    box.computeFaceNormals();
    box.faceOutwards();
    box.computeVertexNormals();
    background(51);
    fill(255,0,0);
    //ellipse(650,120,10,10);
    //ellipse(550, 120,10,10);
    
    
    if(mouseY<550){
      inflateBehavior();       
    }
    
  
    translate(width / 2, height / 2, 0);
    rotateX((height / 2 - mouseY/2) * 0.01f);
    rotateY((width / 2 - mouseX/2) * -0.01f);
    scale(1.3);
    noFill();
    lights();
    directionalLight(255, 255, 255, -200, 1000, 500);
    specular(255);
    shininess(16);
    gfx.origin(new Vec3D(), 50);
    fill(198);
    noStroke();
    gfx.mesh(box, true,1);
}

void inflateBehavior(){
  
  physics.removeBehavior(inflate);
  if(mouseY>height/2){
    return;
  }
    inflate = new AttractionBehavior(new Vec3D(), 400, -0.3f, 0.001f);
  physics.addBehavior(inflate);
   
  
}

    
  

void initPhysics() {
    box = new WETriangleMesh();
    // create a simple start mesh
   // box.addMesh(new Cone(new Vec3D(0, 0, 0), new Vec3D(0, 1, 0), 10, 50, 100).toMesh(4));
    box.addMesh(new AABB(new Vec3D(), 50).toMesh());
    // then subdivide a few times...
    box.subdivide();
    box.subdivide();
    box.subdivide();
    box.subdivide();
    physics = new VerletPhysics();
    //physics.setWorldBounds(new AABB(new Vec3D(), 180));
    // turn mesh vertices into physics particles
    for (Vertex v : box.vertices.values()) {
        physics.addParticle(new VerletParticle(v));
    }
    // turn mesh edges into springs
    for (WingedEdge e : box.edges.values()) {
        VerletParticle a = physics.particles.get(((WEVertex) e.a).id);
        VerletParticle b = physics.particles.get(((WEVertex) e.b).id);
        physics.addSpring(new VerletSpring(a, b, a.distanceTo(b), 0.005f));
    }
}











