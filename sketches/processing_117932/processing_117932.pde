
import java.util.LinkedList;

LinkedList[] polygons;
int[] lineThickness;

int nPolygons = 1;
int nPoints = 15;

float proportion = 0.1;

void setup() {
  size(800, 800);
  background(0);
  stroke(255);
  fill(255);
  
  polygons = new LinkedList[nPolygons];
  lineThickness = new int[nPolygons];
  for(int i = 0; i < nPolygons; i++) {
    polygons[i] = generateRandomPolygon();
    lineThickness[i] = (int) random(0.5, 1.3);
  }
}

void draw() {
  for(int i = 0; i < nPolygons; i++) {
    drawPolygon(polygons[i], lineThickness[i]);
    polygons[i] = generateInteriorPolygon(polygons[i]);
  }
}

LinkedList<PVector> generateRandomPolygon() {
  LinkedList<PVector> newPolygon = new LinkedList<PVector>();
  for(int i = 0; i < nPoints; i++) {
    PVector newPoint = new PVector(random(width), random(height));
    newPolygon.add(newPoint);
  }
  
  return newPolygon;
}

void drawPolygon(LinkedList<PVector> polygon, int lineThickness) {
  strokeWeight(lineThickness);
  
  ellipse(polygon.get(0).x, polygon.get(0).y, 2, 2);
  for(int i = 1; i < nPoints; i++) {
    ellipse(polygon.get(i).x, polygon.get(i).y, 2, 2);
    line(polygon.get(i - 1).x, polygon.get(i - 1).y, polygon.get(i).x, polygon.get(i).y); 
  }
  line(polygon.get(nPoints - 1).x, polygon.get(nPoints - 1).y, polygon.get(0).x, polygon.get(0).y);
}

LinkedList<PVector> generateInteriorPolygon(LinkedList<PVector> polygon) {
  LinkedList<PVector> interiorPolygon = new LinkedList<PVector>();
  PVector pA;
  PVector pB;
  PVector interiorPoint;
  
  for(int i = 1; i < nPoints; i++) {
    pA = polygon.get(i - 1);
    pB = polygon.get(i);
    interiorPoint = new PVector((pA.x * proportion) + (pB.x * (1.0 - proportion)), (pA.y * proportion) + (pB.y * (1.0 - proportion)));
    
    interiorPolygon.add(interiorPoint);
  }
  
  pA = polygon.get(nPoints - 1);
  pB = polygon.get(0);
  interiorPoint = new PVector((pA.x * proportion) + (pB.x * (1.0 - proportion)), (pA.y * proportion) + (pB.y * (1.0 - proportion)));
  
  interiorPolygon.add(interiorPoint);
  
  return interiorPolygon;
}

/// INTERACTIONS
void mousePressed() {
  background(0);
  
  polygons = new LinkedList[nPolygons];
  lineThickness = new int[nPolygons];
  for(int i = 0; i < nPolygons; i++) {
    polygons[i] = generateRandomPolygon();
    lineThickness[i] = (int) random(0.5, 1.3);
  }
}

void keyPressed() {
  switch(key) {
    case 's':
      saveFrame("poligonaldc_1_####.jpg");
      break;
  }
}
