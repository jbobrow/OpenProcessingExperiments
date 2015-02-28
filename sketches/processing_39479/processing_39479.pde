
 
// sketch:  DistancePointToLineSegment.pde - by Ing. Gerd Platl 
// date:    v1.0 2011-09-26
// get the nearest distance of a point P to line segments given by two points 

color color1 = color(222, 144, 99);
color color2 = color(155, 144, 222);
color color3 = color(88, 244, 122);
color color4 = color(188, 188, 22);

PVector A1, A2, B1, B2, C1,C2, D1,D2, mousePos, S1, S2, S3, S4;

void setup() 
{
  size(512, 512);
  frameRate(30);
  fill (0);
  smooth();
  A1 = new PVector( 60, 110);   A2 = new PVector(430, 300);
  B1 = new PVector( 90, 460);   B2 = new PVector(400, 160);
  C1 = new PVector(140,  60);   C2 = new PVector(140, 460);
  D1 = new PVector(480, 380);   D2 = new PVector( 40, 380);
  mousePos = new PVector(256,256);
  S1 = new PVector();
  S2 = new PVector();
  S3 = new PVector();
  S4 = new PVector();
}

void draw() 
{
  background(0,0,0,233);
  drawSegment(color1, A1,A2);
  drawSegment(color2, B1,B2);
  drawSegment(color3, C1,C2);
  drawSegment(color4, D1,D2);
  stroke (255);
  ellipse (mouseX, mouseY, 4, 4);
  fill(255);
  text("DistancePointToLineSegment: ", 10, 24);

  mousePos.set(mouseX, mouseY, 0);
  
  float dist1 = SquaredDistancePointToLineSegment(A1, A2, mousePos, S1);
  fill(color1);
  text(" distance1=" + nf(sqrt(dist1), 0, 1), 10, 40);
  
  float dist2 = SquaredDistancePointToLineSegment(B1, B2, mousePos, S2);
  fill(color2);
  text(" distance2=" + nf(sqrt(dist2), 0, 1), 10, 56);

  float dist3 = SquaredDistancePointToLineSegment(C1, C2, mousePos, S3);
  fill(color3);
  text(" distance3=" + nf(sqrt(dist3), 0, 1), 10, 72);

  float dist4 = SquaredDistancePointToLineSegment(D1, D2, mousePos, S4);
  fill(color4);
  text(" distance4=" + nf(sqrt(dist4), 0, 1), 10, 88);

  // draw nearest distance to a line
  if (dist2 < dist1)  { dist1 = dist2;   S1.set(S2);  }
  if (dist3 < dist1)  { dist1 = dist3;   S1.set(S3);  }
  if (dist4 < dist1)  { dist1 = dist4;   S1.set(S4);  }
  drawSegment(222, mousePos, S1);
}

// draw line segment A-B
void drawSegment(color col, PVector A, PVector B)
{
  stroke (col);  
  line(A.x, A.y, B.x, B.y);
  ellipse (A.x, A.y, 2,2);
  ellipse (B.x, B.y, 2,2);
}

// calculate the squared distance of a point P to a line segment A-B
// and return the nearest line point S
float SquaredDistancePointToLineSegment(PVector A, PVector B, PVector P, PVector S)
{
  float vx = P.x-A.x,   vy = P.y-A.y;   // v = A->P
  float ux = B.x-A.x,   uy = B.y-A.y;   // u = A->B
  float det = vx*ux + vy*uy; 

  if (det <= 0)
  { // its outside the line segment near A
    S.set(A);
    return vx*vx + vy*vy;
  }
  float len = ux*ux + uy*uy;    // len = u^2
  if (det >= len)
  { // its outside the line segment near B
    S.set(B);
    return sq(B.x-P.x) + sq(B.y-P.y);  
  }
  // its near line segment between A and B
  float ex = ux / sqrt(len);    // e = u / |u^2|
  float ey = uy / sqrt(len);
  float f = ex * vx + ey * vy;  // f = e . v
  S.x = A.x + f * ex;           // S = A + f * e
  S.y = A.y + f * ey;

  return sq(ux*vy-uy*vx) / len;    // (u X v)^2 / len
}

//---------------
void keyPressed() 
{
  if (key == ' ') 
  { // set random line A
    A1.set(random(width), 50+random(height-50), 0);
    A2.set(random(width), 50+random(height-50), 0);
  }
}


