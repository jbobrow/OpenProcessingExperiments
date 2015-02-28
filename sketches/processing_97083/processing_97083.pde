
// calculates the the centroid (area not point) of a non-self-intersecting closed polygon 

float [][] polygon;// input data = 2 dimensional array | polygon[vertexnumber][ 0 or 1 (x or y)]

void setup() {
  size(800, 800);
  noLoop();
  background(0);
  fill(255);
  polygon = new float[3][2];
  for (int i = 0; i<3; i++) {
    polygon[i][0] = random(10, 790); // x point, 
    polygon[i][1] = random(10, 790); // y point,
  }
}

void draw() {
  beginShape();

  for (int i = 0; i<3; i++) {
    vertex(polygon[i][0], polygon[i][1]);
  }
  endShape();

  PVector centerOfMass = calculateCentroid(polygon);
 
  ellipse(centerOfMass.x, centerOfMass.y, 10, 10);
}  



PVector calculateCentroid(float [][] poly ) {

  float xArrayTemp [] = new float [poly.length+1];
  float yArrayTemp [] = new float [poly.length+1];


  for (int i = 0; i<poly.length; i++) {
    xArrayTemp [i]=poly[i][0];
  }
  for (int i = 0; i<poly.length; i++) {
    yArrayTemp [i]=poly[i][1];
  }

  xArrayTemp [poly.length]=poly[0][0];
  yArrayTemp [poly.length]=poly[0][1];

  float flaeche =0;

  for (int i = 0; i<poly.length; i++) {
    flaeche += (xArrayTemp[i]*yArrayTemp[i+1])-(xArrayTemp[i+1]*yArrayTemp[i]);
  }


  flaeche=0.5*flaeche;

  float xTemp =0;
  float yTemp =0;


  for (int i = 0; i<poly.length; i++) {
    xTemp += ((xArrayTemp[i]+xArrayTemp[i+1])*((xArrayTemp[i]*yArrayTemp[i+1])-(xArrayTemp[i+1]*yArrayTemp[i])));
    yTemp += ((yArrayTemp[i]+yArrayTemp[i+1])*((xArrayTemp[i]*yArrayTemp[i+1])-(xArrayTemp[i+1]*yArrayTemp[i])));
  } 

  yTemp =yTemp /(6*flaeche);
  xTemp =xTemp /(6*flaeche);


  PVector cen = new PVector(xTemp, yTemp);
  return cen;
}
