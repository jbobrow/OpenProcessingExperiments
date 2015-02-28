
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter

int rc = 100; // rect color
int ec = 100;// ellipse color
void setup() {
  size(640, 360);
  smooth();

  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;

  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}

void draw() {
  background(102);
  fill(255,rc,255,45);
  rect(rx, ry, rd, rd);
  fill(255,255,ec,45);
  ellipse(ex, ey, ed, ed);
  
  float d = dist(mouseX, mouseY, ex, ey);
  //float wx = dist(mouseX, 0, width,0);
  //float wy = dist(mouseX, mouseY, width,height);
  if ((d < ed)&& (ed > 0)) {

    ec=ec+20;
  }
  else {

    ec=ec-10;
  }
if((mouseX>rx) && (mouseX<rx+rd)&& (mouseY>ry) && (mouseY<ry+100))
{
    rc=rc+20;
  }
  else {

    rc=rc-10;
}
}

