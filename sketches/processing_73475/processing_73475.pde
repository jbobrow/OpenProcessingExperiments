
import megamu.mesh.*;//import library

//library is like a big class, and there are many small classes in it
//declare object_myDelaunay
Delaunay myDelaunay;
float [][]points;
float [][]myEdges;//points are 2-dimentional? array
float startX, startY, endX, endY;//get these posX and posY from points and use them to draw lines
boolean showDelaunay=true;
float theta;
//float angle1, angle2=random(0, 360);

void setup() {
  size(500, 500);
  smooth();
  initMesh();
}

void draw() {
  background(250);
  translate(255, 255);
  if (showDelaunay) {
    strokeWeight(1);
    //stroke(random(250),random(250),random(250));
    for (int i=0 ; i<myEdges.length ; i++) {//myEdges is an array
      startX=myEdges[i][0];//get posXposY from the points and use them to create Delaunay
      startY=myEdges[i][1];
      endX=myEdges[i][2];
      endY=myEdges[i][3];
      //float distance = dist(startX, startY, endX, endY);
      line(startX, startY, endX, endY);//draw a line
      fill(0);
      ellipse(endX,endY,8,8);
    }
  }
}

void initMesh() {
  if (points==null)initPoints();//if points is ampty, then initialize points
  myDelaunay=new Delaunay(points);//get points from Delaunay
  myEdges=myDelaunay.getEdges(); //get edges from delaunay
}

void initPoints() {
  points=new float[(int)random(50, 100)][2];
  int rad=200;
  for (int i=0; i<points.length; i++) {
    points[i][0]=random(cos(theta) * rad);
    points[i][1]=random(sin(theta) * rad);
    theta+=0.1;
  }
}

void mouseMoved() {
  points[0][0]=mouseX-255;
  points[0][1]=mouseY-255;
  initMesh();
}

void mousePressed() {
  stroke(random(250), 0, random(250));
}


