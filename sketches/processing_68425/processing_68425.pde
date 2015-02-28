
import processing.opengl.*;
import geomerative.*;

//import processing.xml.*;

// global variables
RShape grp;
String svgFile;
ArrayList ve;
int nve = 1;
int colo;


// global params
float pl = 2.0; // maximum segments length


void setup() {
// Initilaize the sketch
size (827, 900);
frameRate(24);
ve= new ArrayList();

// Choice of colors
background(255);
fill(255, 102, 0);
stroke(100);
strokeWeight(1);

// VERY IMPORTANT: Allways initialize the library in the setup
RG.init(this);

//svgFile = selectInput();
svgFile = "Drawing machine drawing [2].svg";
grp = RG.loadShape(svgFile);
smooth();

RG.setPolygonizer(RG.UNIFORMLENGTH);
RG.setPolygonizerLength(pl);

exVert(grp);
println("tot points: " + ve.size());
println(grp.getTopRight().x);

}

void draw() {
if (nve < ve.size()) {
if (((Point) ve.get(nve)).z != -10.0) {
if (mousePressed) {
((Point) ve.get(nve-1)).x += 0;
((Point) ve.get(nve-1)).y += 0;
}
line(((Point) ve.get(nve-1)).x, ((Point) ve.get(nve-1)).y, ((Point) ve.get(nve)).x, ((Point) ve.get(nve)).y);
}
nve++;
}
else { // restart drawing
delay(3000);
background(255);
nve = 9;
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
for (i=0; i<n; i++) {
for (j=0; j<pa[i].length; j++) {
if (j==0)
ve.add(new Point(pa[i][j].x, pa[i][j].y, -10.0));
else
ve.add(new Point(pa[i][j].x, pa[i][j].y, 0.0));
}
}
println("#paths: " + pa.length);
}
}

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

