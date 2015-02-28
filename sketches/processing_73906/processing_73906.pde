
//Robb Godshaw 2012 www.robb.cc
//Rubber Stamp 1
//Sorry for the code recyling, I ran out of time.

boolean upp = false;
float xa = -4, ya = 204, xb = 44, yb = 196,xc = 108, xd = 164, xe = 220;

void setup() {
  size(512, 512);
  smooth();
}

void draw() {
  background(8, 35, 87);//blue!
  rainbow(100, 100, 1);//calls the rainbow
  rainbow(0, 0, .5);//calls the rainbow
  rainbow(140, -190, 2);//calls the rainbow
}


void rainbow(float XX, float YY, float size) {//function for rainbow
  pushMatrix();
  scale(size);
  translate(XX, YY);
  stroke(239, 0, 0);//RED
  strokeWeight(3*8);
  strokeCap(ROUND);
  wave();

  stroke(244, 137, 0);//ORANGE
  translate(0, 3*8);
  wave();

  stroke(254, 255, 0);//YELOW
  translate(0, 3*8);
  wave();

  stroke(82, 255, 0);//GREEN
  translate(0, 3*8);
  wave();

  stroke(30, 126, 255);//BLUE
  translate(0, 3*8);
  wave();

  stroke(74, 0, 255);//purple
  translate(0, 3*8);
  wave();
  noStroke();
  popMatrix();
}


void wave() {

  noFill();
  if (upp) {
    ya = ya +0.01;
  }
  else if ( upp==false )
  {
    ya = ya -0.01;
  }
  if ( ya > 204) {
    upp = false;
  }
  else if ( ya < 196) {
    upp=true;
  }

  yb= 200-(ya-200);


  beginShape();
  curveVertex(xa, ya);
  curveVertex(xa, ya);
  curveVertex(xb, yb);
  curveVertex(xc, ya);
  curveVertex(xd, yb);
  curveVertex(xe, ya);
  curveVertex(xe, ya);
  endShape();
}
