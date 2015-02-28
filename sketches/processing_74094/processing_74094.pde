
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/68425*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import processing.opengl.*;
import geomerative.*;

//import processing.xml.*;

// global variables
RShape grpa;
String svgFile;
ArrayList ve;
int nve = 1;
int colo;
float xOffset, yOffset;
RGroup grp;
RPoint[] pnts;
float [] iniPntxs;
float [] iniPntys;
float [] iniPntxsT;
float [] iniPntysT;

// global params
float pl = 2.0; // maximum segments length


void setup() {
// Initilaize the sketch
size (500, 500);
// VERY IMPORTANT: Allways initialize the library in the setup
RG.init(this);
frameRate(20);
ve= new ArrayList();

// Choice of colors
background(255);
//fill(255, 102, 0);
//stroke(100);
//strokeWeight(0.5);
smooth();



//svgFile = selectInput();
svgFile = "kenebo.svg";


grpa = RG.loadShape(svgFile);
shapeMode(CENTER);
smooth();
//xOffset = width/2;
//yOffset = height/4*3;
  //grp = grpa.toGroup("c");
exVert(grpa);
//RG.setPolygonizer(RG.UNIFORMLENGTH);
//RG.setPolygonizerLength(pl);




println("tot points: " + ve.size());
println(grpa.getTopRight().x);
xOffset = width/6;
  yOffset = height/6;

strokeWeight(1);
  //grp = grp.toPolygonGroup();
  pnts = grpa.getPoints();
  iniPntxsT = new float[pnts.length];
  iniPntysT = new float[pnts.length];
  iniPntxs = new float[pnts.length];
  iniPntys = new float[pnts.length];
  for ( int i = 0; i < pnts.length; i++ )
  {
    iniPntxsT[i] = pnts[i].x+xOffset;
    iniPntysT[i] = pnts[i].y+yOffset;
    iniPntxs[i] = iniPntxsT[i]*1.1+random(-15, 20);
    iniPntys[i] = iniPntysT[i]*1.1+random(-20, 15);
  }  

}


void draw() {
 {
   
  noStroke();
  fill(255,30);
  rect(0,0,width,height);
  strokeWeight(0);
  stroke(0);
  beginShape();
  for ( int i = 0; i < pnts.length; i++ )
  {
    iniPntxs[i] += (iniPntxsT[i]-iniPntxs[i])/10;
    iniPntys[i] += (iniPntysT[i]-iniPntys[i])/10;
    float x0 = pnts[i].x;
    float y0 = pnts[i].y;
    float a = mouseX-x0;
    float b = mouseY-y0;
    float r = sqrt(a*a+b*b);
    float quer_fugir_x = pnts[i].x-(a/r)*300/r;
    float quer_fugir_y = pnts[i].y-(b/r)*300/r;
    float quer_voltar_x = (iniPntxs[i]-x0)/5;
    float quer_voltar_y = (iniPntys[i]-y0)/5;
    pnts[i].x = quer_fugir_x+quer_voltar_x;
    pnts[i].y = quer_fugir_y+quer_voltar_y;
    curveVertex(pnts[i].x, pnts[i].y);
    
  }
  endShape();
{
if (nve < ve.size()) {
if (((Point) ve.get(nve)).z != -10.0) {
if (mousePressed) {

    ((Point) ve.get(nve-1)).x += 0;
((Point) ve.get(nve-1)).y += 0;

line(((Point) ve.get(nve-1)).x, ((Point) ve.get(nve-1)).y, ((Point) ve.get(nve)).x, ((Point) ve.get(nve)).y);

nve++;

      pnts = grpa.getPoints();
    iniPntxsT = new float[pnts.length];
    iniPntysT = new float[pnts.length];
    iniPntxs = new float[pnts.length];
    iniPntys = new float[pnts.length];
    for ( int i = 0; i < pnts.length; i++ )
    {
      strokeWeight(0);
      iniPntxsT[i] = pnts[i].x+xOffset;
      iniPntysT[i] = pnts[i].y+yOffset;
      iniPntxs[i] = iniPntxsT[i]*1.1+random(-5, 5);
      iniPntys[i] = iniPntysT[i]*1.1+random(-5, 5);
    }
}
  /**/
}
else { 
  RCommand.setSegmentLength(1);
RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  // restart drawing
//delay(10);
background(255);
nve = 9;

 //fill(255,30);
  rect(0,0,width,height);
 
  strokeWeight(0);
  
  //fill(255,20);

 

}
  
/*}
void keyPressed() {
  for (int i=0;i<targetKeys.length;i++) {
    testKey(targetKeys[i]);
  }*/
}
}
}
}
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// recursively find RShape children and "flattens", by putting vertices inside an array
//
void exVert(RShape s) {
RShape[] ch; // children
int n, i, j;
RPoint[][] pa;
n = s.countChildren();
if (n > 0) {
ch = s.children;
for (i = 0; i < n; i++) {
exVert(ch[i]);
}
}
else { // no children -> work on vertex
pa = s.getPointsInPaths();
n = pa.length;
pnts = grpa.getPoints();/*
    iniPntxsT = new float[pnts.length];
    iniPntysT = new float[pnts.length];
    iniPntxs = new float[pnts.length];
    iniPntys = new float[pnts.length];
*/
for (i=0; i<n; i++) {
for (j=0; j<pa[i].length; j++) {
  /*
   iniPntxsT[i] = pnts[i].x+xOffset;
      iniPntysT[i] = pnts[i].y+yOffset;
      iniPntxs[i] = iniPntxsT[i]*1.1+random(-5, 5);
      iniPntys[i] = iniPntysT[i]*1.1+random(-5, 5);*/
if (j==0)
ve.add(new Point(pa[i][j].x, pa[i][j].y, -10.0));
else
ve.add(new Point(pa[i][j].x, pa[i][j].y, 0.0));
}

   /* pnts = grpa.getPoints();
    iniPntxsT = new float[pnts.length];
    iniPntysT = new float[pnts.length];
    iniPntxs = new float[pnts.length];
    iniPntys = new float[pnts.length];*/

     
    }
}


//
}


//println("#paths: " + pa.length);


// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// Class for a 3D point
//
class Point { 
float x, y, z; 
Point(float x, float y, float z) { 
this.x = x; 
this.y = y;
this.z = z;
} 

void set(float x, float y, float z) { 
this.x = x; 
this.y = y;
this.z = z;
}
}


