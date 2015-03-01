
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/31184*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* Tweaks by James W. Dunn:
   -Modified to visualize a 3D cube using P2D in processing.js
   -Removed multi-dimensionality, scale, and UI
   -Removed random rotation, increased side length of cube
   -Added visual queues for depth based on Z dimension
*/

//GEOMETRY
float[][] verts, finalverts;
int[][] edges;
 
//SIZE
float SCALE;
 
//ROTATION
float[] angles, incs;
float[][][] matrices;
float[][] finalmatrix;
boolean[] rot;
 
//PERSPECTIVE
float d;
 
void setup() {
  size(450,450,P2D);
  ellipseMode(CENTER);
  stroke(127,127,255);
  fill(127,127,255);
  strokeWeight(2);
 
  verts = new float[8][3];
  finalverts = new float[8][2];
  
  edges = new int[12][2];
 
  matrices = new float[3][3][3];
  finalmatrix = new float[3][3];
  angles = new float[3];
  incs = new float[3];
  rot = new boolean[3];
 
  //INITIATE ANGLES AND ROTATION SPEED
  for(int i = 0; i < 3; i++) {
    angles[i] = 0;
    incs[i] = random(0.015);
    rot[i] = true;
  }
  rot[1] = false;
  incs[0] = 0.002544147481676191;
  incs[2] = 0.004748248793184757;
 
  //SIZE
  SCALE = height /(2 * sqrt(3));  // 129.9
 
  //PERSPECTIVE
  d = SCALE * 3;  //19.48
 
  //HYPERCUBE CREATION
  for(int i = 0 ; i < 8 ; i++) {
    for(int j = 0 ; j < 3 ; j++) {
      verts[i][j] = -100;
    }
    int curi = i;
    for(int k = 2 ; k >= 0 ; k--) {
      if(curi >= pow(2, k)) {
        verts[i][k] = 100;
        curi -= pow(2, k);
      }
    }
  }

  //WHICH POINTS TO CONNECT
  int linecount = 0;
  for(int i = 0 ; i < 8; i++) {
    for(int j = 1; j < 8; j *= 2) {
      if(i < (i ^ j)) {
        edges[linecount][0] = i;
        edges[linecount][1] = i ^ j;
        linecount++;
      }
    }
  }
}  // end of setup()
 



void draw() {
  background(0);
 
  //POSITION
  translate(width/2, height/2);
 
  for(int i = 0 ; i < 3 ; i++) {
    if(rot[i]) {
      angles[i] += incs[i];
    }
  }

 
  //CREATE THE ROTATION MATRICES
  //TAKE OUT THE UNNECESSARY CONDITIONALS?
  int rotcount = 0;
  for(int a = 0 ; a < 2 ; a++) {
    for(int b = a + 1 ; b < 3 ; b++) {
      for(int i = 0 ; i < 3 ; i++) {
        for(int j = 0 ; j < 3 ; j++) {
          if(i == j && (i == a || i == b)) {
            matrices[rotcount][i][j] = cos(angles[rotcount]);
          }
          else if(i == j) {
            matrices[rotcount][i][j] = 1;
          }
          else if( ( i != a && i != b ) || ( j != a && j != b ) ) {
            matrices[rotcount][i][j] = 0;
          }
          else if(i == a && j == b) {
            matrices[rotcount][i][j] = -sin(angles[rotcount]);
          }
          else if(i == b && j == a) {
            matrices[rotcount][i][j] = sin(angles[rotcount]);
          }
          else {
            println("Error!");
          }
        }
      }
      rotcount++;
    }
  }
  finalmatrix = matrices[0];
  for(int i = 1 ; i < 3 ; i++) {
    finalmatrix = multiply(matrices[i], finalmatrix);
  }
  for(int i = 0 ; i < 8 ; i++) {
    finalverts[i] = projection(rotpoint(verts[i], finalmatrix));
  }
  for(int i = 0 ; i < 12 ; i++) {
    float x1, y1, x2, y2, z1, z2;
    x1 = finalverts[edges[i][0]][0];
    y1 = finalverts[edges[i][0]][1];
    z1 = finalverts[edges[i][0]][2];  // depth
    x2 = finalverts[edges[i][1]][0];
    y2 = finalverts[edges[i][1]][1];
    z2 = finalverts[edges[i][1]][2];  // depth
    if (i == 7 || i == 5) { //swap for symmetry
      float t1,t2,t3;
      t1=x1; t2=y1; t3=z1;
      x1=x2; y1=y2; z1=z2;
      x2=t1; y2=t2; z2=t3;
    }
    line(x1, y1, x2, y2);
    float mwid=(300-z1)/30;  // visual queues for depth
    noStroke();
    fill(127,127,255,210+int(mwid*3));
      ellipse(x1,y1, mwid, mwid);
    stroke(127,127,255);
    fill(127,127,255);
  }
}  // end of draw()



 
//MULTIPLY two (ROTATION) matrices
float[][] multiply(float[][] matr1, float[][] matr2) {
  float[][] matr12 = new float[3][3];
  for(int i = 0 ; i < 3 ; i++) {
    for(int j = 0 ; j < 3 ; j++) {
      matr12[i][j] = 0;
      for(int k = 0 ; k < 3 ; k++) {
        matr12[i][j] += matr1[i][k] * matr2[k][j];
      }
    }
  }
  return matr12;
}
 
//Apply the ROTATION matrix on the point
float[] rotpoint(float[] vert, float[][] matrix) {
  float[] xy = new float[3];
  for(int i = 0 ; i < 3 ; i++) {
    xy[i] = 0;
    for(int j = 0 ; j < 3 ; j++) {
      xy[i] += vert[j] * matrix[j][i];
    }
  }
  return xy;
}
 
float[] projection(float[] vert) {
  float[] xy = new float[3];
  xy[2] = vert[2];
  
  xy[0] = vert[0] * d / (d + xy[2]);
  xy[1] = vert[1] * d / (d + xy[2]);
  
  return xy;
}
 



