
import megamu.mesh.*;

//requires hemesh 1.2.3
import wblut.hemesh.*;
import wblut.hemesh.modifiers.*;
import wblut.hemesh.creators.*;
import wblut.geom.*;
import wblut.hemesh.subdividors.*;

float[][] points;
float[][] haloPoints;
int numpoints, numHaloPoints;
HE_Mesh container;
HE_Mesh[] cells;
int numcells;

void setup() {
  size(840,560,P3D);
  //create a sphere
  HEC_Geodesic geo=new HEC_Geodesic(this);
  geo.setRadius(300).setLevel(2); 
  container=new HE_Mesh(geo);

  //generate points
  numpoints=10;
  points=new float[numpoints][3];
  for(int i=0;i<numpoints;i++) {
    points[i][0]=random(-250,250);
    points[i][1]=random(-250,250);
    points[i][2]=random(-20,20);
  }

  //generate voronoi cells
  HEMC_VoronoiCells vcmc=new HEMC_VoronoiCells(this);
  vcmc.setPoints(points).setContainer(container).setOffset(5);
  cells=vcmc.create();
  numcells=cells.length;

  // subdivide celld
  for(int i=0;i<numcells;i++) {
    HES_CatmullClark cc = new HES_CatmullClark();
    HES_Smooth sm = new HES_Smooth();
    HES_DooSabin ds = new HES_DooSabin().setFactors(0.4, 0.6);
    // cells[i].subdivide( ds, 2 );
    cells[i].subdivide( cc, 3 );
  }
  
  //generate halo points
  numHaloPoints=500;
  haloPoints=new float[numHaloPoints][3];
  for(int i=0;i<numHaloPoints;i++) {
    float radius = random(240,250);
    float angle0 = random(TWO_PI);
    float angle1 = random(TWO_PI);
    haloPoints[i][0]=cos(angle0)*radius;
    haloPoints[i][1]=sin(angle0)*radius;
    haloPoints[i][2]=cos(angle1)*radius;
  }

  smooth();
}

void draw() {
  background(255);
  lights();
  translate(width/2,height/2,-200);
  rotateX(1f/height*mouseY*TWO_PI-PI);
  rotateY(1f/width*mouseX*TWO_PI-PI);

  // get vertices as float
  stroke(0);
  noFill();

  for(int i=0;i<numcells;i++) {
    // draw only each second cell
    if(i%2==0) {
      float[][] positions = cells[i].getVerticesAsFloat();

      // get mesh bounding box
      int numShapes = 20;
      for(int k=0;k<numShapes;k++) {
        if(k%5 == 0) {
          stroke(0, 200);
          strokeWeight(2);
        }
        else {
          stroke(100, 50);
          strokeWeight(.75);
        }
        
        float ratio = (float)k/(numShapes-1);
        double[] limits = cells[i].limits();
        float middleY = (float)limits[1] + (float)(limits[4] - limits[1])*(ratio);
        // add points to a convex hull diagram in the middle
        ArrayList<PVector> points = new ArrayList<PVector>();
        for(int j=0;j<positions.length;j++) {
          if(abs(positions[j][1] - middleY)  < 5) {
            points.add( new PVector(positions[j][0],positions[j][2]) );
          }
        }

        // convert arraylist to float array
        int numPositions = points.size();
        float[][] hullPoints = new float[numPositions][2];
        for(int j=0;j<numPositions;j++) {
          hullPoints[j][0] = points.get(j).x;
          hullPoints[j][1] = points.get(j).y;
        }
        Hull myHull = new Hull( hullPoints );
        MPolygon myRegion = myHull.getRegion();
        float[][] hullCoords = myRegion.getCoords();
        int numCoords = hullCoords.length;
        
        beginShape();
        for(int j=0;j<numCoords;j++) {
          if(j==0) vertex(hullCoords[j][0], middleY, hullCoords[j][1]);
          curveVertex(hullCoords[j][0], middleY, hullCoords[j][1]);
        }
        curveVertex(hullCoords[0][0], middleY, hullCoords[0][1]);
        endShape();
        
        stroke(0);
        for(int j=0;j<numCoords;j++) {
          strokeWeight(noise(j)*2);
          point(hullCoords[j][0], middleY, hullCoords[j][1]);
        }
      }
      /*
      for(int j=0;j<positions.length;j++) {
        strokeWeight(noise(j)*2);
        point(positions[j][0], positions[j][1], positions[j][2]);
      }
      */
    }
  }
  
  // draw halo points
  stroke(0);
  for(int i=0;i<numHaloPoints;i++) {
    point(haloPoints[i][0], haloPoints[i][1], haloPoints[i][2]);
    strokeWeight(noise(i)*2);
    
    haloPoints[i][0]*= .99 + noise(i)*.01;
    haloPoints[i][1]*= .99 + noise(i)*.01;
    haloPoints[i][2]*= .99 + noise(i)*.01;
  }
}

void mousePressed() {
  // save("shot" + millis() + ".png");
}


