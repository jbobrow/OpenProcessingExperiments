
// Computes "chain code" to trace edge of a blob.
// This code only traces the first blob found, 
// Where "first" is defined as "having a pixel with a lower index" (i.e. higher and to the left).
// For multi-blobs, additional code would be needed to label connected blobs first.
// (See "connected component labelling" or "clustering").
// Note that the code does not find interior (nested) contours. 

Point2d firstPixel;
class Point2d {
  int x, y;
  Point2d (int inx, int iny) {
    x = inx; 
    y = iny;
  }
}

ArrayList<Point2d> chain;

//===============================================
void setup() {
  size(400, 400);

  firstPixel = new Point2d(0, 0);
  chain = new ArrayList<Point2d>();
}

//===============================================
void draw() {
  background(0);
  drawSomeWhiteBlobs();

  loadPixels();
  findFirstBlobPixel();
  compute8NeighborChainCode (firstPixel.x, firstPixel.y);

  drawChainCode();
  drawAnnotations();
}



//===============================================
void drawSomeWhiteBlobs() {
  noStroke();
  fill(255);
  ellipse(mouseX, mouseY, 140, 150); 
  ellipse(230, 200, 100, 70); 
  ellipse(280, 190, 70, 140);
  rect(300, frameCount%height, 50, 50);
}

//===============================================
void drawChainCode() {
  noFill();
  strokeWeight(3);
  stroke(255, 0, 0);
  beginShape();
  for (int i=0; i<chain.size(); i++) {
    Point2d P = (Point2d)chain.get(i);
    vertex(P.x, P.y);
  }
  endShape();
}

//===============================================
void drawAnnotations() {
  fill(#8BC0FF); 
  String heading = "BITMAP-TO-VECTOR BLOB TRACER\n"; 
  heading       += "This app extracts the contour (red) of the topleft-most blob,\n";
  heading       += "using an 8-neighbor connected chain code.\n";
  heading       += "# Contour points: " + chain.size();
  text(heading, 15, 20);
}

//===============================================
void findFirstBlobPixel() {
  boolean foundFirst = false;
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      color val = pixels[y*width + x];
      if (!foundFirst && brightness(val) > 0) {
        firstPixel.x = x;
        firstPixel.y = y;
        foundFirst = true;
      }
    }
  }
}

//===============================================
boolean isPixelLocationLegal (int x, int y) {
  if (x < 0 || x >= width)  return false;
  if (y < 0 || y >= height) return false;
  return true;
}

//===============================================
/*	Compute the chain code of the object beginning at pixel (i,j).
 	Return the code as NN integers in the array C.			*/
void compute8NeighborChainCode (int i, int j) {
  int val, n, m, q, r, ii, d, dii;
  int lastdir, jj;
  chain.clear();

  // Table given index offset for each of the 8 directions.	
  int di[] = {
    0, -1, -1, -1, 0, 1, 1, 1
  };
  int dj[] = {
    1, 1, 0, -1, -1, -1, 0, 1
  };


  val = pixels[j*width+i];	
  n = 0; /* Initialize for starting pixel */
  q = i;	
  r = j;  
  lastdir = 4;

  do {
    m = 0;
    dii = -1;	
    d = 100;
    for (ii=lastdir+1; ii<lastdir+8; ii++) { 	/* Look for next */
      jj = ii%8;
      if (isPixelLocationLegal (di[jj]+q, dj[jj]+r)) {
        if ( pixels[(dj[jj]+r)*width + (di[jj]+q)] == val) {
          dii = jj;	
          m = 1;
          break;
        }
      }
    }

    if (m != 0) { /* Found the next pixel ... */
      Point2d P = new Point2d(q, r);
      chain.add(P);
      
      q += di[dii];	
      r += dj[dii];
      lastdir = (dii+5)%8;
    } 
    else {
      break; 	/* NO next pixel */
    }
  } 
  while ( (q!=i) || (r!=j) ); 	/* Stop when next to start pixel */
}


