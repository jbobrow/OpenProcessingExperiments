
import megamu.mesh.*;
import peasy.*;
import geomerative.*;

RShape grp;
RPoint[] coords;
PeasyCam cam;
Delaunay d;
float[][] points;
int count=0;
String msg= "Type!";

void setup() {
  size(800, 400, P3D);
  background(255);
  cam= new PeasyCam(this, 500);

  RG.init(this);
  create();
}
void create() {
  grp=RG.getText(msg, "GenBasB.ttf", 120, CENTER);
  RG.setPolygonizer(RG.ADAPTATIVE);
  coords= grp.getPoints();

  points=new float[coords.length][2];

  for(int i=0; i<points.length; i++) {    
    points[i][0]=coords[i].x;
    points[i][1]=coords[i].y;
  }
  d= new Delaunay(points);
}



void draw() {
  rotateY(radians(count%360));
  background(255);
  translate(0, 100, 0);
  
  if(msg.length()>0) {
    beginShape(TRIANGLE_STRIP);
    for(int i=0; i<coords.length; i++) {
      float depth= map(i, 0, coords.length, 0, 500); 
      float col= map(i, 0, coords.length, 0, 255);
      fill(col, 0, 255-col, 80); 
      stroke(col, 0, 255-col, 200);
      vertex(coords[i].x, coords[i].y, -depth);
    }
    endShape();
    noStroke();
    float[][] myEdges = d.getEdges(); 
    beginShape(TRIANGLE_STRIP);
    for(int i=0; i<myEdges.length; i++) {

      float startX = myEdges[i][0];
      float startY = myEdges[i][1];
      float endX = myEdges[i][2];
      float endY = myEdges[i][3];
      float depth= map(i, 0, myEdges.length, 0, 500);
      float col= map(i, 0, myEdges.length, 0, 255);
      fill(255-col, 0, col, 80);
      vertex(startX, startY, -depth);
      vertex(endX, endY, -depth);
    }
    endShape();
  }
  count++;
}

void keyTyped() {
  if(key==ENTER) {
    msg="";
  }
  else {
    msg+=key;
    create();
  }
}


