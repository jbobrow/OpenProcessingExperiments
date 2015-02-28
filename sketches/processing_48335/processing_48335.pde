
import volatileprototypes.Panel4P.*;
import peasy.*;
import toxi.processing.*;
import toxi.geom.*;
float z = 300;
/////////////////////////////////////////////3D setup
/////////////////////////////////////////////balls1
ArrayList<PVector> Ball0s;
ArrayList<PVector> Ball2s;
ArrayList<PVector> Ball4s;
ArrayList<PVector> Ball6s;
ArrayList<PVector> Ball8s;
ArrayList<PVector> Ball10s;
ArrayList cballs;
ArrayList cball2s;
ArrayList cball4s;
ArrayList cball6s;
ArrayList cball8s;
ArrayList cball10s;
PVector loc;
PVector loc0;
PVector loc2;
PVector loc4;
PVector loc6;
PVector loc8;
PVector loc10;
PVector vel;
PVector ball;
PVector ball2;
PVector ball4;
PVector ball6;
PVector ball8;
PVector ball10;
float lines1X0[];
float lines1Y0[];
float lines1Z0[];
float lines1X2[];
float lines1Y2[];
float lines1Z2[];
float lines1X4[];
float lines1Y4[];
float lines1Z4[];
float lines1X6[];
float lines1Y6[];
float lines1Z6[];
float lines1X8[];
float lines1Y8[];
float lines1Z8[];
float lines1X10[];
float lines1Y10[];
float lines1Z10[];
boolean goBack = false;

//////////////////////////////////////////////moving ball setup
int t = 0;
float exponent =2;
float x=0.0;
float y=0.0;
float step = 0.02;
float pct = 0.0;
//////////////////////////////////////////////moving vel detup
//////////////////////////////////////////////small ball follow
PeasyCam cam;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 700);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(2000); 

  Ball0s = new ArrayList();
  Ball2s = new ArrayList();
  Ball4s = new ArrayList();
  Ball6s = new ArrayList();
  Ball8s = new ArrayList();
  Ball10s = new ArrayList();
  lines1X0 = float(loadStrings("ballpointY0.txt"));
  lines1Y0 = float(loadStrings("ballpointZ0.txt"));
  lines1Z0 = float(loadStrings("ballpointX0.txt"));
  lines1X2 = float(loadStrings("ballpointY2.txt"));
  lines1Y2 = float(loadStrings("ballpointZ2.txt"));
  lines1Z2 = float(loadStrings("ballpointX2.txt"));
  lines1X4 = float(loadStrings("ballpointY4.txt"));
  lines1Y4 = float(loadStrings("ballpointZ4.txt"));
  lines1Z4 = float(loadStrings("ballpointX4.txt"));
  lines1X6 = float(loadStrings("ballpointY6.txt"));
  lines1Y6 = float(loadStrings("ballpointZ6.txt"));
  lines1Z6 = float(loadStrings("ballpointX6.txt"));
  lines1X8 = float(loadStrings("ballpointY8.txt"));
  lines1Y8 = float(loadStrings("ballpointZ8.txt"));
  lines1Z8 = float(loadStrings("ballpointX8.txt"));
  lines1X10 = float(loadStrings("ballpointY10.txt"));
  lines1Y10 = float(loadStrings("ballpointZ10.txt"));
  lines1Z10 = float(loadStrings("ballpointX10.txt"));

  cballs =new ArrayList();
  for (int i=0;i<30;i++) {
    cballs.add(new PVector(random(-width, width), random(-height, height), random(z)));
  }
  cball2s =new ArrayList();
  for (int i=0;i<30;i++) {
    cball2s.add(new PVector(random(-width, width), random(-height, height), random(z)));
  }
  cball4s =new ArrayList();
  for (int i=0;i<30;i++) {
    cball4s.add(new PVector(random(-width, width), random(-height, height), random(z)));
  }
  cball6s =new ArrayList();
  for (int i=0;i<30;i++) {
    cball6s.add(new PVector(random(-width, width), random(-height, height), random(z)));
  }
  cball8s =new ArrayList();
  for (int i=0;i<30;i++) {
    cball8s.add(new PVector(random(-width, width), random(-height, height), random(z)));
  }
  cball10s =new ArrayList();
  for (int i=0;i<30;i++) {
    cball10s.add(new PVector(random(-width, width), random(-height, height), random(z)));
  }
  for (int i =0; i<lines1X0.length; i++) {
    float mapX0 = map(lines1X0[i], -60, 60, -width/2, width/2);
    float mapY0 = map(lines1Y0[i], -60, 60, -height/2, height/2); 
    float mapZ0 = map(lines1Z0[i], 0, -60, 0, z);
    PVector ball = new PVector(mapX0, mapY0, mapZ0);
    Ball0s.add(ball);
  } 
  for (int i =0; i<lines1X2.length; i++) {
    float mapX2 = map(lines1X2[i], -60, 60, -width/2, width/2);
    float mapY2 = map(lines1Y2[i], -60, 60, -height/2, height/2); 
    float mapZ2 = map(lines1Z2[i], 0, -60, 0, z); 
    PVector ball2 = new PVector(mapX2, mapY2, mapZ2);
    Ball2s.add(ball2);
  }
  for (int i =0; i<lines1X4.length; i++) {
    float mapX4 = map(lines1X4[i], -60, 60, -width/2, width/2);
    float mapY4 = map(lines1Y4[i], -60, 60, -height/2, height/2); 
    float mapZ4 = map(lines1Z4[i], 0, -60, 0, z); 
    PVector ball4 = new PVector(mapX4, mapY4, mapZ4);
    Ball4s.add(ball4);
  }
  for (int i =0; i<lines1X6.length; i++) {
    float mapX6 = map(lines1X6[i], -60, 60, -width/2, width/2);
    float mapY6 = map(lines1Y6[i], -60, 60, -height/2, height/2); 
    float mapZ6 = map(lines1Z6[i], 0, -60, 0, z); 
    PVector ball6 = new PVector(mapX6, mapY6, mapZ6);
    Ball6s.add(ball6);
  }
  for (int i =0; i<lines1X8.length; i++) {
    float mapX8 = map(lines1X8[i], -60, 60, -width/2, width/2);
    float mapY8 = map(lines1Y8[i], -60, 60, -height/2, height/2); 
    float mapZ8 = map(lines1Z4[i], 0, -60, 0, z); 
    PVector ball8 = new PVector(mapX8, mapY8, mapZ8);
    Ball8s.add(ball8);
  }
  for (int i =0; i<lines1X10.length; i++) {
    float mapX10 = map(lines1X10[i], -60, 60, -width/2, width/2);
    float mapY10 = map(lines1Y10[i], -60, 60, -height/2, height/2); 
    float mapZ10 = map(lines1Z10[i], 0, -60, 0, z); 
    PVector ball10 = new PVector(mapX10, mapY10, mapZ10);
    Ball10s.add(ball10);
  }

  loc0=new PVector(Ball0s.get(0).x, Ball0s.get(0).y, Ball0s.get(0).z);

  for (int i = 0; i<Ball0s.size(); i++) {
    PVector bb = Ball0s.get(i);
    fill(0, 255, 0);
    pushMatrix();
    translate(bb.x, bb.y, bb.z);
    noStroke();
    sphere(3);
    translate(-bb.x, -bb.y, 0);
    popMatrix();
  }
  
  loc2=new PVector(Ball2s.get(0).x, Ball2s.get(0).y, Ball2s.get(0).z);
   for (int i = 0; i<Ball2s.size(); i++) {
    PVector cc = Ball2s.get(i);
    fill(0, 255, 0);
    pushMatrix();
    translate(cc.x, cc.y, cc.z);
    noStroke();
    sphere(3);
    translate(-cc.x, -cc.y, 0);
    //  text(str(i), cc.x+5, cc.y-5);
    popMatrix();
  }
  
  loc4=new PVector(Ball4s.get(0).x, Ball4s.get(0).y, Ball4s.get(0).z);
   for (int i = 0; i<Ball4s.size(); i++) {

    PVector dd = Ball4s.get(i);
    fill(0, 255, 0);
    pushMatrix();
    translate(dd.x, dd.y, dd.z);
    noStroke();
    sphere(3);

    translate(-dd.x, -dd.y, 0);
    //  text(str(i), cc.x+5, cc.y-5);
    popMatrix();
  }
  
  loc6=new PVector(Ball6s.get(0).x, Ball6s.get(0).y, Ball6s.get(0).z);
   for (int i = 0; i<Ball6s.size(); i++) {
    PVector ee = Ball6s.get(i);
    fill(0, 255, 0);
    pushMatrix();
    translate(ee.x, ee.y, ee.z);
    noStroke();
    sphere(3);
    translate(-ee.x, -ee.y, 0);
    //   text(str(i), bb.x+5, bb.y-5);
    popMatrix();
   }
   
  loc8=new PVector(Ball8s.get(0).x, Ball8s.get(0).y, Ball8s.get(0).z);
    for (int i = 0; i<Ball8s.size(); i++) {
    PVector ff = Ball8s.get(i);
    fill(0, 255, 0);
    pushMatrix();
    translate(ff.x, ff.y, ff.z);
    noStroke();
    sphere(3);
    translate(-ff.x, -ff.y, 0);
    //   text(str(i), bb.x+5, bb.y-5);
    popMatrix();
  }
  
  loc10=new PVector(Ball10s.get(0).x, Ball10s.get(0).y, Ball10s.get(0).z);
    for (int i = 0; i<Ball10s.size(); i++) {
    PVector gg = Ball10s.get(i);
    fill(0, 255, 0);
    pushMatrix();
    translate(gg.x, gg.y, gg.z);
    noStroke();
    sphere(3);
    translate(-gg.x, -gg.y, 0);
    //   text(str(i), bb.x+5, bb.y-5);
    popMatrix();
  }
}

void draw() {

  ///////////////////////////////////////////////////////////////////////////////////
  PVector ball = Ball0s.get(t);
  if (pct < 1.0) {
    pct += step;
    loc0.x = loc0.x + (pct * (Ball0s.get(t+1).x-loc0.x));
    loc0.y = loc0.y + (pow(pct, exponent) * (Ball0s.get(t+1).y-loc0.y));
    loc0.z = loc0.z + (pow(pct, exponent) * (Ball0s.get(t+1).z-loc0.z));

    if (pct >= 1) {
      if (t==Ball0s.size()-2) {
        goBack = true;
      }
      else if (t==0) {
        goBack = false;
      }
      if (goBack) {
        t--;
      }
      else {
        t++;
      }
      pct =0;
    }
  }

  fill(255, 0, 0);
  noStroke();
  pushMatrix();
  translate(loc0.x, loc0.y, loc0.z);
  sphere(2);
  popMatrix();

  for (int i = 0; i<Ball0s.size(); i++) {
    PVector bb = Ball0s.get(i);
    fill(0, 255, 0);
    pushMatrix();
    translate(bb.x, bb.y, bb.z);
    noStroke();
    sphere(3);
    translate(-bb.x, -bb.y, 0);
    //   text(str(i), bb.x+5, bb.y-5);
    popMatrix();
  }

  //////////////////////////////////////////////////////////////////////////
  fill(0, 10);
  box(width);
  for (int i=0;i<cballs.size();i++) {
    PVector p=(PVector)cballs.get(i);

    PVector ballVel= new PVector();
    ballVel.add(loc0);
    ballVel.sub(p);
    ballVel.normalize();
    ballVel.mult(10);
    p.add(ballVel);

    for (int n=0;n<cballs.size();n++) {
      if (i !=n) {
        PVector other=(PVector)cballs.get(n);
        float dis=p.dist(other);
        if (dis<5) {
          PVector ballvel2=new PVector();
          ballvel2.add(p);
          ballvel2.sub(other);
          ballvel2.normalize();
          ballvel2.mult(5);
          p.add(ballvel2);
        }
      }
    }

    // ellipse(p.x, p.y, random(2, 10), random(2, 10));
    pushMatrix();
    translate(p.x, p.y, p.z);
    fill(60, random(0, 255), 255, random(100, 255));
    sphere(2);
    popMatrix();
  }
  /////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////
  PVector ball2 = Ball2s.get(t);
  if (pct < 1.0) {
    pct += step;
    loc2.x = loc2.x + (pct * (Ball2s.get(t+1).x-loc2.x));
    loc2.y = loc2.y + (pow(pct, exponent) * (Ball2s.get(t+1).y-loc2.y));
    loc2.z = loc2.z + (pow(pct, exponent) * (Ball2s.get(t+1).z-loc2.z));

    if (pct >= 1) {
      if (t==Ball2s.size()-2) {
        goBack = true;
      }
      else if (t==0) {
        goBack = false;
      }
      if (goBack) {
        t--;
      }
      else {
        t++;
      }
      pct =0;
    }
  }

  fill(255, 0, 0);
  noStroke();
  pushMatrix();
  translate(loc2.x, loc2.y, loc2.z);
  sphere(2);
  popMatrix();

  for (int i = 0; i<Ball2s.size(); i++) {
    PVector cc = Ball2s.get(i);
    fill(0, 255, 0);
    pushMatrix();
    translate(cc.x, cc.y, cc.z);
    noStroke();
    sphere(3);
    translate(-cc.x, -cc.y, 0);
    //  text(str(i), cc.x+5, cc.y-5);
    popMatrix();
  }

  //////////////////////////////////////////////////////////////////////////

  for (int i=0;i<cball2s.size();i++) {
    PVector p2=(PVector)cball2s.get(i);

    PVector ballVel= new PVector();
    ballVel.add(loc2);
    ballVel.sub(p2);
    ballVel.normalize();
    ballVel.mult(10);
    p2.add(ballVel);

    for (int n=0;n<cballs.size();n++) {
      if (i !=n) {
        PVector other=(PVector)cball2s.get(n);
        float dis=p2.dist(other);
        if (dis<5) {
          PVector ballvel2=new PVector();
          ballvel2.add(p2);
          ballvel2.sub(other);
          ballvel2.normalize();
          ballvel2.mult(5);
          p2.add(ballvel2);
        }
      }
    }

    pushMatrix();
    translate(p2.x, p2.y, p2.z);
    fill(145, random(0, 255), 255, random(0, 255));
    sphere(2);
    popMatrix();
  }
  ///////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////
  PVector ball4 = Ball4s.get(t);
  if (pct < 1.0) {
    pct += step;
    loc4.x = loc4.x + (pct * (Ball4s.get(t+1).x-loc4.x));
    loc4.y = loc4.y + (pow(pct, exponent) * (Ball4s.get(t+1).y-loc4.y));
    loc4.z = loc4.z + (pow(pct, exponent) * (Ball4s.get(t+1).z-loc4.z));

    if (pct >= 1) {
      if (t==Ball2s.size()-2) {
        goBack = true;
      }
      else if (t==0) {
        goBack = false;
      }
      if (goBack) {
        t--;
      }
      else {
        t++;
      }
      pct =0;
    }
  }

  fill(255, 0, 0);
  noStroke();
  pushMatrix();
  translate(loc4.x, loc4.y, loc4.z);
  sphere(2);
  popMatrix();

  for (int i = 0; i<Ball4s.size(); i++) {
    PVector dd = Ball4s.get(i);
    fill(0, 255, 0);
    pushMatrix();
    translate(dd.x, dd.y, dd.z);
    noStroke();
    sphere(3);
    translate(-dd.x, -dd.y, 0);
    //  text(str(i), cc.x+5, cc.y-5);
    popMatrix();
  }
  
  //////////////////////////////////////////////////////////////////////////
  for (int i=0;i<cball4s.size();i++) {
    PVector p4=(PVector)cball4s.get(i);

    PVector ballVel4= new PVector();
    ballVel4.add(loc4);
    ballVel4.sub(p4);
    ballVel4.normalize();
    ballVel4.mult(10);
    p4.add(ballVel4);

    for (int n=0;n<cballs.size();n++) {
      if (i !=n) {
        PVector other=(PVector)cball4s.get(n);
        float dis=p4.dist(other);
        if (dis<5) {
          PVector ballvel4=new PVector();
          ballvel4.add(p4);
          ballvel4.sub(other);
          ballvel4.normalize();
          ballvel4.mult(5);
          p4.add(ballvel4);
        }
      }
    }

    pushMatrix();
    translate(p4.x, p4.y, p4.z);
    fill(227, random(0, 255), 255, random(0, 255));
    sphere(2);
    popMatrix();
  }
  /////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////
  PVector ball6 = Ball6s.get(t);
  if (pct < 1.0) {
    pct += step;
    loc6.x = loc6.x + (pct * (Ball6s.get(t+1).x-loc6.x));
    loc6.y = loc6.y + (pow(pct, exponent) * (Ball6s.get(t+1).y-loc6.y));
    loc6.z = loc6.z + (pow(pct, exponent) * (Ball6s.get(t+1).z-loc6.z));

    if (pct >= 1) {
      if (t==Ball6s.size()-2) {
        goBack = true;
      }
      else if (t==0) {
        goBack = false;
      }
      if (goBack) {
        t--;
      }
      else {
        t++;
      }
      pct =0;
    }
  }

  fill(255, 0, 0);
  noStroke();
  pushMatrix();
  translate(loc6.x, loc6.y, loc6.z);
  sphere(2);
  popMatrix();

  for (int i = 0; i<Ball6s.size(); i++) {
    PVector ee = Ball6s.get(i);
    fill(0, 255, 0);
    pushMatrix();
    translate(ee.x, ee.y, ee.z);
    noStroke();
    sphere(3);
    translate(-ee.x, -ee.y, 0);
    //   text(str(i), bb.x+5, bb.y-5);
    popMatrix();
  }
  //////////////////////////////////////////////////////////////////////////
  for (int i=0;i<cballs.size();i++) {
    PVector p6=(PVector)cball6s.get(i);

    PVector ballVel6= new PVector();
    ballVel6.add(loc6);
    ballVel6.sub(p6);
    ballVel6.normalize();
    ballVel6.mult(10);
    p6.add(ballVel6);

    for (int n=0;n<cball6s.size();n++) {
      if (i !=n) {
        PVector other=(PVector)cball6s.get(n);
        float dis=p6.dist(other);
        if (dis<5) {
          PVector ballvel6=new PVector();
          ballvel6.add(p6);
          ballvel6.sub(other);
          ballvel6.normalize();
          ballvel6.mult(5);
          p6.add(ballvel6);
        }
      }
    }

    // ellipse(p.x, p.y, random(2, 10), random(2, 10));
    pushMatrix();
    translate(p6.x, p6.y, p6.z);
    fill(255, random(0, 255), 255, random(0, 255));
    sphere(2);
    popMatrix();
  }
  /////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////
  PVector ball8 = Ball8s.get(t);
  if (pct < 1.0) {
    pct += step;
    loc8.x = loc8.x + (pct * (Ball8s.get(t+1).x-loc8.x));
    loc8.y = loc8.y + (pow(pct, exponent) * (Ball8s.get(t+1).y-loc8.y));
    loc8.z = loc8.z + (pow(pct, exponent) * (Ball8s.get(t+1).z-loc8.z));

    if (pct >= 1) {
      if (t==Ball8s.size()-2) {
        goBack = true;
      }
      else if (t==0) {
        goBack = false;
      }
      if (goBack) {
        t--;
      }
      else {
        t++;
      }
      pct =0;
    }
  }

  fill(255, 0, 0);
  noStroke();
  pushMatrix();
  translate(loc8.x, loc8.y, loc8.z);
  sphere(2);
  popMatrix();

  for (int i = 0; i<Ball8s.size(); i++) {
    PVector ff = Ball8s.get(i);
    fill(0, 255, 0);
    pushMatrix();
    translate(ff.x, ff.y, ff.z);
    noStroke();
    sphere(3);
    translate(-ff.x, -ff.y, 0);
    //   text(str(i), bb.x+5, bb.y-5);
    popMatrix();
  }
  
  //////////////////////////////////////////////////////////////////////////
  for (int i=0;i<cball8s.size();i++) {
    PVector p8=(PVector)cball8s.get(i);

    PVector ballVel8= new PVector();
    ballVel8.add(loc8);
    ballVel8.sub(p8);
    ballVel8.normalize();
    ballVel8.mult(10);
    p8.add(ballVel8);

    for (int n=0;n<cball8s.size();n++) {
      if (i !=n) {
        PVector other=(PVector)cball8s.get(n);
        float dis=p8.dist(other);
        if (dis<5) {
          PVector ballvel8=new PVector();
          ballvel8.add(p8);
          ballvel8.sub(other);
          ballvel8.normalize();
          ballvel8.mult(5);
          p8.add(ballvel8);
        }
      }
    }

    // ellipse(p.x, p.y, random(2, 10), random(2, 10));
    pushMatrix();
    translate(p8.x, p8.y, p8.z);
    fill( 255, random(0, 255), 200, random(0, 255));
    sphere(2);
    popMatrix();
  }
  /////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////
  PVector ball10 = Ball10s.get(t);
  if (pct < 1.0) {
    pct += step;
    loc10.x = loc10.x + (pct * (Ball10s.get(t+1).x-loc10.x));
    loc10.y = loc10.y + (pow(pct, exponent) * (Ball10s.get(t+1).y-loc10.y));
    loc10.z = loc10.z + (pow(pct, exponent) * (Ball10s.get(t+1).z-loc10.z));

    if (pct >= 1) {
      if (t==Ball10s.size()-2) {
        goBack = true;
      }
      else if (t==0) {
        goBack = false;
      }
      if (goBack) {
        t--;
      }
      else {
        t++;
      }
      pct =0;
    }
  }

  fill(255, 0, 0);
  noStroke();
  pushMatrix();
  translate(loc10.x, loc10.y, loc10.z);
  sphere(2);
  popMatrix();

  for (int i = 0; i<Ball10s.size(); i++) {
    PVector gg = Ball10s.get(i);
    fill(0, 255, 0);
    pushMatrix();
    translate(gg.x, gg.y, gg.z);
    noStroke();
    sphere(3);
    translate(-gg.x, -gg.y, 0);
    //   text(str(i), bb.x+5, bb.y-5);
    popMatrix();
  }
  
  //////////////////////////////////////////////////////////////////////////
  for (int i=0;i<cball10s.size();i++) {
    PVector p10=(PVector)cball10s.get(i);

    PVector ballVel10= new PVector();
    ballVel10.add(loc10);
    ballVel10.sub(p10);
    ballVel10.normalize();
    ballVel10.mult(10);
    p10.add(ballVel10);

    for (int n=0;n<cball10s.size();n++) {
      if (i !=n) {
        PVector other=(PVector)cball10s.get(n);
        float dis=p10.dist(other);
        if (dis<5) {
          PVector ballvel10=new PVector();
          ballvel10.add(p10);
          ballvel10.sub(other);
          ballvel10.normalize();
          ballvel10.mult(5);
          p10.add(ballvel10);
        }
      }
    }

    // ellipse(p.x, p.y, random(2, 10), random(2, 10));
    pushMatrix();
    translate(p10.x, p10.y, p10.z);
    fill(0, 122, random(0, 255), random(0, 255));
    sphere(2);
    popMatrix();
  }
  /////////////////////////////////////////////////////////////
}


