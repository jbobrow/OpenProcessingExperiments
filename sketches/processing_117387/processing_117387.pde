
import unlekker.util.*;
import unlekker.modelbuilder.*;
import ec.util.*;

/*
reference to 

Modelbuilder library by Marcius Watz

&

Convexhull to stl export
 * by Ben Leduc-Mills
 * 10.5.10
 
*/



import quickhull3d.*;

 UGeometry model;


//init quickhull
QuickHull3D hull = new QuickHull3D();
//init Point3d array
Point3d[] points;
//number of points

int numPoints = 150;

float x;
float r;

void setup() {
 
  size(600, 600, OPENGL);
 
  x = .01; 
  r = 95;
  //populate point3d array with random xyz coordinates
  Point3d[] points = new Point3d[numPoints];
  for(int i = 0; i < numPoints; i++) {
    points[i] = new Point3d (random(70), random(100), random(70));
  }
  hull.build (points);
}
 
void draw() {
  background(255);
  translate(width/2, height/2 -50, 300);
  lights();
  rotateY(frameCount * x);
 
  Point3d[] vertices = hull.getVertices();
 
   stroke(95, 229, 250);
   fill(r,250,214,100);
  beginShape();
   //println ("Faces:");
   int[][] faceIndices = hull.getFaces();
   //print(faceIndices.length);
   for (int i = 0; i < faceIndices.length; i++) {
     for (int k = 0; k < faceIndices[i].length; k++) {
 
        //print (faceIndices[i][k] + " ");
 
        //get points that correspond to each face
        Point3d pnt2 = vertices[faceIndices[i][k]];
        //print(pnt2);
        float x = (float)pnt2.x;
        float y = (float)pnt2.y;
        float z = (float)pnt2.z;
        vertex(x,y,z);
       }
      //println ("");
    }
 
endShape();
}



void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      x++;
    } else if (keyCode == DOWN) {
      x--;
    } 
  } else {
    x=.01;
  }
  

  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      r++;
    }
  } else {
    r=95;
  }

  if(key=='s') {
    model.writeSTL(this, "random_points_3d.stl");
  }
  
}


  



