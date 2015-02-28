
import processing.opengl.*;

Ball balls[];
int step = 25, count = 75;
float xstart, ystart, rad, fac, trans;
float xnoise = 0, ynoise = 0, noi = 0.03, startnoi=0.002;

void setup() {
  size(800, 800);
  background(#222222);

  fill(#AA3333);
  smooth();
  balls = new Ball[count];

  ini();
}

void ini() {
  background(#222222);
  xstart = random(10);
  ystart = random(10);
  trans = random(20, 100);
  balls = new Ball[count];
  for(int i=0; i<count; i++) {
    balls[i] = new Ball();
  }
}

void mousePressed() {
  ini();
}

void draw() {
  
  xstart += 5;
  ystart += startnoi;
  xnoise = xstart;
  ynoise = ystart;

  for (int i=0; i<count; i++) {
    if(balls[i] != null) {
      balls[i].moved = false;
    }
  }

//  background(#222222);
  noStroke();
  fill(#222222, trans);
  rect(0,0,width, height);
  for (int i=step; i<round(width); i+=step) {
    ynoise += noi;
    xnoise = 0;
    for (int j=step; j<round(height); j+=step) {
      xnoise += noi;
      rad = noise(xnoise, ynoise)*15;
//      pushMatrix();
//      translate(i,j);
//      rotate(rad*radians(540));
//      stroke(#AA3333, 100);
//      line(0, 0, 0, step/2);
//      popMatrix();
      for (int k=0; k<count; k++) {
        if(balls[k] != null ) {
          balls[k].move(i, j, noise(xnoise, ynoise));
        }
      }
    }
  }

  for (int i=0; i<count; i++) {
    if(balls[i] != null) {
      balls[i].paint();
    }
  }

}

class Ball {

  PVector loc;
  float r, range, xspeed, yspeed;
  boolean moved;
  color col;
  
  Ball() {
    col = color(random(150, 255), random(50, 200), random(50, 150));
    r = random(5, 10);
    range = random(0.005,0.03);
    loc = new PVector(random(width-r)+r/2, random(height-r)+r/2);
  }
  
  void paint() {
    pushMatrix();
    translate(loc.x, loc.y);
    fill(col);
    noStroke();
    ellipse(0, 0, r, r);
    popMatrix();
  }
  
  void move(int i, int j, float rad) {
    if(abs(i-loc.x) < step && abs(j-loc.y) < step) {
      xspeed = cos(rad*radians(540))*range;
      yspeed = sin(rad*radians(540))*range;
      moved = true;
    }
    
    loc.x += xspeed;
    loc.y += yspeed;
    
    if(loc.x < step) {
      loc.x = width-step;
    }
    if(loc.x > width-step) {
      loc.x = step;
    }
    if(loc.y < step) {
      loc.y = height-step;
    }
    if(loc.y > height-step) {
      loc.y = step;
    }
  }
}

