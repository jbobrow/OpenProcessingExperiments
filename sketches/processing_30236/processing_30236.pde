
import megamu.mesh.*;

ArrayList<float[]> pointVec = new ArrayList<float[]>();
PImage img, edges;
float scale = 0.5;
int numPoints = 2000;

void setup() {
  img = loadImage("Lenna.jpg");
  edges = loadImage("Lenna.jpg");
  //size((int)(img.width*scale), (int)(img.height*scale));
  size(256,256);
  noLoop();
  smooth();

  for (int x = 1; x < edges.width; x++) {
    for (int y = 0; y < edges.height; y++ ) {
      // Pixel location and color
      int loc = x + y*edges.width;
      color pix = edges.pixels[loc];

      // Pixel to the left location and color
      int leftLoc = (x-1) + y*edges.width;
      color leftPix = edges.pixels[leftLoc];

      // New color is difference between pixel and left neighbor
      float diff = abs(brightness(pix) - brightness(leftPix));
      edges.pixels[leftLoc] = color(diff);
    }
  }

  while (pointVec.size () < numPoints) {
    float[] pnt = new float[2];
    pnt[0] = random(edges.width);
    pnt[1] = random(edges.height);
    if (red(edges.get((int)pnt[0], (int)pnt[1])) > 1) {
      pointVec.add(pnt);
    }
  }
}

void draw() {
  image(img, 0, 0, width, height );

  if (mousePressed) {
    
    // add a point
    float[] pnt = new float[2];
    pnt[0] = (mouseX + random(30) - 15) / scale;
    pnt[1] = (mouseY + random(30) - 15)  / scale;
    pointVec.add(pnt);
  }

  float[][] pointArray = (float[][])pointVec.toArray(new float[0][]);
  Voronoi myVoronoi = new Voronoi( pointArray );

  MPolygon[] myRegions = myVoronoi.getRegions();

  for (int i=0; i<myRegions.length; i++)
  {
    float[][] regionCoordinates = myRegions[i].getCoords();

    color c = img.get((int)pointArray[i][0], (int)pointArray[i][1]);
    if (mousePressed) {
      fill(c, 200);
    }
    else {
      fill(c);
    }
    stroke(red(c)*0.9, green(c)*0.9, blue(c)*0.9);
    drawRegion(myRegions[i]);
  }

  fill(0);
  noFill();
  for (int i=0; i<pointArray.length; i++)
   {
     //ellipse(pointArray[i][0] * scale, pointArray[i][1] * scale, 5, 5);
   }

  if (keyPressed) {
    saveFrame("VoronoiPortrait.tif");
  }
}



public void drawRegion(MPolygon poly) {
  beginShape();
  float[][] coords = poly.getCoords();
  for (int i=0; i<coords.length; i++) {
    vertex(coords[i][0] * scale, coords[i][1] * scale);
  }
  endShape(PApplet.CLOSE);
}


