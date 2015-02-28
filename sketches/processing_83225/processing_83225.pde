
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

import pKinect.PKinect;
import pKinect.SkeletonData;

import toxi.geom.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.physics.*;
import toxi.physics.behaviors.*;
import toxi.physics.constraints.*;
import toxi.processing.*;
import toxi.physics.behaviors.AttractionBehavior;

PKinect kinect;
ArrayList<SkeletonData> bodies;

VerletPhysics physics;
AttractionBehavior inflate;
WETriangleMesh box;

ToxiclibsSupport gfx;

void setup()
{
  size(1000, 600, P3D);
  background(0);
  kinect = new PKinect(this);
  bodies = new ArrayList<SkeletonData>();
  smooth();
  
  gfx = new ToxiclibsSupport(this);
    initPhysics();

}

void draw()
{
  //background(0);
  for (int i=0; i<bodies.size(); i++) 
  {
    drawSkeleton(bodies.get(i));
   
  }
 
   
}

void initPhysics() {
    box = new WETriangleMesh();
    // create a simple start mesh
    //box.addMesh(new Cone(new Vec3D(0, 0, 0), new Vec3D(0, 1, 0), 10, 50, 100).toMesh(4));
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

void drawSkeleton(SkeletonData _s) 
{
  drawCube(_s, 
  PKinect.NUI_SKELETON_POSITION_HAND_RIGHT, 
  PKinect.NUI_SKELETON_POSITION_HAND_RIGHT);
  
  drawInflate(_s, 
  PKinect.NUI_SKELETON_POSITION_HAND_LEFT, 
  PKinect.NUI_SKELETON_POSITION_HAND_LEFT);
  
  
}

void drawCube(SkeletonData _s, int _j1, int _j2) 
{
  if (_s.skeletonPositionTrackingState[_j1] != PKinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_j2] != PKinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
    
    
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
    //ellipse(650,120,15,15);
    
    
    
    
    translate(width / 2, height / 2, 0);
    rotateX((height / 2 - _s.skeletonPositions[_j1].y*height) * 0.01f);
    rotateY((width / 2 - _s.skeletonPositions[_j1].x*width) * -0.01f);
    scale(1.7);
    noFill();
    lights();
    directionalLight(255, 255, 255, -200, 1000, 500);
    specular(255);
    shininess(16);
    gfx.origin(new Vec3D(), 50);
    fill(192);
    noStroke();
    gfx.mesh(box, true,1);
    }
    
} 
 
 void drawInflate(SkeletonData _s, int _j1, int _j2) 
{
  //ellipse (_s.skeletonPositions[_j1].x*width,_s.skeletonPositions[_j1].y*height,40,40);
  if(_s.skeletonPositions[_j1].y*height<550){
      physics.removeBehavior(inflate);
  if(_s.skeletonPositions[_j1].y*height>height/2){
    return;
  }
    inflate = new AttractionBehavior(new Vec3D(), 400, -0.3f, 0.001f);
  physics.addBehavior(inflate);
 
    }
 } 

void mousePressed() {
  inflate = new AttractionBehavior(new Vec3D(), 400, -0.3f, 0.001f);
  physics.addBehavior(inflate);
}

void mouseReleased() {
  physics.removeBehavior(inflate);
}



void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == PKinect.NUI_SKELETON_NOT_TRACKED) 
  {
       return;
  }
  synchronized(bodies) {
    bodies.add(_s);
  }
}

    
void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    for (int i=bodies.size()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
               
      }
    }
  }
}

void moveEvent(SkeletonData _b, SkeletonData _a) 
{
  if (_a.trackingState == PKinect.NUI_SKELETON_NOT_TRACKED) 
  {
        
    return;
  }
  synchronized(bodies) {
    for (int i=bodies.size()-1; i>=0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}


