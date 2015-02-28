
class StreetLight {

  //---Define class variables here---
  boolean on;
  float x1,y1,x2,y2,x3,y3,x4,y4;
  float r1,r2,r3;
  float p1,q1;
  color c;
  color cP;
  color cH;

  // constructor
  StreetLight(float tx, float ty, float th) {
    //---define your constructor and initial values here---

    x1 = tx;
    y1 = ty;
    x2 = tx-(th/15);
    y2 = (ty-th/45);
    x3 = x1;
    y3 = ty-th;
    x4 = tx+(th/15);
    y4 = y2;

    r1 = th/4;
    r2 = th/20;
    r3 = th/2.2;

    p1 = x2-(th/10);
    q1 = y1-(th/10);

    c = color (98,73,76);
    cP= color (49,46,46);
    cH = color (98,73,76);

    on = false;
  }

  boolean isOn() {
    return on;
  }

  void turnOn() {
    on = true;
    c = color ((random(225,255)),(random(160,225)),(random(50,100)));
    cP= color (85,84,84);
    cH = color (255,249,175,75);

  }

  void turnOff() {
    on = false;
    c = color (98,73,76);
    cP= color (49,46,46);
    cH = color (98,73,76);
  }

  void display() {
    drawLight();
  }

  void drawLight() {

    // draw the street light here
    
        
    fill(cH);
    noStroke();
    ellipse(x1,y3,r3,r3);
    
    //lamp post
    fill(cP);
    noStroke();
    quad (x1,y1,x2,y2,x3,y3,x4,y4);
    stroke(0);
    strokeWeight(.5);
    line (x1,y1,x3,y3);
    line (x4,y4,x3,y3);
    line (x2,y2,x3,y3);
    line (x1,y1,x2,y2);
    line (x1,y1,x4,y4);
    ellipse(x3,y3+(r1/2.1),r2*3,r2);



    //light
    fill(c);
    ellipse(x1,y3,r1,r1);
    //top/bottom rims
    fill(cP);
    ellipse(x3,y3-(r1/2.25),r2*3,r2);
    ellipse(x3,y3-(r1/1.75),r2,r2);
    

  }
} // end of class StreetLight


