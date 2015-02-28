
// ContourMap2 by Cedric Kiefer
// http://www.onformative.com/lab/creating-contour-maps/

// Note
// if you encounter a "memory error" try to modify the "levels" variable

import blobDetection.*;
import peasy.*;
PeasyCam cam;

PImage img;

float levels = 10;                    // number of contours
float factor = 5;                     // scale factor
float elevation = 80;                 // höher

float colorStart =  0;               // Starting dregee of color range in HSB Mode (0-360)
float colorRange =  160;             // color range / can also be negative

// Array of BlobDetection Instances
BlobDetection[] theBlobDetection = new BlobDetection[int(levels)];

void setup() {
  size(1000,800,P3D);  
  img = loadImage("map.gif");          // heightmap (about 250x250px)
  cam = new PeasyCam(this,200);
  colorMode(HSB,360,100,100);	

  //Computing Blobs with different thresholds 
  for (int i=0 ; i<levels ; i++) {
    theBlobDetection[i] = new BlobDetection(img.width, img.height);
    theBlobDetection[i].setThreshold(i/levels);
    theBlobDetection[i].computeBlobs(img.pixels);
  }
}


void draw() { 
  background(0);
  translate(-img.width*factor/2,-img.height*factor/2);
  
//sphere einfügen_ fläche dreht sich um sphere  
 stroke(255, 50);
  translate(50, 50, 0);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  fill(mouseX * 2, 0, 160);
  sphereDetail(mouseX / 10);
  sphere(100);
  

 
 


  for (int i=0 ; i<levels ; i++) {
    translate(0,0,elevation/levels);	
    drawContours(i);
  }
}


void drawContours(int i) {
  Blob b;
  EdgeVertex eA,eB;
  for (int n=0 ; n<theBlobDetection[i].getBlobNb() ; n++) {
    b=theBlobDetection[i].getBlob(n);
    if (b!=null) {

      stroke((i/levels*colorRange)+colorStart,100,100);
      for (int m=0;m<b.getEdgeNb();m++) {
        eA = b.getEdgeVertexA(m);
        eB = b.getEdgeVertexB(m);
        if (eA !=null && eB !=null)
          line(
          eA.x*img.width*factor, eA.y*img.height*factor, 
          eB.x*img.width*factor, eB.y*img.height*factor 
            );
            
            
            
      }
    }
  }
}




