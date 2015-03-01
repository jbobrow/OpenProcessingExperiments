
float aMax, aMin;    // min/max-distance between the lines
color farbe[] = {
  #E01300, #0610C1, #FADA23
};
color bgColor; 
ArrayList<Float> xlines, ylines;   // x/y-position of the lines
float strWeight; 
int numRects;     // number of colored rectangles

void setup() {
  size(400, 400); 
  background(255); 
  noSmooth();
  noLoop(); 

  bgColor = color(255); 
  strWeight = 8; 
  strokeWeight(strWeight); 
  stroke(0); 
  strokeCap(PROJECT); 

  numRects = 8; 
  aMin = 40; 
  aMax = 80;
}


void draw() {
  background(bgColor); 

  float x, xvon, xbis, y, yvon, ybis; 
  xlines = new ArrayList();
  ylines = new ArrayList(); 

  strokeWeight(strWeight); 
  stroke(0); 

  x = random(aMin/2, aMin); 
  while (x < width-aMin/2) {
    xlines.add(x); 
    yvon = random(0, height/3); 
    ybis = random(2*height/3, height); 
    line(x, yvon, x, ybis); 
    x += random(aMin, aMax);
  }

  y = random(aMin/2, aMin); 
  while (y < height-aMin/2) {
    ylines.add(y); 
    xvon = random(0, width/3); 
    xbis = random(2*width/3, width); 
    line(xvon, y, xbis, y); 
    y += random(aMin, aMax);
  } 

  for (int r = 0; r < numRects; r++) {
    setRectangle();
  }
}

void setRectangle() {
  PVector v; 
  float xline, yline; 
  float north, east, south, west; 

  v = getFreePoint(); 

  /* get the free area around the point in each direction */
  east = width;
  west = 0;   
  for (int i = 0; i < xlines.size (); i++) {
    xline = xlines.get(i);
    if (xline < v.x && xline > west) {
      west = xline;
    } 
    if (xline > v.x && xline < east) {
      east = xline;
    }
  }

  north = 0; 
  south = height;   
  for (int i = 0; i < ylines.size (); i++) {
    yline = ylines.get(i);
    if (yline < v.y && yline > north) {
      north = yline;
    } 
    if (yline > v.y && yline < south) {
      south = yline;
    }
  }

  fill(farbe[(int) random(3)]); 
  noStroke(); 
  rect(west+strWeight/2, north+strWeight/2, east-west-strWeight, south-north-strWeight);
}

PVector getFreePoint() {
  int xint, yint; 
  color c; 

  c = 0;  

  xint = 0; 
  yint = 0;

  while (c != bgColor) {
    xint = (int) random(aMin, width-aMin); 
    yint = (int) random(aMin, height-aMin);
    c = get(xint, yint);
  }  

  return new PVector((float) xint, (float) yint);
}

void mouseReleased() {
  redraw();
}



