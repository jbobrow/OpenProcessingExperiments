
//some variables for the view...
int offX, offY, offZ;
float ang, spd;

//some variables to hold the current polyhedron...
ArrayList verts;
float dispSz, edgeLength;
String strName, strNotes;
int currID;

//================================================================

void setup() {
  size(700, 450, P3D);
  smooth();
  textMode(SCREEN);
  textSize(11);
  
  //some positional variables for translation
  offY = height/2;
  offX = offY - 20;
  offZ = -offY;
  
  //angle and speed for rotation
  ang = 0.0;
  spd = 0.015;
  
  //set up initial polyhedron
  verts = new ArrayList();
  currID = 0;
  setupPoly(currID);
}

//================================================================

void draw() {
  //setup the view
  background(200);  
  translate(offX, offY, offZ);
  rotateX(sin(-ang*0.3)*0.5);
  rotateY(ang);
  drawAxis();
  
  //draw the polyhedron
  strokeWeight(.75);
  stroke(0);
  for (int i=0; i<verts.size(); i++)
    for (int j=i + 1; j<verts.size(); j++)
      if (isEdge(i, j))
        vLine((vert)verts.get(i), (vert)verts.get(j));
    
  //show some notes
  fill(80, 50, 20);
  text(strName, height - 50, 50);
  text(strNotes, height - 30, 70);
  text("Click to view next polyhedron...", height - 50, height - 50);
  
  //bump up the angle for the spin
  ang += spd;
}

//================================================================

void mouseReleased() {
  //change the polyhedron
  setupPoly(++currID);
}

//================================================================

void vLine(vert v1, vert v2) {
  //Draws an edge line
  line(v1.x*dispSz, v1.y*dispSz, v1.z*dispSz, v2.x*dispSz, v2.y*dispSz, v2.z*dispSz);
}

//================================================================

boolean isEdge(int vID1, int vID2) {
  //had some rounding errors that were messing things up, so I had to make it a bit more forgiving...
  int pres = 1000;
  vert v1 = (vert)verts.get(vID1);
  vert v2 = (vert)verts.get(vID2);
  float d = sqrt(sq(v1.x - v2.x) + sq(v1.y - v2.y) + sq(v1.z - v2.z)) + .00001;
  return (int(d*pres)==int(edgeLength*pres));

}

//================================================================

class vert {
  //simple vertex class to hold the numbers
  float x, y, z;
  vert(float xx, float yy, float zz) {
    x = xx;
    y = yy;
    z = zz;
  }
}

//================================================================

void addVerts(float x, float y, float z) {
  //adds the requested vert and all "mirrored" verts
  verts.add (new vert(x, y, z));
  if (z != 0.0) verts.add (new vert(x, y, -z));  
  if (y != 0.0) {
    verts.add (new vert(x, -y, z));
    if (z != 0.0) verts.add (new vert(x, -y, -z));
  }  
  if (x != 0.0) {
    verts.add (new vert(-x, y, z));
    if (z != 0.0) verts.add(new vert(-x, y, -z));
    if (y != 0.0) {
      verts.add (new vert(-x, -y, z));
      if (z != 0.0) verts.add (new vert(-x, -y, -z));
    }
  }
}

//================================================================

void addPermutations(float x, float y, float z) {
  //adds vertices for all three permutations of x, y, and z
  addVerts(x, y, z);
  addVerts(z, x, y);
  addVerts(y, z, x);
}

//================================================================

void drawAxis() {
  //based off how Sketchup handles their axis
  strokeWeight(.5);
  stroke(0, 128, 0);
  line(-300, 0, 0, 0, 0, 0);
  stroke(0, 0, 128);
  line(0, -300, 0, 0, 0, 0);
  stroke(128, 0, 0);
  line(0, 0, -300, 0, 0, 0);
  strokeWeight(.25);
  stroke(0, 128, 0);
  line(300, 0, 0, 0, 0, 0);
  stroke(0, 0, 128);
  line(0, 300, 0, 0, 0, 0);
  stroke(128, 0, 0);
  line(0, 0, 300, 0, 0, 0);
}

//================================================================

void setupPoly(int id) {
  //This is where the actual defining of the polyhedrons takes place
  
  float PHI = (1 + sqrt(5))/2; //a number of polys use the golden ratio...
  float ROOT2 = sqrt(2); //...and the square root of two
  
  verts.clear(); //clear out whatever verts are currently defined
  
  switch (id) {
    case 0:
      strName = "Cube";
      strNotes = "Type: platonic\nFaces: 6 squares\nVertices: 8\nEdges: 12";
      addVerts(1, 1, 1);
      edgeLength = 2;
      dispSz = 140;
      break;      
    case 1:
      strName = "Octohedron";
      strNotes = "Type: platonic\nFaces: 8 triangles\nVertices: 6\nEdges: 12";
      addPermutations(1, 0, 0);
      edgeLength = ROOT2;
      dispSz = 220;
      break;      
    case 2:      
      strName = "Dodecahedron";
      strNotes = "Type: platonic\nFaces: 12 pentagons\nVertices: 20\nEdges: 30";
      addVerts(1, 1, 1);
      addPermutations(0, 1/PHI, PHI);
      edgeLength = 2/PHI;
      dispSz = 130;
      break;      
    case 3:
      strName = "Icosahedron";
      strNotes = "Type: platonic\nFaces: 20 triangles\nVertices: 12\nEdges: 30";
      addPermutations(0, 1, PHI);
      edgeLength = 2.0;
      dispSz = 120;
      break;      
    case 4:
      strName = "Rhombic Dodecahedron";
      strNotes = "Type: Catalan\nFaces: 12 rhombuses\nVertices: 14\nEdges: 24";
      addVerts(1, 1, 1);
      addPermutations(0, 0, 2);
      edgeLength = sqrt(3);
      dispSz = 110;
      break;      
    case 5:
      strName = "Rhombic Triacontahedron";
      strNotes = "Type: Catalan\nFaces: 30 rhombuses\nVertices: 32\nEdges: 60";
      addVerts(sq(PHI), sq(PHI), sq(PHI));
      addPermutations(sq(PHI), 0, pow(PHI, 3));
      addPermutations(0, PHI, pow(PHI, 3));
      edgeLength = PHI*sqrt(PHI + 2);
      dispSz = 46;
      break;
    case 6:
      strName = "Cuboctahedron";
      strNotes = "Type: Archimedian\nFaces: 8 triangles, 6 squares\nVertices: 12\nEdges: 24";
      addPermutations(1, 0, 1);
      edgeLength = ROOT2;
      dispSz = 170;
      break;      
    case 7:
      strName = "Truncated Cube";
      strNotes = "Type: Archimedian\nFaces: 8 triangles, 6 octogons\nVertices: 24\nEdges: 36";
      addPermutations(ROOT2 - 1, 1, 1);
      edgeLength = 2*(ROOT2 - 1);      
      dispSz = 155;
      break;      
    case 8:
      strName = "Truncated Octahedron";
      strNotes = "Type: Archimedian\nFaces: 6 squares, 8 hexagons\nVertices: 24\nEdges: 36";
      addPermutations(0, 1, 2);
      addPermutations(2, 1, 0);
      edgeLength = ROOT2;
      dispSz = 100;
      break;      
    case 9:
      strName = "Rhombicuboctahedron";
      strNotes = "Type: Archimedian\nFaces: 8 triangles, 18 squares\nVertices: 24\nEdges: 48";
      addPermutations(ROOT2 + 1, 1, 1);
      edgeLength = 2;
      dispSz = 80;
      break;      
    case 10:
      strName = "Truncated Cuboctahedron";
      strNotes = "Type: Archimedian\nFaces: 12 squares, 8 hexagons, 6 octogons\nVertices: 48\nEdges: 72";
      addPermutations(ROOT2 + 1, 2*ROOT2 + 1, 1);
      addPermutations(ROOT2 + 1, 1, 2*ROOT2 + 1);
      edgeLength = 2;
      dispSz = 50;
      break;      
    case 11:
      strName = "Icosidodecahedron";
      strNotes = "Type: Archimedian\nFaces: 20 triangles, 12 pentagons\nVertices: 30\nEdges: 60";
      addPermutations(0, 0, 2*PHI);
      addPermutations(1, PHI, sq(PHI));
      edgeLength = 2;
      dispSz = 70;
      break;      
    case 12:
      strName = "Truncated Dodecahedron";
      strNotes = "Type: Archimedian\nFaces: 20 triangles, 12 decagons\nVertices: 60\nEdges: 90";
      addPermutations(0, 1/PHI, PHI + 2);
      addPermutations(1/PHI, PHI, 2*PHI);
      addPermutations(PHI, 2, sq(PHI));
      edgeLength = 2*(PHI - 1);
      dispSz = 60;
      break;      
    case 13:
      strName = "Truncated Icosahedron";
      strNotes = "Type: Archimedian\nFaces: 12 pentagons, 20 hexagons\nVertices: 60\nEdges: 90";
      addPermutations(0, 1, 3*PHI);
      addPermutations(2, 2*PHI + 1, PHI);
      addPermutations(1, PHI + 2, 2*PHI);
      edgeLength = 2;
      dispSz = 45;
      break;      
    case 14:
      strName = "Small Rhombicosidodecahedron";
      strNotes = "Type: Archimedian\nFaces: 20 triangles, 30 squares, 12 pentagons\nVertices: 60\nEdges: 120";
      addPermutations(1, 1, pow(PHI, 3));
      addPermutations(sq(PHI), PHI, 2*PHI);
      addPermutations(PHI + 2, 0, sq(PHI));
      edgeLength = 2;
      dispSz = 50;
      break;      
    case 15:
      strName = "Great Rhombicosidodecahedron";
      strNotes = "Type: Archimedian\nFaces: 30 squares, 20 hexagons, 12 decagons\nVertices: 120\nEdges: 180";
      addPermutations(1/PHI, 1/PHI, PHI + 3);
      addPermutations(2/PHI, PHI, 2*PHI + 1);
      addPermutations(1/PHI, sq(PHI), 3*PHI - 1);
      addPermutations(2*PHI - 1, 2, PHI + 2);
      addPermutations(PHI, 3, 2*PHI);
      edgeLength = 2*PHI - 2;
      dispSz = 48;
      break;      
    default :
      currID = 0;
      setupPoly(currID);
  }
}

