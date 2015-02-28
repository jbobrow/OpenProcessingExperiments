

/*
Many thanks to: http://www.antigrain.com/research/adaptive_bezier/index.html
 */

float x1, y1, x2, y2, x3, y3, x4, y4, t;
float bl = 0;
int hselected = -1;

int dashlength = 10;

void setup() {
  size(300,300);
  t = 0;
  x1 = 10;
  y1 = 180;
  x2 = 50;
  y2 = 20;
  x3 = 100;
  y3 = 10;
  x4 = 280;
  y4 = 280;
  noFill();
}

void draw() {

  if (hselected == 1) {
    x1 = mouseX;
    y1 = mouseY;
  } else if (hselected == 2) {
    x2 = mouseX;
    y2 = mouseY;
  } else if (hselected == 3) {
    x3 = mouseX;
    y3 = mouseY;
  } else if (hselected == 4) {
    x4 = mouseX;
    y4 = mouseY;
  }

  background(255.0);
  stroke(0.0);
  strokeWeight(1.0);
  beginShape();
  vertex(x1, y1);
  bezierVertex(x2, y2, x3, y3, x4, y4);
  endShape();

  ellipse(x1,y1,10,10);
  ellipse(x2,y2,10,10);
  ellipse(x3,y3,10,10);
  ellipse(x4,y4,10,10);

  bl = blength(x1, y1, x2, y2, x3, y3, x4, y4);

  //find any point on the curve:
  t+=0.01;
  if(t>1) { 
    t=0; 
  }

  double mu, mum1,mum13,mu3;

  mu = t;
  mum1 = 1 - mu;
  mum13 = mum1 * mum1 * mum1;
  mu3 = mu * mu * mu;

  float xn = (float) ( mum13*x1 + 3*mu*mum1*mum1*x2 + 3*mu*mu*mum1*x3 + mu3*x4 );
  float yn = (float) ( mum13*y1 + 3*mu*mum1*mum1*y2 + 3*mu*mu*mum1*y3 + mu3*y4 );

  stroke(255.0, 0.0, 0.0);
  strokeWeight(5.0);
  point(xn, yn);

  stroke(0.0, 100.0);
  strokeWeight(1.0);

  line(x1, y1, x2, y2);
  line(x2, y2, x3, y3);
  line(x3, y3, x4, y4);
  
  stroke(255,0,0);
  strokeWeight(2);
  float dashnum = bl/dashlength;
  float dx = x1;
  float dy = y1;
  float t = 0;
  for (int i=0; i < dashnum*2; i++) {
    t += 0.001;
    float[] p = findPositionOnBezier(x1, y1, x2, y2, x3, y3, x4, y4, t);
    while ( t < 1 && dist(dx,dy,p[0],p[1]) < dashlength) {
      t += 0.001;
      p = findPositionOnBezier(x1, y1, x2, y2, x3, y3, x4, y4, t);
    }
    if (t >= 1) { p[0] = x4; p[1] = y4; }
    if(i*0.5 == Math.round(i*0.5)) {
      line(dx,dy,p[0],p[1]);
    }
    dx = p[0];
    dy = p[1];
    if (t == 1) { break; }
  }

  //intersecion
  /*
  float x12 = x1+(x2-x1)*t;
  float y12 = y1+(y2-y1)*t;
  float x23 = x2+(x3-x2)*t;
  float y23 = y2+(y3-y2)*t;
  float x34 = x3+(x4-x3)*t;
  float y34 = y3+(y4-y3)*t;
  line(x12, y12, x23, y23);
  line(x23, y23, x34, y34);

  float x123 = x12+(x23-x12)*t;
  float y123 = y12+(y23-y12)*t;
  float x234 = x23+(x34-x23)*t;
  float y234 = y23+(y34-y23)*t;
  line(x123, y123, x234, y234);

  stroke(255.0, 0.0, 0.0);
  strokeWeight(2.0);
  point(x123,y123);
  point(x234,y234);

  stroke(255.0, 0.0, 0.0, 100.0);
  strokeWeight(3.0);

  beginShape();
  vertex(x1, y1);
  bezierVertex(x12, y12, x123, y123, xn, yn);
  endShape();

  stroke(0.0, 255.0, 0.0, 100.0);

  beginShape();
  vertex(x4, y4);
  bezierVertex(x34, y34, x234, y234, xn, yn);
  endShape();
  */
}

void keyPressed() {
  if (keyCode == 38) {
    if (dashlength < 40) { dashlength++; }
  } else if (keyCode == 40) {
    if (dashlength > 4) { dashlength--; }
  } else {
    System.out.println(keyCode);
  }
}

void mouseReleased() {
  hselected = -1;
}

void mousePressed() {
  if (dist(mouseX,mouseY,x1,y1) < 5) { 
    hselected = 1;
  } else if (dist(mouseX,mouseY,x2,y2) < 5) { 
    hselected = 2;
  } else if (dist(mouseX,mouseY,x3,y3) < 5) { 
    hselected = 3; 
  } else if (dist(mouseX,mouseY,x4,y4) < 5) { 
    hselected = 4; 
  } else { 
    hselected = -1; 
  }
}

float[] findPositionOnBezier(float x1,float y1,float x2,float y2,float x3,float y3,float x4,float y4, float t) {
  float [] out = new float[]{0,0};
  double mu, mum1,mum13,mu3;
  mu = t;
  mum1 = 1 - mu;
  mum13 = mum1 * mum1 * mum1;
  mu3 = mu * mu * mu;
  out[0] = (float) ( mum13*x1 + 3*mu*mum1*mum1*x2 + 3*mu*mu*mum1*x3 + mu3*x4 );
  out[1] = (float) ( mum13*y1 + 3*mu*mum1*mum1*y2 + 3*mu*mu*mum1*y3 + mu3*y4 );
  return out;
}

float blength(float x1,float y1,float x2,float y2,float x3,float y3,float x4,float y4) {
  float out = 0;
  float t = 0;
  float px = x1;
  float py = y1;

  for (int i=0; i<100; i++) {
    t+=(0.01);
    float[] p = findPositionOnBezier(x1, y1, x2, y2, x3, y3, x4, y4, t);
    out+=dist(px,py,p[0],p[1]);
    px = p[0];
    py = p[1];
  }
  return out;
}


