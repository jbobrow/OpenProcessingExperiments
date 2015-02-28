
//AT FIRST
int DIMENSIONS, VERTICES, EDGES, ROTATIONS;
int MAXDIMENSIONS = 20;

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
boolean running;

void setup() {
  smooth();
  frameRate(50);
  size(450,450,P2D);
  background(0);
  stroke(255,255,255);
  strokeWeight(3);
  fill(255,255,255);
  init(2);
}

void init(int dimensions){

  DIMENSIONS = constrain(dimensions, 2, MAXDIMENSIONS);

  VERTICES = int(pow(2, DIMENSIONS));

  verts = new float[VERTICES][DIMENSIONS];
  finalverts = new float[VERTICES][2];

  EDGES = int(DIMENSIONS * pow(2, DIMENSIONS - 1));

  edges = new int[EDGES][2];

  ROTATIONS = DIMENSIONS*(DIMENSIONS-1)/2;

  running = true;

  matrices = new float[ROTATIONS][DIMENSIONS][DIMENSIONS];
  finalmatrix = new float[DIMENSIONS][DIMENSIONS];
  angles = new float[ROTATIONS];
  incs = new float[ROTATIONS];
  rot = new boolean[ROTATIONS];

  //INITIATE ANGLES AND ROTATION SPEED
  for(int i = 0; i < ROTATIONS; i++) {
    angles[i] = 0;
    incs[i] = random(0.015);
    rot[i] = (random(3)>1)?true:false;
  }

  //SIZE
  SCALE = height /(2 * sqrt(DIMENSIONS));

  //PERSPECTIVE
  d = SCALE * DIMENSIONS / 20;

  //HYPERCUBE CREATION
  for(int i = 0 ; i < VERTICES ; i++) {
    for(int j = 0 ; j < DIMENSIONS ; j++) {
      verts[i][j] = -1;
    }
    int curi = i;
    for(int k = DIMENSIONS - 1 ; k >= 0 ; k--) {
      if(curi >= pow(2, k)) {
        verts[i][k] = 1;
        curi -= pow(2, k);
      }
    }
  }

  //WHICH POINTS TO CONNECT
  int linecount = 0;
  for(int i = 0 ; i < VERTICES; i++) {
    for(int j = 1; j < pow(2, DIMENSIONS); j *= 2) {
      if(i < (i ^ j)) {
        edges[linecount][0] = i;
        edges[linecount][1] = i ^ j;
        linecount++;
      }
    }
  }
}

void draw() {
  background(0);

  //POSITION AND SCALE
  translate(width/2, height/2);
  scale(SCALE, SCALE);

  //ROTATE
  if(running) {
    for(int i = 0 ; i < ROTATIONS ; i++) {
      if(rot[i]) {
        angles[i] += incs[i];
      }
    }
  }

  //CREATE THE ROTATION MATRICES
  //TAKE OUT THE UNNECESSARY CONDITIONALS?
  int rotcount = 0;
  for(int a = 0 ; a < DIMENSIONS - 1 ; a++) {
    for(int b = a + 1 ; b < DIMENSIONS ; b++) {
      for(int i = 0 ; i < DIMENSIONS ; i++) {
        for(int j = 0 ; j < DIMENSIONS ; j++) {
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
  for(int i = 1 ; i < ROTATIONS ; i++) {
    finalmatrix = multiply(matrices[i], finalmatrix);
  }
  for(int i = 0 ; i < VERTICES ; i++) {
    finalverts[i] = projection(rotpoint(verts[i], finalmatrix));
  }
  for(int i = 0 ; i < EDGES ; i++) {
    float x1, y1, x2, y2;
    x1 = finalverts[edges[i][0]][0];
    y1 = finalverts[edges[i][0]][1];
    x2 = finalverts[edges[i][1]][0];
    y2 = finalverts[edges[i][1]][1];
    line(x1, y1, x2, y2);
  }
}

//MULTIPLY two (ROTATION) matrices
float[][] multiply(float[][] matr1, float[][] matr2) {
  float[][] matr12 = new float[DIMENSIONS][DIMENSIONS];
  for(int i = 0 ; i < DIMENSIONS ; i++) {
    for(int j = 0 ; j < DIMENSIONS ; j++) {
      matr12[i][j] = 0;
      for(int k = 0 ; k < DIMENSIONS ; k++) {
        matr12[i][j] += matr1[i][k] * matr2[k][j];
      }
    }
  }
  return matr12;
}

//Apply the ROTATION matrix on the point
float[] rotpoint(float[] vert, float[][] matrix) {
  float[] xy = new float[DIMENSIONS];
  for(int i = 0 ; i < DIMENSIONS ; i++) {
    xy[i] = 0;
    for(int j = 0 ; j < DIMENSIONS ; j++) {
      xy[i] += vert[j] * matrix[j][i];
    }
  }
  return xy;
}

float[] projection(float[] vert) {
  float[] xy = new float[DIMENSIONS];
  for(int i = 0 ; i < DIMENSIONS ; i++) {
    xy[i] = vert[i];
  }
  for(int i = DIMENSIONS - 1 ; i >= 2 ; i--) {
    for(int j = 0 ; j < i ; j++) {
      xy[j] *= d / (d + xy[i]);
    }
  }
  return xy;
}

void keyReleased() {
  if(key == 'p' || key == 'P') {
    running = (running) ? false : true;
  }
  else if(key == 'r' || key == 'R') {
    for(int i = 0 ; i < ROTATIONS ; i++) {
      init(DIMENSIONS);
    }
  }
  else if(key == CODED){
    if(keyCode == UP){
      init(DIMENSIONS + 1);
    }
    else if(keyCode == DOWN){
      init(DIMENSIONS - 1);
    }
  }
}
                                                

