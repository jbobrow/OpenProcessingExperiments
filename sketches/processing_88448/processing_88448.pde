
// Processing 2.0b7
//Developed by Ping-Yeh Li
//import processing.opengl.*;
ArrayList points;
ArrayList Gpoints;
ArrayList Rpoints;
float forceXpos, forceYpos, forceZpos;
float forceXpos2, forceYpos2, forceZpos2;
float forceXpos3, forceYpos3, forceZpos3;
int i;
float k;
float angle;
float far;
void setup() {
  size(500, 500, OPENGL);
  points= new ArrayList();
  Gpoints= new ArrayList();
  Rpoints= new ArrayList();
}
void draw() {
  background(0);
  angle+=0.01;
  camera(width/2.0+sin(angle)*200, height/2.0+cos(angle)*200, (height/2.0) / tan(PI*30.0 / 180.0)+150, 300.0, 300.0, 0.0, 
  0.0, 1.0, 0.0);
  k+=0.01;
  forceXpos=300-sin(k)*150;
  forceYpos=400+cos(k*2)*150;
  forceZpos=-sin(k*3)*100+far;
  forceXpos2=300+sin(k*3)*150;
  forceYpos2=300+cos(k*2)*150;
  forceZpos2=-sin(k)*100+far;
  forceXpos3=300+sin(k*2)*100;
  forceYpos3=300+cos(k*2)*150;
  forceZpos3=sin(k*3)*150+far;
  Point myPoint = new Point(random(width), random(height), random(10), forceXpos, forceYpos, forceZpos, random(1));
  PointG myGPoint = new PointG(random(width), random(height), random(10), forceXpos2, forceYpos2, forceZpos2, random(1));
  PointR myRPoint = new PointR(random(width), random(height), random(10), forceXpos3, forceYpos3, forceZpos3, random(1));
  if (points.size()<500) {
    points.add(myPoint);
  }
  if (Gpoints.size()<500) {
    Gpoints.add(myGPoint);
  }
  if (Rpoints.size()<500) {
    Rpoints.add(myRPoint);
  }
  if (mousePressed) {
far=random(700,1000);
  }
  else {
    far=0;
  }
  for (int i=0;i<points.size();i++) { 
    Point myPoint2= (Point) points.get(i);
    myPoint2.display();
    myPoint2.move(random(1),far/10);
    PointG myGPoint2= (PointG) Gpoints.get(i);
    myGPoint2.display();
    myGPoint2.move(random(1),far/10);
    PointR myRPoint2= (PointR) Rpoints.get(i);
    myRPoint2.display();
    myRPoint2.move(random(1),far/10);
  }
 
  if (points.size()>=500) {
    points.remove(0);
  }
  if (Gpoints.size()>=500) {
    Gpoints.remove(0);
  }
  if (Rpoints.size()>=500) {
    Rpoints.remove(0);
  }
}
class PointG {
  //Variables
  float xpos;
  float ypos;
  float zpos;
  float forceXpos;
  float forceYpos;
  float forceZpos;
  float speedX;
  float speedY;
  float easing=0.01;
  float PIRvals;
  float force;
  float angle;
  PointG(float _xpos, float _ypos, float _zpos, float _forceXpos, float _forceYpos, float _forceZpos, float _PIRvals) {
    xpos=_xpos;
    ypos=_ypos;
    zpos=_zpos;
    forceXpos= _forceXpos;
    forceYpos= _forceYpos;
    forceZpos= _forceZpos;
    PIRvals= _PIRvals;
  }
  //Functionality
  void display() {
    //光暈
    strokeWeight(2);
    stroke(160, 255, 5, random(50, 120)+sin(angle)*150); 
    
    point(xpos, ypos, zpos);
    strokeWeight(1);
    //光點    
    stroke(255, 255, 255, random(150, 255)+sin(angle)*150);
    point(xpos, ypos, zpos);
    angle+=0.1;
  }

  void move(float _speed, float _speedfar) {
    speedX= _speed;
    speedY= _speed*2+_speedfar;
    xpos+=speedX;
    ypos-=speedY;
    force= dist(forceXpos, forceYpos, forceZpos, xpos, ypos, zpos)*0.05*PIRvals;
    //吸引力
    if (forceXpos<xpos &forceYpos;>ypos& forceZpos>zpos) {
      xpos-=force;
      ypos+=force;
      zpos+=force;
    }
    if (forceXpos<xpos &forceYpos;>ypos&forceZpos;<zpos) {
      xpos-=force;
      ypos+=force;
      zpos-=force;
    }

    if (forceXpos<xpos &forceYpos;<ypos& forceZpos>zpos) {
      xpos-=force;
      ypos-=force;
      zpos+=force;
    }
    if (forceXpos<xpos &forceYpos;<ypos& forceZpos<zpos) {
      xpos-=force;
      ypos-=force;
      zpos-=force;
    }

    if (forceXpos>xpos &forceYpos;>ypos& forceZpos>zpos) {
      xpos+=force;
      ypos+=force;
      zpos+=force;
    }
    if (forceXpos>xpos &forceYpos;>ypos& forceZpos<zpos) {
      xpos+=force;
      ypos+=force;
      zpos-=force;
    }

    if (forceXpos>xpos &forceYpos;<ypos& forceZpos>zpos) {
      xpos+=force;
      ypos-=force;
      zpos+=force;
    }
    if (forceXpos>xpos &forceYpos;<ypos& forceZpos<zpos) {
      xpos+=force;
      ypos-=force;
      zpos-=force;
    }
  }
}
class PointR {
  //Variables Blue
  float xpos;
  float ypos;
  float zpos;
  float forceXpos;
  float forceYpos;
  float forceZpos;
  float speedX;
  float speedY;
  float easing=0.01;
  float PIRvals;
  float force;
  float angle;
  //Constructor
  PointR(float _xpos, float _ypos, float _zpos, float _forceXpos, float _forceYpos, float _forceZpos, float _PIRvals) {
    xpos=_xpos;
    ypos=_ypos;
    zpos=_zpos;
    forceXpos= _forceXpos;
    forceYpos= _forceYpos;
    forceZpos= _forceZpos;
    PIRvals= _PIRvals;
  }
  //Functionality
  void display() {
    //光暈
    strokeWeight(2);
    stroke(0, 115, 255, random(50, 120)+sin(angle)*150); 
    point(xpos, ypos, zpos);
    strokeWeight(1);
    //光點    
    stroke(255, 255, 255, random(150, 255)+sin(angle)*150);
    point(xpos, ypos, zpos);
    angle+=0.1;
  }
  void move(float _speed, float _speedfar) {
    speedX= _speed;
    speedY= _speed*2;
    xpos+=speedX;
    ypos-=speedY;
    zpos+=_speedfar;
    force= dist(forceXpos, forceYpos, forceZpos, xpos, ypos, zpos)*0.05*PIRvals;
    if (forceXpos<xpos &forceYpos;>ypos& forceZpos>zpos) {
      xpos-=force;
      ypos+=force;
      zpos+=force;
    }
    if (forceXpos<xpos &forceYpos;>ypos&forceZpos;<zpos) {
      xpos-=force;
      ypos+=force;
      zpos-=force;
    }

    if (forceXpos<xpos &forceYpos;<ypos& forceZpos>zpos) {
      xpos-=force;
      ypos-=force;
      zpos+=force;
    }
    if (forceXpos<xpos &forceYpos;<ypos& forceZpos<zpos) {
      xpos-=force;
      ypos-=force;
      zpos-=force;
    }
    if (forceXpos>xpos &forceYpos;>ypos& forceZpos>zpos) {
      xpos+=force;
      ypos+=force;
      zpos+=force;
    }
    if (forceXpos>xpos &forceYpos;>ypos& forceZpos<zpos) {
      xpos+=force;
      ypos+=force;
      zpos-=force;
    }
    if (forceXpos>xpos &forceYpos;<ypos& forceZpos>zpos) {
      xpos+=force;
      ypos-=force;
      zpos+=force;
    }
    if (forceXpos>xpos &forceYpos;<ypos& forceZpos<zpos) {
      xpos+=force;
      ypos-=force;
      zpos-=force;
    }
  }
}
class Point {
  //Variables
  float xpos;
  float ypos;
  float zpos;
  float forceXpos;
  float forceYpos;
  float forceZpos;
  float speedX;
  float speedY;
  float easing=0.01;
  float PIRvals;
  float force;
 float angle;
  Point(float _xpos, float _ypos, float _zpos, float _forceXpos, float _forceYpos, float _forceZpos, float _PIRvals) {
    xpos=_xpos;
    ypos=_ypos;
    zpos=_zpos;
    forceXpos= _forceXpos;
    forceYpos= _forceYpos;
    forceZpos= _forceZpos;
    PIRvals= _PIRvals;
  }
  void display() {
    strokeCap(ROUND);
    strokeWeight(2);
    stroke(0, 255, 234, random(50, 120)+sin(angle)*150); 
    point(xpos, ypos, zpos);
    strokeWeight(1);
    stroke(255, 255, 255, random(150, 255)+sin(angle)*150);
    point(xpos, ypos, zpos);
    angle+=0.1;
  }
  void move(float _speed, float _speedfar) {
    speedX= _speed+_speedfar;
    speedY= _speed*2;
    xpos+=speedX;
    ypos-=speedY;
    force= dist(forceXpos, forceYpos, forceZpos, xpos, ypos, zpos)*0.05*PIRvals;
    if (forceXpos<xpos &forceYpos;>ypos& forceZpos>zpos) {
      xpos-=force;
      ypos+=force;
      zpos+=force;
    }
    if (forceXpos<xpos &forceYpos;>ypos&forceZpos;<zpos) {
      xpos-=force;
      ypos+=force;
      zpos-=force;
    }
    if (forceXpos<xpos &forceYpos;<ypos& forceZpos>zpos) {
      xpos-=force;
      ypos-=force;
      zpos+=force;
    }
    if (forceXpos<xpos &forceYpos;<ypos& forceZpos<zpos) {
      xpos-=force;
      ypos-=force;
      zpos-=force;
    }
    if (forceXpos>xpos &forceYpos;>ypos& forceZpos>zpos) {
      xpos+=force;
      ypos+=force;
      zpos+=force;
    }
    if (forceXpos>xpos &forceYpos;>ypos& forceZpos<zpos) {
      xpos+=force;
      ypos+=force;
      zpos-=force;
    }
    if (forceXpos>xpos &forceYpos;<ypos& forceZpos>zpos) {
      xpos+=force;
      ypos-=force;
      zpos+=force;
    }
    if (forceXpos>xpos &forceYpos;<ypos& forceZpos<zpos) {
      xpos+=force;
      ypos-=force;
      zpos-=force;
    }
  }
}



