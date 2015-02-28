
/* This sketch allows the user to explore an image and the blob detection library using two thresholds:
   1 - the threshold to identify any blob
   2 - a minimum size to the blob
   
   Use your mouse to hover over the image; your relative vertical position assigns the threshold to
   identify a blob against the background, while your horizontal position assigns the minimum size
   threshold. To make exploration easier, all blobs are rendered on screen, but those which are larger
   than the size threshold are more prominent. There is also a continuously updating message in the 
   feedback window with both thresholds, and how many blobs meet the criteria.
*/

// Import libraries
import blobDetection.*;

// Define variables and objects
BlobDetection theBlobDetection;
PImage pic;
Float picThreshold;
int blobCount;

// ==================================================
// setup()
// ==================================================
void setup()
{
  pic = loadImage("sample.jpg");
  
  picThreshold = 0.0;
  blobCount = 0;
  
  theBlobDetection = new BlobDetection(pic.width, pic.height);
  theBlobDetection.setPosDiscrimination(false);
  theBlobDetection.setThreshold(0.0f);
  theBlobDetection.computeBlobs(pic.pixels);

  // Size of applet - uncomment the second line if you're using your own image.
  size(301,342);
  //size(pic.width, pic.height);
}

// ==================================================
// draw()
// ==================================================
void draw()
{
  image(pic,0,0,width,height);

  theBlobDetection.setThreshold(picThreshold);
  theBlobDetection.computeBlobs(pic.pixels);

  picThreshold = ((float) mouseY)/height;
  
  blobCount = 0;
  
  drawBlobsAndEdges(true,false);
  println("found "+blobCount+" of "+theBlobDetection.getBlobNb()+" blobs bigger than "+mouseX+" pixels at threshold "+picThreshold);
  
}

// ==================================================
// drawBlobsAndEdges()
// ==================================================
void drawBlobsAndEdges(boolean drawBlobs, boolean drawEdges) {
  noFill();
  Blob b;
  EdgeVertex eA,eB;
  for (int n=0 ; n<theBlobDetection.getBlobNb() ; n++) {
    b=theBlobDetection.getBlob(n);
    if (b!=null) {
      
      // Edges
      if (drawEdges) {
        strokeWeight(2);
        stroke(0,255,0);
        for (int m=0;m<b.getEdgeNb();m++) {
          eA = b.getEdgeVertexA(m);
          eB = b.getEdgeVertexB(m);
          if (eA !=null && eB !=null)
            line(
              eA.x*width, eA.y*height, 
              eB.x*width, eB.y*height
            );
        }
      }

      // Blobs
      if (drawBlobs)
      {
        if( ( b.w*width * b.h*height ) > mouseX ){
          stroke(255,0,0,255);
          strokeWeight(2);
          blobCount++;
        } else {
          stroke(255,0,0,128);
          strokeWeight(1);
        }
        rect(
          b.xMin*width,b.yMin*height,
          b.w*width,b.h*height
        );
      }

    }
  }
}


