
/* 
Copyright (c) 2013 Radamés Ajna - OSI/MIT license (http://ou.lc/license.txt)
*/

Heartz h;

void setup() {
  size(500, 500 );
  h = new Heartz(width/2, height/2, 10);
}


void draw() { 
  background(255);
  h.pre();
  h.draw();
}

public class Heartz {
  float A = 16;
  float B = 13;
  float os = 0;
  float phase;
  float phase2;
  float px, py;
  boolean over=false, start =false;
  long lastTime=0;
  float tt=0.1;
  float s;

  Heartz(float px, float py, float s) {
    this.px = px;
    this.py = py;
    this.phase = random(0, TWO_PI);
    this.phase2 = random(0, PI/20  );
    this.s = s;
  }
  void pre() {
    if (frameCount%2==0) {
      os +=PI/10;
      if (os >=TWO_PI) os = 0;

      A = 16 +2*sin(os+phase);
      B = 13 +2*cos(os+phase);
    }
  }
  void draw() {
    if (!over && !start) {
      gen(A, B, tt, s);
    }
    else {
      start = true;
      tt +=0.01; 
      gen(A, B, tt, s);
      if (tt >=TWO_PI) {
        tt = 0.02;
        start = false;
      }
    }
  }

  void gen(float A, float B, float tt, float s) {

    pushMatrix();
    translate(px, py);
    rotate(PI);
    strokeWeight(2);
    stroke(255, 96, 65);
    fill(255, 96, 65);

    if (over) {
    }
    else {
      fill(255, 96, 65);

    }
    beginShape(TRIANGLE_FAN);

    for (float t=0; t<TWO_PI; t+=tt) {  
      float x  =  A*pow(sin((phase>PI?t:TWO_PI-t)), 3);
      float y  =  B*cos((phase>PI?t:TWO_PI-t)+phase2)-5*cos(2*(phase>PI?t:TWO_PI-t))-2*cos(3*t)-cos(4*t);
      curveVertex(x*s, y*s);
      if (pow(mouseX-px, 2)+ pow(mouseY-py, 2) > pow((x*s*2), 2)+ pow((y*s*2), 2)) {
        over = false;
      }
      else {
        over = true;
      }
    }
    endShape(CLOSE);
    popMatrix();
  }
}



