
// Computes "chain code" to trace the contours of a set of labeled blobs.
// This code assumes that each isolated blob has been labeled with its 
// own unique color (label), using "connected component labelling".
// Note that the code does not find interior (nested) contours. 

Point2d firstPixel;
class Point2d {
  int x, y;
  Point2d (int inx, int iny) {
    x = inx; 
    y = iny;
  }
}

ArrayList<ArrayList> chains;
ArrayList colorLabels;

//===============================================
void setup() {
  size(400, 400);

  firstPixel = new Point2d(0, 0);
  chains = new ArrayList<ArrayList>(); // a collection of contours.
  colorLabels = new ArrayList();
}

//===============================================
void draw() {
  background(0);
  drawSomeBlobs();

  loadPixels();

  chains.clear();
  int nLabels = compileLabelColors();
  for (int i=0; i<nLabels; i++) {
    findBlobStartPixel(i);
    compute8NeighborChainCode (firstPixel.x, firstPixel.y);
    //drawChainCode();
  }
  drawAllChains();
  drawAnnotations();
}



//===============================================
void drawSomeBlobs() {
  noStroke();
  fill(255, 200, 200);
  ellipse(mouseX, mouseY, 140, 150); 

  fill(200, 255, 200);
  ellipse(230, 200, 100, 70); 
  ellipse(280, 190, 70, 140);

  fill(200, 200, 255);
  rect(300, 300, 50, 50);
}

//===============================================
void drawAllChains() {
  noFill();
  strokeWeight(2);
  stroke(255, 0, 0);

  for (int n=0; n<chains.size(); n++) {
    ArrayList aContour = (ArrayList)chains.get(n); 
    
    beginShape();
    for (int i=0; i<aContour.size(); i++) {
      Point2d P = (Point2d)aContour.get(i);
      vertex(P.x, P.y);
    }
    endShape();
  }
}

//===============================================
void drawAnnotations() {
  fill(#8BC0FF); 
  String heading = "BITMAP-TO-VECTOR MULTI-BLOB TRACER\n"; 
  heading       += "This app extracts the vector contour (red) of each bitmap blob,\n";
  heading       += "using an 8-neighbor connected chain code.\n";
  heading       += "Assumes blobs are uniquely labeled.\n";
  text(heading, 15, 20);
}


//===============================================
int compileLabelColors() {

  colorLabels.clear();
  color black = color(0, 0, 0); 
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      color val = pixels[y*width + x];

      if (val != black) {
        if (colorLabels.size() == 0) {
          colorLabels.add(val);
        } 
        else {

          boolean bFound = false;
          for (int i=0; i<colorLabels.size(); i++) {
            color col = (color)(((Integer)(colorLabels.get(i))).intValue()); // yech 
            if (val == col) {
              bFound = true;
            }
          }
          if (bFound == false) {
            colorLabels.add(val);
          }
        }
      }
    }
  }

  return colorLabels.size();
}

//===============================================
void findBlobStartPixel (int whichLabel) {

  color searchColor = (color)(((Integer)(colorLabels.get(whichLabel))).intValue()); 
  boolean foundBlobStartPixel = false;
  color black = color(0, 0, 0); 

  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      color val = pixels[y*width + x];

      if (!foundBlobStartPixel && (val == searchColor)) {
        firstPixel.x = x;
        firstPixel.y = y;
        foundBlobStartPixel = true;
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
  int val, m, q, r, ii, d, dii;
  int lastdir, jj;
  
  ArrayList aContour = new ArrayList<Point2d>();
  aContour.clear();

  // Table given index offset for each of the 8 directions.	
  int di[] = {
    0, -1, -1, -1, 0, 1, 1, 1
  };
  int dj[] = {
    1, 1, 0, -1, -1, -1, 0, 1
  };


  val = pixels[j*width+i];	
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
      aContour.add(P);

      q += di[dii];	
      r += dj[dii];
      lastdir = (dii+5)%8;
    } 
    else {
      break; 	/* NO next pixel */
    }
  } 
  while ( (q!=i) || (r!=j) ); 	/* Stop when next to start pixel */
  chains.add(aContour);
}


