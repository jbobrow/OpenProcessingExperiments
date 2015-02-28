
float[] h = new float[2];
float hx;
float hy;
float p1x;
float p1y;
float testx;
float testy;
float swH;
float swD;
float swW;

int tcnt = 0;
//time counter
int dir = 0;
//direction

float htime = 100;
float htimeinv = 1 / htime;
//time to get across the canvas and its inverse

float itime = 50;
//time between iterations

void setup() {
  background(255, 255, 255);
  size(1000, 750);
  hx = width / 2;
  hy = height * .3;
  // set horizon point as a function of canvas size
  h[0] = hx;
  h[1] = hy;
  p1x = width * .25;
  p1y = height * .7;
  swH = height * .08;
  swD = height * .07;
  swW = width * .2;
}
//horizon point


void draw() {
  float[] f0 = new float[2];
  float[] f1 = new float[2];
  float[] f2 = new float[2];
  float[] f3 = new float[2];

  float[] b0 = new float[2];
  float[] b1 = new float[2];
  float[] b2 = new float[2];
  float[] b3 = new float[2];

  float[] pnt = new float[2];

  if (millis() > tcnt + itime) {
    smooth();
    background(255, 255, 255);
    //    line(p1x, p1y, h[0], h[1]);
    //    line(testx, 0, testx, height);

    f0[0] = testx;
    f0[1] = p1y;
    f1[0] = testx - swW;
    f1[1] = p1y;
    f2[0] = testx - swW;
    f2[1] = p1y + swH;
    f3[0] = testx;
    f3[1] = p1y + swH;
      //front verticies' coordinates
     
    b0[1] = f0[1] - swD;
    pnt = eqinter(f0[0], f0[1], h[0], h[1], 0, b0[1], width, b0[1]);
    b0[0] = pnt[0];

    b1[1] = f1[1] - swD;
    pnt = eqinter(f1[0], f1[1], h[0], h[1], 0, b1[1], width, b1[1]);
    b1[0] = pnt[0];

    b2[0] = b1[0];
    pnt = eqinter(f2[0], f2[1], h[0], h[1], b2[0], 0, b2[0], height);
    b2[1] = pnt[1];

    b3[0] = b0[0];
    pnt = eqinter(f3[0], f3[1], h[0], h[1], b3[0], 0, b3[0], height);
    b3[1] = pnt[1];
      //back verticies' coordinates
    /*
     ellipse(f0[0], f0[1], 16, 16);
     ellipse(f1[0], f1[1], 16, 16);
     ellipse(f2[0], f2[1], 16, 16);
     ellipse(f3[0], f3[1], 16, 16);
    
     ellipse(pnt[0], pnt[1], 16, 16);
     ellipse(pnt[0], pnt[1], 16, 16);
     ellipse(pnt[0], pnt[1], 16, 16);
     ellipse(pnt[0], pnt[1], 16, 16);
     */

    if (testx < width / 2) {
      quad(f0[0], f0[1], f3[0], f3[1], b3[0], b3[1], b0[0], b0[1]);
    }
      //right side
    if (testx - swW > width / 2) {
      quad(f1[0], f1[1], f2[0], f2[1], b2[0], b2[1], b1[0], b1[1]);
    }
      //left side
    quad(f0[0], f0[1], f1[0], f1[1], f2[0], f2[1], f3[0], f3[1]);
      //front
    quad(f0[0], f0[1], f1[0], f1[1], b1[0], b1[1], b0[0], b0[1]);
      //top

    if (dir == 0) {
      testx -= htimeinv * width;
    }
    else {
      testx += htimeinv * width;
    }

    tcnt += itime;
    if (testx <= 0) {
      dir = 1;
    }
    if (testx - swW > width) {
      dir = 0;
    }
  }
}

float [] eqinter(float p1x, float p1y, float p2x, float p2y, float p3x, float p3y, float p4x, float p4y) {
  float[] eq1 = new float[3];
  float[] eq2 = new float[3];
  float[] pnt = new float[2];

  int vert = 0;

  eq1 = lineeq(p1x, p1y, p2x, p2y);
  eq2 = lineeq(p3x, p3y, p4x, p4y);

  if (eq1[2] == 1 && eq2[2] == 1) {
    vert = 3;
  }
  else if (eq1[2] == 1) {
    vert = 1;
  }
  else if (eq2[2] == 1) {
    vert = 2;
  }

  pnt = inter(eq1[0], eq2[0], eq1[1], eq2[1], vert);
  return pnt;
}

float [] inter(float m1, float m2, float b1, float b2, int vert) {
  //calculates intersection of two lines
  float[] coords = new float[2];

  if (vert == 0) {
    coords[0] = (b2 - b1) / (m1 - m2);
    coords[1] = m1*coords[0] + b1;
  }
  else if (vert == 1) {
    coords[0] = b1;
    coords[1] = m2*coords[0] + b2;
  }
  else if (vert == 2) {
    coords[0] = b2;
    coords[1] = m1*coords[0] + b1;
  }
  else if (vert == 3) {
    coords[0] = b1;
    coords[1] = b2;
  }
  return(coords);
}

float [] lineeq(float p1x, float p1y, float p2x, float p2y) {
  //outputs line equation in form (m,b,vertical[yes/no])
  float[] eq = new float[3];
  //output eq data

  if (p2x - p1x == 0) {
    eq[1] = p1x;
    eq[2] = 1;
  }
  else {
    eq[0] = (p2y - p1y) / (p2x - p1x);
    eq[1] = p1y - eq[0]*p1x;
    eq[2] = 0;
  }
  return(eq);
