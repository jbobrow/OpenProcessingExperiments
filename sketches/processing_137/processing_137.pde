
import processing.pdf.*;
PFont smFont;

float gm = 137.5077640500378; // golden mean ratio
float spacer = 0.6176470588235294/2;  // the incremental distance I want the  
// radius to increase by (21/34)/2

float iNodeX = 0;     // initial radius
float iNodeY = 0;
int iNode = 0;      // current node number
int maxNodes=3000;
float currAngle = 0;     // current angle

boolean record=false;

void setup(){
  size(500, 500);

  smFont=loadFont("HelveticaNeue-12.vlw");

  background(255);
  noStroke();
  ellipseMode(CENTER);  
  smooth();

}

void draw(){
  if (record){
    beginRecord(PDF, "phyllotaxis cn0["+cn[0]+"] cn1["+cn[1]+"] cn2["+cn[2]+"].pdf");
  }

  background(255);
  point(width/2,height/2);
  currAngle=0;
  for (int i=-50;i<maxNodes;i++){
    placeNode(i) ;
  }



if(record){
  endRecord();
  exit();
}
}

void keyPressed() {
  if (key=='s'){
    record=true;
  }
}

void placeNode(int iNode){
  spacer=.35+cn[0];
  currAngle += gm; // increase the angle by the gm
  iNodeX = int((spacer * iNode) * sin(radians(currAngle))+ width/2); //radius * sin(angle) + the offset distance
  iNodeY = int((spacer * iNode) * cos(radians(currAngle))+ height/2);

  float scaleDot = currAngle / (gm*maxNodes); // value 0-1 based on distance from origin
  int clrVals = int(scaleDot*255);  
  //fill(clrVals*4,clrVals*8,clrVals*2); // creates clr based on hsb
  //fill(clrVals*2); // creates shade of grey  
  fill(0);
  //ellipse(iNodeX, iNodeY, 10, 10);
  float r=sin(scaleDot*6+cn[2]*3)*20*(.5+cn[1]);
  //int r=int(25*scaleDot);
  pushMatrix();
  translate(iNodeX,iNodeY);
  noStroke();
  ellipse(0, 0, r ,r); // draws rectangle

  // rotate(radians(r));
  //stroke(0);
  // strokeWeight(1/90);
  // line (0, 0,0,25);
  popMatrix();
}


