
import megamu.mesh.*;
import geomerative.*;

RFont f;
RShape grp;
RPoint[] coords;

float[][] points;
Delaunay d;
Voronoi v;

int choice;

String msg= "Type!";

void setup() {
  size(800, 400);
  smooth();
  background(255);

  RG.init(this); //start geomerative
  create();
}

void create() {
  //convert text to points
  grp = RG.getText(msg, "GenBasB.ttf", 120, CENTER);
  RG.setPolygonizer(RG.ADAPTATIVE);
  //RG.setPolygonizer(RG.UNIFORMSTEP);
  //RG.setPolygonizerLength(10);
  coords= grp.getPoints();

  //convert from RPoint[] to float[][]
  points=new float[coords.length][2];

  for(int i=0; i<points.length; i++) {    
    points[i][0]=coords[i].x;
    points[i][1]=coords[i].y;
  }

  check();

  d= new Delaunay(points);
  v= new Voronoi(points);
}

void check() {
  for(int i=0; i<points.length; i++) {
    for(int j=0; j<i; j++) {
      if(points[i][0]==points[j][0]&&points[i][1]==points[j][1]) {
        points[i][0]+=random(1);
        points[i][1]+=random(1);
        points[j][0]-=random(1);
        points[j][1]-=random(1);
      }
    }
  }
}


void draw() {
  if(msg.length()>0) {
    strokeWeight(0.5);
    background(255);
    noFill();
    translate(width/2, height/2+50);
    stroke(0, 150);


    //draw the voronoi
    if(choice%3==0||choice%3==1) {
      float[][] myEdges = v.getEdges(); 
      for(int i=0; i<myEdges.length; i++)
      {
        float startX = myEdges[i][0];
        float startY = myEdges[i][1];
        float endX = myEdges[i][2];
        float endY = myEdges[i][3];
        line( startX, startY, endX, endY );
      }
    }

    stroke(0, 100);
    //draw the delaunay
    if(choice%3==0 ||choice%3==2) {
      float[][] myEdges2 = d.getEdges(); 
      for(int i=0; i<myEdges2.length; i++)
      {
        float startX = myEdges2[i][0];
        float startY = myEdges2[i][1];
        float endX = myEdges2[i][2];
        float endY = myEdges2[i][3];
        line( startX, startY, endX, endY );
      }
    }
    //grp.draw();
  }
}

void keyTyped() {
  if(key==ENTER) {
    msg="";
    background(255);
  }
  else {
    msg+=key;
    create();
  }
}

void mousePressed() {
  choice++;
}


