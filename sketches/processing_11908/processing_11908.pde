
int num = 18;
int edgeLength = 20;

Tetrahedron tetrahedrons[][] = new Tetrahedron[num][num];

void setup(){
  size(800, 800, P3D);
  for(int i=0; i<num; i++){
    for(int j=0; j<num; j++){
      tetrahedrons[i][j] = new Tetrahedron(i*50, j*50, 0, edgeLength);
    }
  }
}

void draw(){
  background(0);

  if(keyPressed){
    if(key==32){
      fill(255);
      stroke(0);
      directionalLight(255, 0, 0, -1, 1, 0);
      directionalLight(200, 200, 255, 0, -1, 0);
    }
  }
  else{
    noFill();
  }
  directionalLight(0, 0, 255, 0, 0, -1);
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

    if(d < edgeLength*2){
      counter = 200;
      angleX = ((theta)*0.1);
      angleY = ((theta)*0.1);
      stroke(200, 200, 255);
      rotateY(angleX);
      rotateX(angleY);
    }
    else{
      counter-=0.5;
      rx = (rx*0.95)+(angleX*0.1);
      ry = (ry*0.95)+(angleY*0.1);
      rotateX(rx);
      rotateY(ry);
      stroke(counter, counter, 255);
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

















