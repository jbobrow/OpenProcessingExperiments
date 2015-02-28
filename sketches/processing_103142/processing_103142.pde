
float countMov = 0;
float countInc = .013;
int delayCount = 0;
int stopCount = 500;


void setup() {
  size(1000, 600);
  background(0);
}

void draw() {
  smooth();
  strokeWeight(3);
  scale(1.2);

  frameRate(300);

  delayCount++;
  if (delayCount > (stopCount+30)) {
    countInc = .001;
  }
  translate(-100, -150);
  //8
  strokeWeight(.5);
  stroke(255);
  scale(1.9);
  pushMatrix();
  translate(80, 160);
  eight(1);
  pushMatrix();
  translate(-5, -60);
  eight(1.1);
  popMatrix();
  pushMatrix();
  translate(10, -65);
  eight(1.2);
  popMatrix();
  popMatrix();

  //s
  pushMatrix();
  translate(200, 160);
  s_top();
  s_btm();
  popMatrix();

  //t
  pushMatrix();
  translate(265, 130);
  tees();
  popMatrix();

  //a
  pushMatrix();
  translate(290, 160);
  a();
  popMatrix();

  //t
  pushMatrix();
  translate(350, 130);
  tees();
  popMatrix();

  //c
  pushMatrix();
  translate(400, 160);
  c();
  popMatrix();

  //cross the tees
  pushMatrix();
  translate(200, 0);
  crossing();
  translate(3, 10);
  popMatrix();

  //i
  pushMatrix();
  translate(375, 130);
  the_i(8, 10);
  translate(0, 30);
  the_i(8, 64); 
  popMatrix();
  println(countInc + "   ");

  //line(70, 90, 70+60, 90-60);
}



void s_btm() {
  stroke(255);

  int [] xList = {
    -10, -10, 20, 50, 50, 35, 20
  };
  int [] yList = {
    30, 20, 0, 0, 20, 20, 30
  };

  //point(-10, 30);
  //point(-10, 20);  
  //point(20, 00);
  //point(20, 30);
  //point(50, 20);
  //point(50, 0);
  //for (int i = 0; i <= xList.length; i++) {
  //pt_pt(xList[i], yList[i], xList[1+i], yList[1+i]); }

  pt_pt(xList[0], yList[0], xList[1], yList[1]);
  pt_pt(xList[1], yList[1], xList[2], yList[2]); 
  pt_pt(xList[2], yList[2], xList[3], yList[3]); 
  pt_pt(xList[3], yList[3], xList[4], yList[4]);  
  pt_pt(xList[4], yList[4], xList[5], yList[5]); 
  pt_pt(xList[5], yList[5], xList[6], yList[6]);
  pt_pt(xList[6], yList[6], xList[0], yList[0]);

  pushMatrix();
  translate(0, 2);
  pt_pt(xList[1], yList[1], xList[2], yList[2]); 
  pt_pt(xList[2], yList[2], xList[3], yList[3]); 
  translate(0, 3);
  pt_pt(xList[1], yList[1], xList[2], yList[2]); 
  pt_pt(xList[2], yList[2], xList[3], yList[3]); 
  translate(0, 4);
  pt_pt(xList[1], yList[1], xList[2], yList[2]); 
  pt_pt(xList[2], yList[2], xList[3], yList[3]);
  popMatrix();
}
void s_top() {
  pushMatrix();
  translate(40, 60);
  rotate(PI);
  s_btm();
  popMatrix();
}

void a() {
  //BIG a
  int [] xList = { 
    0, 0, 10, 50, 50, 40, 40
  };
  int [] yList = { 
    60, 10, 0, 0, 60, 50, 60
  };
  pt_pt(xList[0], yList[0], xList[1], yList[1]);
  pt_pt(xList[1], yList[1], xList[2], yList[2]); 
  pt_pt(xList[2], yList[2], xList[3], yList[3]); 
  pt_pt(xList[3], yList[3], xList[4], yList[4]);  
  pt_pt(xList[4], yList[4], xList[5], yList[5]);  
  pt_pt(xList[5], yList[5], xList[6], yList[6]);  
  pt_pt(xList[6], yList[6], xList[0], yList[0]);

  //LITTLE A
  int [] aList = {
    10, 20, 40, 40, 10
  };
  int [] bList = {
    20, 10, 10, 50, 50
  };

  pt_pt(aList[0], bList[0], aList[1], bList[1]);
  pt_pt(aList[1], bList[1], aList[2], bList[2]);
  pt_pt(aList[2], bList[2], aList[3], bList[3]);
  pt_pt(aList[3], bList[3], aList[4], bList[4]);
  pt_pt(aList[4], bList[4], aList[0], bList[0]);
}

void c() {
  pushMatrix();
  
  int [] aList = {0, 60, 60, 50, 10, 30, 60, 60, 50, 40, 0};
  int [] bList = {0, 0, 20, 10, 10, 60, 60, 40, 50, 50, 20};
  pt_pt(aList[0], bList[0], aList[1], bList[1]);
  pt_pt(aList[1], bList[1], aList[2], bList[2]);
  pt_pt(aList[2], bList[2], aList[3], bList[3]);
  pt_pt(aList[4], bList[4], aList[3], bList[3]);
  pt_pt(aList[5], bList[5], aList[6], bList[6]);
  pt_pt(aList[6], bList[6], aList[7], bList[7]);
  pt_pt(aList[7], bList[7], aList[8], bList[8]);
  pt_pt(aList[9], bList[9], aList[8], bList[8]);
  pt_pt(aList[9], bList[9], aList[4], bList[4]);
  pt_pt(aList[0], bList[0], aList[10], bList[10]);
  pt_pt(aList[10], bList[10], aList[5], bList[5]);
  //point(0, 0);
  //point(60, 0);
  //point(60, 20);
  //point(50, 10);
  //point(10, 10);
  //point(0, 20);
  //point(60, 40);
  //point(60, 60);
  //point(50, 50);
  //point(40, 50);
  //point(40, 60);
  popMatrix();
  
}


float a = 0.0;
float inc = TWO_PI;
int wid = 0;
int stopWid = 320;
void crossing()
{stroke(155, 10);
  if (delayCount > stopCount) {
    wid++;
    stroke(255);
    translate(-90, 100);
    beginShape(POINTS);
    for (int i=0; i<wid; i+=3) {
      vertex( i, 50+sin(a)*3);
      a = a + 1 + inc*20;
    }
    endShape();
  }
  if (wid> stopWid) {
    wid = 0;
  }
}

void eight(float change) {
  pushMatrix();
  int [] xList = {
    10, 0, 0, 80, 70, 80
  };
  int [] yList = {
    0, 10, 70, 60, 70, 0
  };
  pt_pt(xList[0], yList[0], xList[1], yList[1]);
  pt_pt(xList[1], yList[1], xList[2], yList[2]); 
  pt_pt(xList[2], yList[2], xList[4], yList[4]); 
  pt_pt(xList[3], yList[3], xList[4], yList[4]);  
  pt_pt(xList[5], yList[5], xList[3], yList[3]); 
  pt_pt(xList[5], yList[5], xList[0], yList[0]);
  
  //point(10, 0);
  //point(0, 10);
  //point(0, 70);
  //point(80, 60);
  //point(70, 70);
  //point(80, 0);
  popMatrix();

  translate(0, 70);
  pushMatrix();
   pt_pt(xList[0], yList[0], xList[1], yList[1]);
  pt_pt(xList[1], yList[1], xList[2], yList[2]); 
  pt_pt(xList[2], yList[2], xList[4], yList[4]); 
  pt_pt(xList[3], yList[3], xList[4], yList[4]);  
  pt_pt(xList[5], yList[5], xList[3], yList[3]); 
  pt_pt(xList[5], yList[5], xList[0], yList[0]);
  popMatrix();
}


void pt_pt(int x1, int y1, int x2, int y2) {
  if (delayCount > stopCount) {
    float advX, advY;
    //x, y for point 1
    //x, y for point 2  
    float advSet = 100;
    //gradient of the loop
    //point (x1, y1);
    //desired origin
    //point (x2, y2);
    //desired endpoint
    countMov += countInc;
    float advRatio = countMov/advSet;
    if (advRatio <1) {
      //creates a proportion to draw the line from point1 ot point2
      advX = x1 + ((x2-x1)*advRatio);
      //draws x line by multiplying the advRatio by the distance between the to x coordinates, then adding to the original
      advY = y1 + ((y2-y1)*advRatio);
      //draws x line by multiplying the advRatio by the distance between the to x coordinates, then adding to the original
      line(x1, y1, advX, advY);
      //println(i-countmove);
      //draw from origin to advancing endpoint(advX, advY);
    }
    else {
      advX = x2;
      advY = y2;
    }
  }
}

void tee() {
  ;
  int [] xList = {
    0, 10, 10
  };
  int [] yList = {
    0, 0, 10
  };
  pt_pt(xList[0], yList[0], xList[1], yList[1]);
  pt_pt(xList[1], yList[1], xList[2], yList[2]); 
  pt_pt(xList[2], yList[2], xList[0], yList[0]); 
  //pt_pt(xList[3], yList[3], xList[4], yList[4]);  
  //pt_pt(xList[4], yList[4], xList[5], yList[5]); 
  //pt_pt(xList[5], yList[5], xList[3], yList[3]);
}

void tees() {
  pushMatrix();
  scale(1.3);
  translate(0, -13);
  for (int i = 0; i < 9; i++) {
    translate(0, 13);
    pushMatrix();
    //rotate(radians(-45));
    shearY(i*.14);
    tee();
    popMatrix();
  }
  popMatrix();
}

void the_i(int boundX, int boundY) {
  int inc = 2;
  
  pushMatrix();
  //float shade = map(mouseX, 0, boundX, 0, 255);
  float shade = random(0, 195);
  float transp = map((.25*mouseX), 0, boundY, 0, 255);
  noStroke();
  translate(-inc, 0);
  for (int i = 0; i < boundX+inc; i+=inc) {
    float redval = random(0, 155);
    rectMode(CORNER);
    fill(shade, transp);
    rect(i, 0, i, boundY);
  }
  popMatrix();
}



