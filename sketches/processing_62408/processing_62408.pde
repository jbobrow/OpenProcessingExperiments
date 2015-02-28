
import processing.opengl.*;
PImage img1;
int num = 58;
int edgeLength = 25;
Tetrahedron tetrahedrons[][] = new Tetrahedron[num][num];
void setup(){
  size(900, 711, OPENGL);
  img1 = loadImage("water.jpg");
  smooth();
  for(int i=0; i<num; i++){
    for(int j=0; j<num; j++){
      tetrahedrons[i][j] = new Tetrahedron(i*16, j*16, 0, edgeLength);
    }
  }
}
void draw(){
  background(216,255,244);
  image(img1,0,0); 
  ambientLight(255,255,255);
    pointLight(175, 243, 199, width/1.5, height/2, -150);
  //fill(120,120,180,150);
  for(int i=0; i<num; i++){
    for(int j=0; j<num; j++){
      pushMatrix();
      tetrahedrons[i][j].makeShape();
      popMatrix();
    }
  }
}
class Tetrahedron{
  int x, y, z;
  int edgeLength;
  float counter;
  float theta, angleX, angleY, rx, ry;
  boolean selected=false;
  Tetrahedron(int ix, int iy, int iz, int iedgeLength){
    x = ix;
    y = iy;
    z = iz;
    edgeLength = iedgeLength;
  }
  void makeShape(){
    translate(x, y);
    theta = frameCount/TWO_PI;
    float dx = x-mouseX;
    float dy = y-mouseY;
    float d = (sqrt(dx*dx+dy*dy));
    if(d < edgeLength*4){
      counter = 200;
      angleX = ((theta)*0.1);
      angleY = ((theta)*0.1);
      stroke(255);
      rotateY(angleX);
      rotateX(angleY);
      noStroke();
     fill(120,120,180,10);
    }
    else{
      counter-=0.5;
      rx = (rx*0.95)+(angleX*0.1);
      ry = (ry*0.95)+(angleY*0.1);
      rotateX(rx);
      rotateY(ry);
      fill(50,90,150,140);
      stroke(255);
    }
    beginShape(TRIANGLE_STRIP);
    vertex(edgeLength, edgeLength, edgeLength);
    vertex(-edgeLength, -edgeLength, edgeLength);
    vertex(-edgeLength, edgeLength, -edgeLength);
    vertex(edgeLength, -edgeLength, -edgeLength);
    vertex(edgeLength, edgeLength, edgeLength);
    vertex(-edgeLength, -edgeLength, edgeLength);
    endShape(CLOSE);
  }
}


