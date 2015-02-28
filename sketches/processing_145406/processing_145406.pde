
///////////////////////////
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Don't use without permission
//
// Based on:
// #107 Aurora triangularis
// http://geometrydaily.tumblr.com/post/21210037613/107-aurora-triangularis-a-new-minimal-geometric
//
// Controls:
// MouseClick   - redraw 
//
/////////////////////////////////////////////////

int sz = 700;
int folds = 3;
float [] itrV = new float [folds+1];
float [] itrN = new float [folds+1];
float [][] point = new float [3][2];
float [][] dist  = new float [2][2];
float [][] pointIn = new float [folds*2+4][2];

void setup() {
  size(sz, sz);
  noLoop();
  noStroke();
  colorMode(HSB, 100, 100, 100, 100);
}

void draw() {
  initFoldPoint();
  background(0, 0, 90);
  fill(random(100), random(90, 100), random(45, 55), 35);

  beginShape(QUAD_STRIP);
  for (int i =0; i<pointIn.length; i++) {
    vertex(pointIn[i][0], pointIn[i][1]);
  }
  endShape(CLOSE);

  paper(10); 
}

void initFoldPoint() {  
  itrV = new float [folds+1];
  itrN = new float [folds+1];
  pointIn = new float [folds*2+4][2];

  point[0][0] = random(sz/3, sz/2);
  point[0][1] = random(100, 200);
  point[1][0] = random(sz/4, point[0][0]+point[0][0]/7);
  point[1][1] = random(sz-200, sz-100);
  point[2][0] = random(sz-300, sz/3*folds); 
  point[2][1] = random(250, sz-250);

  float [] sum = { 0, 0 };
  for (int i=0; i<folds+1; ++i) {
    sum[0] += itrV[i] = random(.3, (10/(folds))) / 10;
    sum[1] += itrN[i] = random(.3, (10/(folds))) / 10;

    if (i==folds) {
      itrV[itrV.length-1] = 1-sum[0];
      itrN[itrN.length-1] = 1-sum[1];
    }
  }

  dist[0][0] =  point[2][0]-point[0][0];
  dist[0][1] =  point[2][1]-point[0][1];

  dist[1][0] =  point[2][0]-point[1][0];
  dist[1][1] =  point[2][1]-point[1][1];

  pointIn[0][0] = point[0][0]; pointIn[0][1] = point[0][1];  //point xy1 u
  pointIn[1][0] = point[1][0]; pointIn[1][1] = point[1][1];  //point xy1 b

  for (int i=2, j=0, k=1; i< pointIn.length-1 ;++i) {
    //point xy u
    if (i%2==0) {
      pointIn[i][0] = pointIn[i-2][0] + dist[0][0]*itrV[j]*k;
      pointIn[i][1] = pointIn[i-2][1] + dist[0][1]*itrV[j];
    } 
    else {
      //point xy b
      pointIn[i][0] = pointIn[i-1][0];
      pointIn[i][1] = pointIn[i-2][1] + dist[1][1]*itrN[j++];
      k*=-1;
    }
  }
  //point xylast n
  pointIn[pointIn.length-1][0] = pointIn[pointIn.length-2][0];
  pointIn[pointIn.length-1][1] = pointIn[pointIn.length-2][1];
}     

void mousePressed() {
  folds = (int)random(3, 6);
  initFoldPoint();
  redraw();
}

void paper(int in_val) {
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(85-10, 85+10), in_val);
      rect(i, j, 2, 2);
    }
  }

  for (int i = 0; i<30; i++) {
    fill(random(40, 60), random(in_val*2.5, in_val*3));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}
