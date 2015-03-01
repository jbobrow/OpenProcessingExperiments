
PVector[][] patch;
int RESOLUTION = 100; // patch resolution

float bernstein(float p1, float p2, float p3, float t) { // quadratic bernstein interpolation
  float result= p1*(1-t)*(1-t) + p2*2*(1-t)*t + p3*t*t; 
  return result;
}
PVector uv(int x, int y) {
  // convert (x,y) in range 0 ~ (RESOLUTION-1) to (u,v) in 0~1 scale 
  float u = (float)x / (RESOLUTION-1);
  float v = (float)y / (RESOLUTION-1);
  PVector uv = new PVector(u, v);
  return uv;
}
PVector getPosInBezierPatch(PVector uv, PVector lBottom, PVector mBottom, PVector rBottom, PVector lMiddle, PVector mMiddle, PVector rMiddle, 
PVector lTop, PVector mTop, PVector rTop) {
  // return actural (x,y) that corresponds to (u,v) in a patch defined // by (leftBottom, rightBottom, leftTop, rightTop)
  float u = uv.x;
  float v = uv.y;
  PVector pos = new PVector();
  float u1 = bernstein(lBottom.x, mBottom.x, rBottom.x, u); 
  float u2 = bernstein(lMiddle.x, mMiddle.x, rMiddle.x, u); 
  float u3 = bernstein(lTop.x, mTop.x, rTop.x, u);
  pos.x = bernstein(u1, u2, u3, v);
  u1 = bernstein(lBottom.y, mBottom.y, rBottom.y, u); 
  u2 = bernstein(lMiddle.y, mMiddle.y, rMiddle.y, u);
  u3 = bernstein(lTop.y, mTop.y, rTop.y, u);
  pos.y = bernstein(u1, u2, u3, v);
  return pos;
}
void createPatch(PVector[][] patch, PVector lBottom, PVector mBottom, PVector rBottom, PVector lMiddle, PVector mMiddle, PVector rMiddle, 
PVector lTop, PVector mTop, PVector rTop) {
  for (int iy=0; iy<RESOLUTION; iy++) { 
    for (int ix=0; ix<RESOLUTION; ix++) {
      PVector uv = uv(ix, iy);
      PVector pos = getPosInBezierPatch(uv, lBottom, mBottom, rBottom, lMiddle, mMiddle, rMiddle, lTop, mTop, rTop); 
      patch[iy][ix].x = pos.x;
      patch[iy][ix].y = pos.y;
    }
  }
}
void renderPatch(PVector[][] patch, int stroke) { 
  //fill(255, 0, 0);
  stroke(0);
  for (int iy=0; iy<RESOLUTION-1; iy++) {
    beginShape(QUAD_STRIP); // try POINTS 
    for (int ix=0; ix<RESOLUTION; ix++) {
      //fill(random(255));
      int pX = int((img.width/RESOLUTION) * ix);
      int pY = int((img.height/RESOLUTION) * iy);
      color pix = img.get(pX, pY);
      //println("x: " + pX);
      //println("y: " + pY);
      fill(pix);
      if (stroke==0) {
        noStroke();
      }
      //pushMatrix();
      //translate(pX, pY, 0);
      //popMatrix();

      vertex(patch[iy][ix].x, patch[iy][ix].y); 
      vertex(patch[iy+1][ix].x, patch[iy+1][ix].y);
    }
    endShape();
  }
}

//fish
class fish {
  //int fxpos = 0;
  //int fypos = 0;
  float fheight = 40;
  float fwidth = 80;
  //float mult = 1;
  //int speed = 5;

  fish() {
  }

  void show (int fxpos, int fypos, float mult, int speed) {
    //fxpos=50;
    //fypos=650;
    //fheight=40;
    //fwidth=80;
    noStroke();
    colorMode(RGB, 255,255,255);
    fill(245, 150, 54); 
    ellipseMode (CENTER);

    //scale(mult);
    ellipse (fxpos, fypos, fwidth, fheight); 
    triangle (fxpos-50, fypos-30, fxpos-50, fypos+30, fxpos-20, fypos); 
    fill (0);
    ellipse (fxpos+20, fypos-10, 5, 5); 
    fill(245, 150, 54); 
    ellipse (fxpos+40, fypos, 10, 20);
  }
}

class bubble {
  bubble() {
  }

  void show (int x, int y, int speed, int Hue, int Sz) {
    colorMode(HSB, 360, 100, 100);
    fill(Hue, 100, 100, 60);
    ellipse(x, y, Sz, Sz);
  }
}

class spider {
  spider() {
  }

  void show (int x, int y, int speed) {
    image(spider, x, y);
  }
}

PImage img, spider;
fish[] Fish = new fish[5];
spider[] Spider = new spider[5];
bubble[] Bubble = new bubble[5];
int h = 600;

int[] Fxpos = new int[5];
int[] Fypos = new int[5];
float[] Mult = new float[5];
int[] Speed = new int[5];

int[] Bx = new int[5];
int[] By = new int[5];
int[] BSpeed = new int[5];
int[] BHue = new int[5];
int[] BSz = new int[5];

int[] Sx = new int[5];
int[] Sy = new int[5];
int[] SSpeed = new int[5];

void setup() {
  size(600, 600, P2D);
  img = loadImage("selfie.jpg");
  spider = loadImage("spider.png");
  smooth();
  patch = new PVector[RESOLUTION][RESOLUTION]; 
  for (int i=0; i< RESOLUTION; i++) {
    for (int j=0; j< RESOLUTION; j++) { 
      patch[i][j] = new PVector();
    }
  }

  for (int j=0; j<5; j++) {
    Fish[j] = new fish();
    Fxpos[j] = (int)random(-100, 0);
    Fypos[j] = (int)random(0, height);
    Mult[j] = random(0.8, 1.5);
    Speed[j] = (int)random(3, 8);

    Bubble[j] = new bubble();
    Bx[j] = (int)random(0, width-100);
    By[j] = (int)random(height+100, height+300);
    BSpeed[j] = (int)random(5, 12);
    BHue[j] = (int)random(360);
    BSz[j] = (int)random(10, 70);

    Spider[j] = new spider();
    Sx[j] = (int)random(0, width-100);
    Sy[j] = (int)random(-100, -300);
    SSpeed[j] = (int)random(3, 8);
  }
}

void draw() {  
  //randomSeed(0);
  // design a patch

  if (mousePressed) {
    colorMode(RGB, 255,255,255);
    background(80, 139, 38);
    PVector lBottom = new PVector(0, h); // left bottom 
    PVector mBottom = new PVector(width/2, h-200); // middle bottom 
    PVector rBottom = new PVector(width, h); // right bottom 
    PVector lMiddle = new PVector(200, h/2); // left middle
    PVector mMiddle = new PVector(width/2, h/2); // middle middle 
    PVector rMiddle = new PVector(width-200, h/2); // right middle
    PVector lTop = new PVector(0, 0); // left top
    PVector mTop = new PVector(width/2, 200); // middle top
    PVector rTop = new PVector(width, 0); //(mouseX, mouseY); // right top
    createPatch(patch, lBottom, mBottom, rBottom, lMiddle, mMiddle, rMiddle, lTop, mTop, rTop); 
    renderPatch(patch, 1);

    for (int j=0; j<5; j++) {
      if (Sy[j]>height+50) {
        Sx[j] = (int)random(0, width-100);
        Sy[j] = (int)random(-100, -300);
        SSpeed[j] = (int)random(3, 8);
      }

      Spider[j].show(Sx[j], Sy[j], SSpeed[j]);
      Sy[j] += SSpeed[j];
    }
  } else {
    colorMode(RGB, 255,255,255);
    background(126, 228, 255);
    PVector lBottom = new PVector(80, h-100); // left bottom 
    PVector mBottom = new PVector(width/2, h * 1.2); // middle bottom 
    PVector rBottom = new PVector(width-80, h-100); // right bottom 
    PVector lMiddle = new PVector(-80, h/2); // left middle
    PVector mMiddle = new PVector(width/2, h/2); // middle middle 
    PVector rMiddle = new PVector(width+80, h/2); // right middle
    PVector lTop = new PVector(80, 100); // left top
    PVector mTop = new PVector(width/2, -100); // middle top
    PVector rTop = new PVector(width-80, 100); //(mouseX, mouseY); // right top
    createPatch(patch, lBottom, mBottom, rBottom, lMiddle, mMiddle, rMiddle, lTop, mTop, rTop); 
    renderPatch(patch, 0);

    for (int i=0; i<5; i++) {
      if (Fxpos[i]>width+50) {
        Fxpos[i] = (int)random(-100, 0);
        Fypos[i] = (int)random(0, 600);
        Mult[i] = random(0.5, 1.3);
        Speed[i] = (int)random(3, 8);
      }

      if (By[i]<-50) {
        Bx[i] = (int)random(0, width-100);
        By[i] = (int)random(height+100, height+300);
        BSpeed[i] = (int)random(5, 12);
        BHue[i] = (int)random(360);
        BSz[i] = (int)random(10, 70);
      }

      Fish[i].show(Fxpos[i], Fypos[i], Mult[i], Speed[i]);
      Fxpos[i] += Speed[i];
      Bubble[i].show(Bx[i], By[i], BSpeed[i], BHue[i], BSz[i]);
      By[i] -= BSpeed[i];
      //Fypos[i] += (int)noise(-10, 10);
    }
  }
}


