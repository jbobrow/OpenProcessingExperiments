
// Juan Pablo Patino
// C&C Lab with Joe Saavedra, Tuesdays @ 3:30pm

// This is Hemesh : a 3D mesh library for Processing
// I'm following and then tweaking code from
// First this tutorial, http://vormplus.be/blog/article/exploring-the-hemesh-wb-render-class
// This tutorial, http://vormplus.be/blog/article/creating-3d-shapes-with-hemesh

import processing.opengl.*;
import wblut.hemesh.modifiers.*;
import wblut.hemesh.composite.*;
import wblut.hemesh.tools.*;
import wblut.processing.*;
import wblut.hemesh.subdividors.*;
import wblut.kdtree.*;
import wblut.frame.*;
import wblut.hemesh.options.*;
import wblut.random.*;
import wblut.geom2D.*;
import wblut.hemesh.creators.*;
import wblut.hemesh.core.*;
import wblut.geom.*;
import wblut.math.*;
import wblut.bsptree.*;
import wblut.nurbs.*;

WB_Render render;
HE_Mesh mesh;


void setup()
{
    size(600, 600, OPENGL );
    hint( DISABLE_OPENGL_2X_SMOOTH );
    hint( ENABLE_OPENGL_4X_SMOOTH );
 
  
  
//  for(int i = 0; i < 4; i++) {  
    HEC_Dodecahedron creator = new HEC_Dodecahedron();
    creator.setEdge(50);
    mesh = new HE_Mesh( creator );
    HEM_Lattice lattice = new HEM_Lattice().setDepth(50)
    .setWidth(40);
    mesh.modify(lattice);
//    HES_Planar planar = new HES_Planar().setRandom(true)
//    .setRange(0.4);
//    mesh.subdivide( planar, i);
//  }
    render = new WB_Render( this );
}

void draw() {
  
  lights();
  background(227, 118, 46);
  
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);

// Putting the rotate BEFORE the forloop creates 
// a jitter effect when mouse hovers over.
//You have to remove the rotation AFTER to see it
//  rotateY(mouseX*1.0f/2*width*PI);
//  rotateX(mouseY*1.0f/2*height*PI);
  
  for (int y = 150; y <= 450; y += 150) {
    for (int x = 150; x <= 450; x += 150) {
      pushMatrix();
      translate(x, y);
      rotateY(mouseX*1.0f/width*TWO_PI);
      rotateX(mouseY*1.0f/height*TWO_PI);
      fill(51, 46, 219);
      stroke(0); 
      render.drawFaces( mesh );
      noFill();
      stroke(255); 
      float hair = map(mouseX,0,width,1,100);
      render.drawFaceNormals( hair, mesh );
      popMatrix();
    }
  }
}

