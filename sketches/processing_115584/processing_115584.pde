
/*@pjs preload="texture.jpg";*/

//Raven Kwok (aka Guo Ruiwen)
//p1015a_terrainWanderer
/*
 
 raystain@gmail.com
 ravenkwok.com
 vimeo.com/ravenkwok
 flickr.com/photos/ravenkwok
 twitter.com/ravenkwok
 weibo.com/ravenkwok

*/

PVector cam, camT, camOffset, camOffsetT, camFacing;
float theta, phi;

int coordsLength = 300;

int camPjCol, camPjRow;

Terrain tr;
boolean inTl;

void setup() {
  size(1280, 720, P3D);
  frameRate(30);
  background(255);
  
  tr = new Terrain(20, 20, 100, 0.1, 1800, "texture.jpg");

  cam = new PVector(0, -height/8, height/2);
  camT = new PVector(0, -height/8, height/2);
  camOffset = new PVector(0, 0, 0);
  camOffsetT = new PVector(0, 0, 0);
  camFacing = new PVector(0, 0, 0);
}

void draw() {

  theta = radians(90+(height/2-mouseY)*0.2);
  phi = radians(270+(mouseX-width/2)*0.2);

  camOffsetT.set(100*sin(theta)*cos(phi), 100*cos(theta), 100*sin(theta)*sin(phi));
  cam.set(lerp(cam.x, camT.x, 0.25), lerp(cam.y, camT.y, 1), lerp(cam.z, camT.z, 0.25));
  camOffset.set(lerp(camOffset.x, camOffsetT.x, 0.25), lerp(camOffset.y, camOffsetT.y, 0.25), lerp(camOffset.z, camOffsetT.z, 0.25));
  camFacing = PVector.add(cam, camOffset);

  camPjCol = floor((cam.x+tr.cellSize*tr.cols*0.5)/tr.cellSize);
  camPjRow = floor((cam.z+tr.cellSize*tr.rows*0.5)/tr.cellSize);
  
  background(255);
  translate(width/2, height/2);
  camera(cam.x, cam.y, cam.z, camFacing.x, camFacing.y, camFacing.z, 0, 1, 0);
  //lights();
  //drawCoords();
  updateAltitude();
  tr.display(camPjCol, camPjRow);
}

void drawCoords() {
  noFill();
  strokeWeight(5);
  stroke(0, 0, 255);
  line(0, 0, 0, coordsLength, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, -coordsLength, 0);
  stroke(255, 0, 0);
  line(0, 0, 0, 0, 0, coordsLength);
}

void updateAltitude(){
  float distToTl = dist(cam.x, cam.z, tr.vertices[camPjRow][camPjCol].x, tr.vertices[camPjRow][camPjCol].z);
  float distToBr = dist(cam.x, cam.z, tr.vertices[camPjRow+1][camPjCol+1].x, tr.vertices[camPjRow+1][camPjCol+1].z);
  float [] ratio;
  if(distToTl<distToBr){
    inTl = true;
    ratio = getRatio(tr.vertices[camPjRow+1][camPjCol].x, tr.vertices[camPjRow+1][camPjCol].z, 
                              tr.vertices[camPjRow][camPjCol].x, tr.vertices[camPjRow][camPjCol].z,
                              tr.vertices[camPjRow][camPjCol+1].x, tr.vertices[camPjRow][camPjCol+1].z,
                              cam.x, cam.z);
    camT.y = (ratio[0]*tr.vertices[camPjRow+1][camPjCol].y + ratio[1]*tr.vertices[camPjRow][camPjCol].y + ratio[2]*tr.vertices[camPjRow][camPjCol+1].y)-height/8;
  }
  else {
    inTl = false;
    ratio = getRatio(tr.vertices[camPjRow][camPjCol+1].x, tr.vertices[camPjRow][camPjCol+1].z, 
                              tr.vertices[camPjRow+1][camPjCol+1].x, tr.vertices[camPjRow+1][camPjCol+1].z,
                              tr.vertices[camPjRow+1][camPjCol].x, tr.vertices[camPjRow+1][camPjCol].z,
                              cam.x, cam.z);
    camT.y = (ratio[0]*tr.vertices[camPjRow][camPjCol+1].y + ratio[1]*tr.vertices[camPjRow+1][camPjCol+1].y + ratio[2]*tr.vertices[camPjRow+1][camPjCol].y)-height/8;
  }
}

float [] getRatio(float x1, float z1, float x2, float z2, float x3, float z3, float xAvg, float zAvg){
  float [] result = new float[3];
  
  float t1 = x2-x1;
  float t2 = x3-x1;
  float t3 = xAvg-x1;
  
  float t4 = z2-z1;
  float t5 = z3-z1;
  float t6 = zAvg-z1;
  
  result[2] = (t6*t1-t3*t4)/(t5*t1-t2*t4);
  result[1] = (t3*t5-t2*t6)/(t1*t5-t2*t4);
  result[0] = 1-result[2]-result[1];
  
  return result;
}
class Terrain {
  PImage img;
  PVector [][] vertices;
  int cols, rows;
  float cellSize;

  Terrain(int cols, int rows, float cellSize, float noiseIncreRatio, float yRange, String path) {
    this.cols = cols;
    this.rows = rows;
    this.cellSize = cellSize;
    img = loadImage(path);

    vertices = new PVector[rows][cols];
    for (int i=0;i<rows;i++) {
      for (int j=0;j<cols;j++) {

        float x = (j-cols*0.5)*cellSize;
        float y = (noise(i*noiseIncreRatio, j*noiseIncreRatio)-0.5)*yRange;
        float z = (i-rows*0.5)*cellSize;

        vertices[i][j] = new PVector(x, y, z);
      }
    }
  }

  void display(int camPjCol, int camPjRow) {
    fill(255);
    noStroke();
    beginShape(TRIANGLES);
    for (int i=0;i<rows-1;i++) {
      for (int j=0;j<cols-1;j++) {
        texture(img);
        vertex(vertices[i+1][j].x,vertices[i+1][j].y,vertices[i+1][j].z, float(j)/cols*img.width, float(i+1)/rows*img.height);
        vertex(vertices[i][j].x,vertices[i][j].y,vertices[i][j].z, float(j)/cols*img.width, float(i)/rows*img.height);
        vertex(vertices[i][j+1].x,vertices[i][j+1].y,vertices[i][j+1].z, float(j+1)/cols*img.width, float(i)/rows*img.height);
        
        vertex(vertices[i][j+1].x,vertices[i][j+1].y,vertices[i][j+1].z, float(j+1)/cols*img.width, float(i)/rows*img.height);
        vertex(vertices[i+1][j+1].x,vertices[i+1][j+1].y,vertices[i+1][j+1].z, float(j+1)/cols*img.width, float(i+1)/rows*img.height);
        vertex(vertices[i+1][j].x,vertices[i+1][j].y,vertices[i+1][j].z, float(j)/cols*img.width, float(i+1)/rows*img.height);
      }
    }
    endShape();
  }
}
void keyPressed(){
  if(key == 'w'){
    camT.x+=10*sin(theta)*cos(phi);
    camT.z+=10*sin(theta)*sin(phi);
  }
  else if(key == 's'){
    camT.x-=10*sin(theta)*cos(phi);
    camT.z-=10*sin(theta)*sin(phi);
  }
  else if(key == 'a'){
    camT.x+=10*sin(theta)*cos(phi-PI/2);
    camT.z+=10*sin(theta)*sin(phi-PI/2);
  }
  else if(key == 'd'){
    camT.x+=10*sin(theta)*cos(phi+PI/2);
    camT.z+=10*sin(theta)*sin(phi+PI/2);
  }
  camT.x = constrain(camT.x, -tr.cols*0.5*tr.cellSize, (tr.cols*0.5-1)*tr.cellSize);
  camT.z = constrain(camT.z, -tr.rows*0.5*tr.cellSize, (tr.rows*0.5-1)*tr.cellSize);
}

