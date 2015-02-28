
int np = 6;
int nc = 15;
float r1 = 9;
float r2 = 12;
float r3 = 7;
DraggableEllipse[][] de = new DraggableEllipse[nc][2];
DraggableCurve [] dc = new DraggableCurve[nc];
int pIFDEI;
int[] pIFCI = new int[2];
int pIFCI0, pIFCI1;
float sq3 = sqrt(3);
float m1 = - 2*sq3/6;
float m2 = 2*sq3/6;
float[] den = new float[5];
boolean cAS;
ArrayList cL = new ArrayList();
int[] pClick = new int[2];
int swap;
boolean gridOn = true;
int w = 700;
int h = w;
int inc = 80;
int gridx = 5;
int gridy = 4;
float sw1 = 1.75;
float sw2 = 1.0;
float sw3 = 2.25;
float s = 2.0*(w-2*inc)/(4+3*(gridx-1));
//float s = 2*(h-2*inc)/((3+2*(gridy-1))*sq3);
float Xi = inc+0.5*s;
float Yi = inc+ sq3/2*s +(h-(2*inc+((3+2*(gridy-1))*sq3*s)/2.0))/2.0;
float initialx, initialy;
color[] pColour = new color[np];
color pColourOn = color(255, 0, 0);
color pColourOff = color(255);
float s2 = 3*inc/(4*sq3);
float s3 = 3*inc/(8*sq3);
float cH1Xi = (inc+s2)/2.0;
float cH1Yi = inc/8.0;
float cH2Xi = cH1Xi + 2*s2 + 1/2.0*s3;
float cH2Yi = cH1Yi + sq3/2.0*(s2-s3);
float cH3Xi = cH2Xi + 2*s3 + 1/2.0*s2;
float cH3Yi = cH2Yi;
float cH4Xi = cH3Xi + 2*s3 + 1/2.0*s2;
float cH4Yi = cH3Yi;
ControlHex cH1, cH2, cH3, cH4;
HexTileMaster htm;
HexTile[][] ht = new HexTile [gridy][gridx];
int cIFVI;
color[] cPC = new color[nc]; 
boolean tangentMode = false;
String tangentModeString = "T";
boolean hexTileMasterOn = true;
String hexTileMasterString = "-";
int indexA, indexB;
color[] controlLineStroke = new color[nc];


void setup() {
 size(w, h);
 smooth();
 background(255);
 strokeWeight(sw2);
 
cPC[0] = color(230,232,25); 
cPC[1] = color(244,163,237); 
cPC[2] = color(0,234,243); 
cPC[3] = color(153,241,59); 
cPC[4] = color(248,71,150); 
cPC[5] = color(255,167,89); 
cPC[6] = color(254,204,80); 
cPC[7] = color(229,107,255); 
cPC[8] = color(133,109,255); 
cPC[9] = color(193,55,175); 
cPC[10] = color(90,251,185); 
cPC[11] = color(183,183,183); 
cPC[12] = color(132,157,189); 
cPC[13] = color(183,134,173); 
cPC[14] = color(115,157,156); 
 
 for (int i = 0; i < 5; i++) {
   den[i] = 2.0; //1.0/3;
 } 
// for (int i = 0; i < 5; i++) {
//   den[i] = 10.0/(i+1);
// }  
 
cH1 = new ControlHex(cH1Xi, cH1Yi, s2);
cH2 = new ControlHex(cH2Xi, cH2Yi, s3);
cH3 = new ControlHex(cH3Xi, cH3Yi, s3);
cH4 = new ControlHex(cH4Xi, cH4Yi, s3);

 htm  = new HexTileMaster(Xi, Yi);
 
 for (int i = 0; i < nc; i++) {
   dc[i] = new DraggableCurve(i);
   controlLineStroke[i] = color(0);
   for (int j = 0; j < 2; j++) {     
     de[i][j] = new DraggableEllipse(i, j, pointIndexFromDraggableEllipseIndices(i, j), htm.c[i][j][0], htm.c[i][j][1]);
   }
 }
 
// for (int i = 0; i < nc; i++) {
//   dc[i] = new DraggableCurve(i);
//   pColour[i] = color(255);
//   controlLineStroke[i] = color(0);
// }
 
 for (int j = 0; j < gridy; j++) {
 initialx = Xi;
 initialy = Yi;
 for (int i = 0; i < gridx; i++) {
   if (j == 0 && i == 0) {
      initialx = initialx + 1.5*s;
      initialy = initialy - sq3/2.0*s;
   }
   else {  
   ht[j][i] = new HexTile(initialx, initialy+j*2*sq3/2.0*s);
     if (i%2 == 0) {
       initialx = initialx + 1.5*s;
       initialy = initialy - sq3/2.0*s;
     }
     else {
       initialx = initialx + 1.5*s;
       initialy = initialy + sq3/2.0*s;
     }
  }
 }
}
 
for (int i = 0; i < np; i++) {
  pColour[i] = color(255);
}
 
pClick[0] = -1; pClick[1] = -1;
 
textAlign(CENTER);
textSize(22); 
 
}

void draw() {
  background(255);
//  pushMatrix();
//  scale(1, -1);
//  translate(0, -h);

//ellipse(cH1.p[0][0], cH1.p[0][1], 10, 10);
//ellipse(cH1.p[1][0], cH1.p[1][1], 10, 10);
//line(cH1.p[0][0], cH1.p[0][1], cH1.p[1][0], cH1.p[1][1]);

cH1.display();
fill(0);
text(tangentModeString, cH3Xi + s3/2.0, cH3Yi + sq3/2.0*s3+s3*0.5);
noFill();
cH3.display();
fill(0);
text(hexTileMasterString, cH4Xi + s3/2.0 + s3*0.05, cH4Yi + sq3/2.0*s3+s3*0.4); 
noFill();
cH4.display();

for (int i = 0; i < nc; i++) {
  if (cL.contains(i)) {
    for (int j = 0; j < 2; j++) {
      de[i][j].drag(mouseX, mouseY);
      de[i][j].display();
    }
  }
}

for (int i = 0; i < nc; i++) {
  if (cL.contains(i)) {
    dc[i].display();
//    fill(controlLineStroke[i]);
    line(cH1.p[pointIndicesFromCurveIndex(i)[0]][0], cH1.p[pointIndicesFromCurveIndex(i)[0]][1], cH1.p[pointIndicesFromCurveIndex(i)[1]][0], cH1.p[pointIndicesFromCurveIndex(i)[1]][1]); 
//    noFill();
  }
}  
  
//ellipse(cH1Xi+s2/2.0, cH1Yi+sq3*s2/2.0, 2*sq3/2.0*s2, 2*sq3/2.0*s2);  
  
//stroke(gridColour); 
//cH1.display();
//ellipse(cH1Xi+s2/2.0, cH1Yi+sq3*s2/2.0, sq3*s2, sq3*s2); 
//noFill();

//for (int ci = 0; ci < nc; ci++) {
//stroke(255, 0, 0);
//strokeWeight(5);
//line(p[pointIndicesFromCurveIndex(ci)[0]][0], p[pointIndicesFromCurveIndex(ci)[0]][1], p[pointIndicesFromCurveIndex(ci)[1]][0], p[pointIndicesFromCurveIndex(ci)[1]][1]);
//stroke(0);
//strokeWeight(1);
//}
//stroke(0, 0, 255);
//line(inc, inc, w-inc, inc);
//line(w-inc, inc, w-inc, h-inc);
//line(w-inc, h-inc, inc, h-inc);
//line(inc, h-inc, inc, inc);
//stroke(0);
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//strokeCap(SQUARE);
//beginShape();
//  for (int i = 0; i < np; i++) {
//   vertex(v[i][0], v[i][1]);
//  }
//endShape(CLOSE);
//
//for (int i = 0; i < np; i++) {
//  ellipse(p[i][0], p[i][1], r2, r2);
//}           
       
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  

if (gridOn) {
stroke(180, 180, 180);
cH2.display();
stroke(0);
for (int j = 0; j < gridy; j++) {
  for (int i = 0; i < gridx; i++) {
  if (!(j == 0 && i == 0)) {
    ht[j][i].display();
  }
}
}
htm.sidesOn = true;
}
else {
  stroke(0);
  cH2.display();
  noStroke();
  for (int j = 0; j < gridy; j++) {
  for (int i = 0; i < gridx; i++) {
  if (!(j == 0 && i == 0)) {
    ht[j][i].display();
  }
}
}
htm.sidesOn = false;
}

for (int i = 0; i < nc; i++) {
  if (cL.contains(i)) {
   indexA = pointIndicesFromCurveIndex(i)[0];
   indexB = pointIndicesFromCurveIndex(i)[1];
     if (cH1.p[indexA][0] < cH1.p[indexB][0]) {
      if (mouseX > cH1.p[indexA][0] && mouseX < cH1.p[indexB][0] && mouseY > cH1.L(indexA, indexB, mouseX) - r3/2.0 && mouseY < cH1.L(indexA, indexB, mouseX) + r3/2.0) {
        stroke(255, 0, 0);
        line(cH1.p[indexA][0], cH1.p[indexA][1], cH1.p[indexB][0], cH1.p[indexB][1]);
      }       
     }
     else if (cH1.p[indexA][0] > cH1.p[indexB][0]) {
      if (mouseX > cH1.p[indexB][0] && mouseX < cH1.p[indexA][0] && mouseY > cH1.L(indexA, indexB, mouseX) - r3/2.0 && mouseY < cH1.L(indexA, indexB, mouseX) + r3/2.0) {
        stroke(255, 0, 0);
        line(cH1.p[indexA][0], cH1.p[indexA][1], cH1.p[indexB][0], cH1.p[indexB][1]);
      }       
     }
     else if (cH1.p[indexA][0] == cH1.p[indexB][0] && cH1.p[indexA][1] < cH1.p[indexB][1]) {
      if (mouseX > cH1.p[indexA][0] -r3/2.0 && mouseX < cH1.p[indexA][0] + r3/2.0 && mouseY > cH1.p[indexA][1] && mouseY < cH1.p[indexB][1]) {
        stroke(255, 0, 0);
        line(cH1.p[indexA][0], cH1.p[indexA][1], cH1.p[indexB][0], cH1.p[indexB][1]);
      }       
     } 
     else if (cH1.p[indexA][0] == cH1.p[indexB][0] && cH1.p[indexA][1] > cH1.p[indexB][1]) {
      if (mouseX > cH1.p[indexA][0] -r3/2.0 && mouseX < cH1.p[indexA][0] + r3/2.0 && mouseY > cH1.p[indexB][1] && mouseY < cH1.p[indexA][1]) {
        stroke(255, 0, 0);
        line(cH1.p[indexA][0], cH1.p[indexA][1], cH1.p[indexB][0], cH1.p[indexB][1]);
      }       
     }     
  }  
}

htm.display();
//popMatrix();
}
 

void mousePressed() {
  for (int i = 0; i < nc; i++) {
    for (int j = 0; j < 2; j++) {
      de[i][j].clicked(mouseX, mouseY);
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < nc; i++) {
    for (int j = 0; j < 2; j++) {
      de[i][j].stopDragging();
    } 
  }
}

void mouseClicked() {
    if (dist(mouseX, mouseY, cH2Xi+s3/2.0, cH2Yi+sq3*s3/2.0) < sq3/2.0*s3) { 
    if (gridOn) {
          gridOn = false;
    }
    else {
          gridOn = true;
    }
  }
  
if (dist(mouseX, mouseY, cH3Xi+s3/2.0, cH3Yi+sq3*s3/2.0) < sq3/2.0*s3) {  
  if (!tangentMode) {
    tangentModeString = "F";
    tangentMode = true;
  }
  else {
    tangentModeString = "T";
    tangentMode = false;
}  
} 

if (dist(mouseX, mouseY, cH4Xi+s3/2.0, cH4Yi+sq3*s3/2.0) < sq3/2.0*s3) {  
  if (!hexTileMasterOn) {
    hexTileMasterString = "-";
    hexTileMasterOn = true;
    htm.pointsOn = true;
    for (int i = 0; i < nc; i++) {
      if (cL.contains(i)) {
        dc[i].curvesOn = true;
      }
    }
    for (int i = 0; i < nc; i++) {
      if (cL.contains(i)) {
        for (int j = 0; j < 2; j++) {
          de[i][j].draggableEllipsesOn = true;
        }
      }
    }
  }
  else {
    hexTileMasterString = "+";
    hexTileMasterOn = false;
    htm.pointsOn = false;
    for (int i = 0; i < nc; i++) {
      if (cL.contains(i)) {
        dc[i].curvesOn = false;
      }
    }
    for (int i = 0; i < nc; i++) {
      if (cL.contains(i)) {
        for (int j = 0; j < 2; j++) {
          de[i][j].draggableEllipsesOn = false;
        }
      }
    }
  }  
}

for (int i = 0; i < np; i++) {
  if (dist(mouseX, mouseY, htm.p[i][0],htm.p[i][1]) < r2/2.0) {
    sorter();
    if (pClick[0] == -1 && pClick[1] == -1) {
       pClick[0] = i; 
       pColour[i] = pColourOn;
       fill(pColour[i]);
       ellipse(htm.p[i][0], htm.p[i][1], r2, r2);
       noFill();
    }
    else if (pClick[0] == -1 && pClick[1] != -1) {
       pClick[0] = i;
       pColour[i] = pColourOff;
       fill(pColour[i]);
       ellipse(htm.p[i][0], htm.p[i][1], r2, r2);
       noFill();
       pColour[pClick[1]] = pColourOff;
       fill(pColour[pClick[1]]);
       ellipse(htm.p[pClick[1]][0], htm.p[pClick[1]][1], r2, r2);
       noFill();
       sorter();
       curveAdder(curveIndexFromVertexIndices(pClick[0], pClick[1]));
       pClick[0]=-1; pClick[1]=-1;
    }
  }  
 } 

for (int i = 0; i < nc; i++) {
  if (cL.contains(i)) {
   indexA = pointIndicesFromCurveIndex(i)[0];
   indexB = pointIndicesFromCurveIndex(i)[1];
     if (cH1.p[indexA][0] < cH1.p[indexB][0]) {
      if (mouseX > cH1.p[indexA][0] && mouseX < cH1.p[indexB][0] && mouseY > cH1.L(indexA, indexB, mouseX) - r3/2.0 && mouseY < cH1.L(indexA, indexB, mouseX) + r3/2.0) {
          curveSubtractor(i);
      }       
     }
     else if (cH1.p[indexA][0] > cH1.p[indexB][0]) {
      if (mouseX > cH1.p[indexB][0] && mouseX < cH1.p[indexA][0] && mouseY > cH1.L(indexA, indexB, mouseX) - r3/2.0 && mouseY < cH1.L(indexA, indexB, mouseX) + r3/2.0) {
          curveSubtractor(i);
      }       
     }
     else if (cH1.p[indexA][0] == cH1.p[indexB][0] && cH1.p[indexA][1] < cH1.p[indexB][1]) {
      if (mouseX > cH1.p[indexA][0] -r3/2.0 && mouseX < cH1.p[indexA][0] + r3/2.0 && mouseY > cH1.p[indexA][1] && mouseY < cH1.p[indexB][1]) {
          curveSubtractor(i);
      }       
     } 
     else if (cH1.p[indexA][0] == cH1.p[indexB][0] && cH1.p[indexA][1] > cH1.p[indexB][1]) {
      if (mouseX > cH1.p[indexA][0] -r3/2.0 && mouseX < cH1.p[indexA][0] + r3/2.0 && mouseY > cH1.p[indexB][1] && mouseY < cH1.p[indexA][1]) {
          curveSubtractor(i);
      }       
     }     
  }  
}
} 

void sorter() {
  if (pClick[0] > pClick[1]) {
   swap = pClick[0];
   pClick[0] = pClick[1];
   pClick[1] = swap;  
  }
}

int pointIndexFromDraggableEllipseIndices(int i, int j) {
if (i <= 4)
 if (j == 0)
   pIFDEI = 0;
 else 
   pIFDEI = i + 1;  
else if (i <= 8)
 if (j == 0)
   pIFDEI = 1;
 else  
   pIFDEI = i - 3; 
else if (i <= 11)
 if (j == 0)
   pIFDEI = 2;
 else  
   pIFDEI = i - 6;
else if (i <= 13)
 if (j == 0)
   pIFDEI = 3;
 else  
   pIFDEI = i - 8;
else if (i <= 14)
 if (j == 0)
   pIFDEI = 4;
 else 
   pIFDEI = 5; 
   
return pIFDEI;   
}

int[] pointIndicesFromCurveIndex(int i) {
 if (i <= 4) {
   pIFCI[0] = 0;
   pIFCI[1] = i + 1;
 } 
 else if (i <= 8) {
   pIFCI[0] = 1;
   pIFCI[1] = i - 3;
 }
 else if (i <= 11) {
   pIFCI[0] = 2;
   pIFCI[1] = i - 6;
 }
 else if (i <= 13) {
   pIFCI[0] = 3;
   pIFCI[1] = i - 8;
 }
 else {
   pIFCI[0] = 4;
   pIFCI[1] = 5;
 }

return pIFCI;
}

int curveIndexFromVertexIndices(int i, int j) {
if (i == 0)
   cIFVI = j - 1;  
else if (i == 1)
   cIFVI = j + 3;
else if (i == 2)
   cIFVI = j + 6;
else if (i == 3)
   cIFVI = j + 8;
else if (i == 4)
   cIFVI = j + 9;   
   
return cIFVI;   
}

void curveAdder(int i) {
  cAS = true;
  if (cL.size() != 0) {
    for (int k = 0; k < cL.size(); k++) {
      if (i == (Integer) cL.get(k)) {
        cAS = false;
        break;
      }  
    }
  }
  if (cAS) {
    cL.add(i);
  }  
}

void curveSubtractor(int i) {
  if (cL.size() != 0) {
    for (int k = 0; k < cL.size(); k++) {
      if (i == (Integer) cL.get(k)) {
        cL.remove(k);
        break;
      }
    }
  }
}  

class DraggableEllipse {
 boolean dragging;
 float x, y;
 float offsetX, offsetY;
 int dei1, dei2, dei3;
 boolean draggableEllipsesOn = true;

 DraggableEllipse(int deIndex1, int deIndex2, int deIndex3, float tempX, float tempY) {
   x = tempX;
   y = tempY;
   offsetX = 0;
   offsetY = 0; 
   dei1 = deIndex1;
   dei2 = deIndex2;
   dei3 = deIndex3;
 }

void clicked(int mx, int my) {
 if (dist(mx, my, x, y) < r1/2) {
   dragging = true;
   offsetX = x - mx;
   offsetY = y - my;
 }
}

void display() {
  if (draggableEllipsesOn) {
    strokeWeight(sw2);
    line(htm.p[dei3][0], htm.p[dei3][1], x, y);
    fill(cPC[dei1]);
    ellipse(x, y, r1, r1);
  }
}

void drag(int mx, int my) {
 if (dragging) {
   if (tangentMode) {
    if (dei1 <= 4 && dei2 == 0) {
      x = htm.p[0][0];
      y = my + offsetY;
    }
    else if ((dei1 == 0 && dei2 == 1) || (dei1 <= 8 && dei2 == 0)) {
      x = mx + offsetX;
      y = htm.L1(x);
    } 
    else if ((dei1 == 1 && dei2 == 1) || (dei1 == 5 && dei2 == 1) || (dei1 <= 11 && dei2 == 0)) {
      x = mx + offsetX;
      y = htm.L2(x);
    } 
    else if ((dei1 == 2 && dei2 == 1) || (dei1 == 6 && dei2 == 1) || (dei1 == 9 && dei2 == 1) || (dei1 <= 13 && dei2 == 0)) {
      x = htm.p[3][0];
      y = my + offsetY;
    }
    else if ((dei1 == 3 && dei2 == 1) || (dei1 == 7 && dei2 == 1) || (dei1 == 10 && dei2 == 1) || (dei1 == 12 && dei2 == 1) || (dei1 == 14 && dei2 == 0)) {
      x = mx + offsetX;
      y = htm.L1(x);
    } 
    else if ((dei1 == 4 && dei2 == 1) || (dei1 == 8 && dei2 == 1) || (dei1 == 11 && dei2 == 1) || (dei1 == 13 && dei2 == 1) || (dei1 == 14 && dei2 == 1)) {
      x = mx + offsetX;
      y = htm.L2(x);
    }    
  }
  else {    
    x = mx + offsetX;
    y = my + offsetY;
  }  
 }
}

void stopDragging() {
  dragging = false;
}

float getX() {
 return x;
}

float getY() {
 return y;
}

}

class DraggableCurve {
int ci;
boolean curvesOn = true;
 
DraggableCurve(int curveIndex) {
  ci = curveIndex;
}
 
void display() {
  strokeWeight(sw1);
  noFill();
  if (!curvesOn) {
    stroke(0);
    beginShape();
      vertex(htm.p[pointIndicesFromCurveIndex(ci)[0]][0], htm.p[pointIndicesFromCurveIndex(ci)[0]][1]);
      bezierVertex(de[ci][0].getX(), de[ci][0].getY(), de[ci][1].getX(), de[ci][1].getY(), htm.p[pointIndicesFromCurveIndex(ci)[1]][0], htm.p[pointIndicesFromCurveIndex(ci)[1]][1]);
    endShape();
  }  
  else {  
    stroke(cPC[ci]);
    beginShape();
      vertex(htm.p[pointIndicesFromCurveIndex(ci)[0]][0], htm.p[pointIndicesFromCurveIndex(ci)[0]][1]);
      bezierVertex(de[ci][0].getX(), de[ci][0].getY(), de[ci][1].getX(), de[ci][1].getY(), htm.p[pointIndicesFromCurveIndex(ci)[1]][0], htm.p[pointIndicesFromCurveIndex(ci)[1]][1]);
    endShape();
  }  
  stroke(0);
  for (int j = 0; j < gridy; j++) {
  for (int i = 0; i < gridx; i++) {
  if (!(j == 0 && i == 0)) {
  ht[j][i].curveSet(htm.p[pointIndicesFromCurveIndex(ci)[0]][0], htm.p[pointIndicesFromCurveIndex(ci)[0]][1], de[ci][0].getX(), de[ci][0].getY(), de[ci][1].getX(), de[ci][1].getY(), htm.p[pointIndicesFromCurveIndex(ci)[1]][0], htm.p[pointIndicesFromCurveIndex(ci)[1]][1]);
  }
}
}
  
}

}

class HexTileMaster {
float p[][] = new float[np][2];
float v[][] = new float[np][2];
float c[][][] = new float[nc][2][2];
float cp[] = new float[2]; 
float xi, yi;
float b1, b2;
boolean pointsOn = true;
boolean sidesOn = true;
  
 HexTileMaster(float xi, float yi) {
 this.xi = xi;
 this.yi = yi; 
 p[0][0] = xi + s/2; p[0][1] = yi;
 p[1][0] = xi + s*5/4; p[1][1] = yi + s*sq3/4;
 p[2][0] = xi + s*5/4; p[2][1] = yi + s*3*sq3/4;
 p[3][0] = xi + s/2; p[3][1] = yi + s*sq3;
 p[4][0] = xi - s/4; p[4][1] = yi + s*3*sq3/4;
 p[5][0] = xi - s/4; p[5][1] = yi + s*sq3/4;
 v[0][0] = xi; v[0][1] = yi;
 v[1][0] = xi + s; v[1][1] = yi;
 v[2][0] = xi + 3*s/2; v[2][1] = yi + s*sq3/2;
 v[3][0] = xi + s; v[3][1] = yi + s*sq3;
 v[4][0] = xi; v[4][1] = yi + s*sq3;
 v[5][0] = xi - s/2; v[5][1] = yi + s*sq3/2;
 b1 = p[1][1]-m1*p[1][0];
 b2 = p[2][1]-m2*p[2][0];
 cp[0] = p[0][0];
 cp[1] = yi+s*sq3/2;
 c[0][0][0] = p[0][0]; c[0][0][1] = p[0][1] + (cp[1] - p[0][1])/den[0]; 
 c[1][0][0] = p[0][0]; c[1][0][1] = p[0][1] + (cp[1] - p[0][1])/den[1]; 
 c[2][0][0] = p[0][0]; c[2][0][1] = p[0][1] + (cp[1] - p[0][1])/den[2];
 c[3][0][0] = p[0][0]; c[3][0][1] = p[0][1] + (cp[1] - p[0][1])/den[3]; 
 c[4][0][0] = p[0][0]; c[4][0][1] = p[0][1] + (cp[1] - p[0][1])/den[4];

 c[0][1][0] = p[1][0]-(p[1][0] - cp[0])/den[0]; c[0][1][1] = L1(c[0][1][0]); 
 c[5][0][0] = p[1][0]-(p[1][0] - cp[0])/den[1]; c[5][0][1] = L1(c[5][0][0]);
 c[6][0][0] = p[1][0]-(p[1][0] - cp[0])/den[2]; c[6][0][1] = L1(c[6][0][0]);
 c[7][0][0] = p[1][0]-(p[1][0] - cp[0])/den[3]; c[7][0][1] = L1(c[7][0][0]);
 c[8][0][0] = p[1][0]-(p[1][0] - cp[0])/den[4]; c[8][0][1] = L1(c[8][0][0]);
 
 c[1][1][0] = p[2][0]-(p[2][0] - cp[0])/den[0]; c[1][1][1] = L2(c[1][1][0]); 
 c[5][1][0] = p[2][0]-(p[2][0] - cp[0])/den[1]; c[5][1][1] = L2(c[5][1][0]);
 c[9][0][0] = p[2][0]-(p[2][0] - cp[0])/den[2]; c[9][0][1] = L2(c[9][0][0]);
 c[10][0][0] = p[2][0]-(p[2][0] - cp[0])/den[3]; c[10][0][1] = L2(c[10][0][0]); 
 c[11][0][0] = p[2][0]-(p[2][0] - cp[0])/den[4]; c[11][0][1] = L2(c[11][0][0]);
 
 c[2][1][0] = p[3][0]; c[2][1][1] = p[3][1] - (p[3][1] - cp[1])/den[0]; 
 c[6][1][0] = p[3][0]; c[6][1][1] = p[3][1] - (p[3][1] - cp[1])/den[1];
 c[9][1][0] = p[3][0]; c[9][1][1] = p[3][1] - (p[3][1] - cp[1])/den[2];
 c[12][0][0] = p[3][0]; c[12][0][1] = p[3][1] - (p[3][1] - cp[1])/den[3];  
 c[13][0][0] = p[3][0]; c[13][0][1] = p[3][1] - (p[3][1] - cp[1])/den[4];

 c[3][1][0] = p[4][0] + (cp[0] - p[4][0])/den[0]; c[3][1][1] = L1(c[3][1][0]);
 c[7][1][0] = p[4][0] + (cp[0] - p[4][0])/den[1]; c[7][1][1] = L1(c[7][1][0]);
 c[10][1][0] = p[4][0] + (cp[0] - p[4][0])/den[2]; c[10][1][1] = L1(c[10][1][0]);
 c[12][1][0] = p[4][0] + (cp[0] - p[4][0])/den[3]; c[12][1][1] = L1(c[12][1][0]);
 c[14][0][0] = p[4][0] + (cp[0] - p[4][0])/den[4]; c[14][0][1] = L1(c[14][0][0]);
 
 c[4][1][0] = p[5][0] + (cp[0] - p[5][0])/den[0]; c[4][1][1] = L2(c[4][1][0]); 
 c[8][1][0] = p[5][0] + (cp[0] - p[5][0])/den[1]; c[8][1][1] = L2(c[8][1][0]);
 c[11][1][0] = p[5][0] + (cp[0] - p[5][0])/den[2]; c[11][1][1] = L2(c[11][1][0]);
 c[13][1][0] = p[5][0] + (cp[0] - p[5][0])/den[3]; c[13][1][1] = L2(c[13][1][0]);
 c[14][1][0] = p[5][0] + (cp[0] - p[5][0])/den[4]; c[14][1][1] = L2(c[14][1][0]);  
 }
 
void display() {  
strokeWeight(sw1);  
stroke(0,0,0);
if (sidesOn) {
strokeCap(SQUARE);
beginShape();
  for (int i = 0; i < np; i++) {
    vertex(v[i][0], v[i][1]);
  } 
endShape(CLOSE);
}

if (pointsOn) {
for (int i = 0; i < np; i++) {
  strokeWeight(sw2);
  fill(pColour[i]);
  ellipse(p[i][0], p[i][1], r2, r2);
  noFill();
}  
}
}
 
float L1(float xL1) {
  return m1*xL1+b1;
}
 
float L2(float xL2) {
  return m2*xL2+b2;
}
  
}

class HexTile {
float xi, yi;
float v[][] = new float[np][2];

HexTile(float xi, float yi) {
 this.xi = xi;
 this.yi = yi;
 v[0][0] = xi; v[0][1] = yi;
 v[1][0] = xi + s; v[1][1] = yi;
 v[2][0] = xi + 3*s/2; v[2][1] = yi + s*sq3/2;
 v[3][0] = xi + s; v[3][1] = yi + s*sq3;
 v[4][0] = xi; v[4][1] = yi + s*sq3;
 v[5][0] = xi - s/2; v[5][1] = yi + s*sq3/2;
}
 
void display() {
strokeWeight(sw1);
strokeCap(SQUARE);
beginShape();
  for (int i = 0; i < np; i++) {
    vertex(v[i][0], v[i][1]);
  } 
endShape(CLOSE);
}

void curveSet(float cin1, float cin2, float cin3, float cin4, float cin5, float cin6, float cin7, float cin8) {
beginShape();
vertex(xi-Xi+cin1, yi-Yi+cin2);
bezierVertex(xi-Xi+cin3, yi-Yi+cin4, xi-Xi+cin5, yi-Yi+cin6, xi-Xi+cin7, yi-Yi+cin8);
endShape();
}

}

class ControlHex {
float xi, yi;
float cHS;
float p[][] = new float[np][2];
float v[][] = new float[np][2];

ControlHex(float xi, float yi, float cHS) {
 this.cHS = cHS; 
 this.xi = xi;
 this.yi = yi;
 p[0][0] = xi + cHS/2.0; p[0][1] = yi;
 p[1][0] = xi + cHS*5/4.0; p[1][1] = yi + cHS*sq3/4.0;
 p[2][0] = xi + cHS*5/4.0; p[2][1] = yi + cHS*3*sq3/4.0;
 p[3][0] = xi + cHS/2.0; p[3][1] = yi + cHS*sq3;
 p[4][0] = xi - cHS/4.0; p[4][1] = yi + cHS*3*sq3/4.0;
 p[5][0] = xi - cHS/4.0; p[5][1] = yi + cHS*sq3/4.0;   
 v[0][0] = xi; v[0][1] = yi;
 v[1][0] = xi + cHS; v[1][1] = yi;
 v[2][0] = xi + 3*cHS/2; v[2][1] = yi + cHS*sq3/2;
 v[3][0] = xi + cHS; v[3][1] = yi + cHS*sq3;
 v[4][0] = xi; v[4][1] = yi + cHS*sq3;
 v[5][0] = xi - cHS/2; v[5][1] = yi + cHS*sq3/2;
}
 
void display() {
strokeWeight(sw3);
strokeCap(SQUARE);
beginShape();
  for (int i = 0; i < np; i++) {
    vertex(v[i][0], v[i][1]);
  } 
endShape(CLOSE);
}

float L(int i, int j, float x) {
  return p[i][1] + (p[i][1]-p[j][1])/(p[i][0]-p[j][0])*(x-p[i][0]);
}

}

