
// Sketch:  CircleStrings.pde
// Author:  Kevin Bowman
//-----------------------------------------------------------------------------
import ddf.minim.signals.*;
import ddf.minim.*;

int CanvasWidth = 600;
int CanvasHeight = 600;

final int N_CIRCLES = 10;
ArrayList circ_list;
HashMap pairs;

Minim minim;
AudioOutput out;

void setup() {
  // set up canvas
  size(CanvasWidth, CanvasHeight);
  noFill();
  smooth();
  strokeWeight(2);
  
  // set up sound
  minim = new Minim(this);
  out = minim.getLineOut();
  
  // create N_CIRCLES random circles
  int min_dim = min(CanvasWidth, CanvasHeight);
  circ_list = new ArrayList();
  for(int i = 0; i < N_CIRCLES; i++) {
     int rad = int(random(min_dim/32, min_dim/(5+i*1.1)));
     int cx = int(random(rad,CanvasWidth-rad));
     int cy = int(random(rad,CanvasHeight-rad));
     float dir = random(-PI, PI);
     float spd = random(1,6);
     circ_list.add(new Circle(rad, cx, cy, dir, spd));
  }
  
  // create initial hash map for unique pairs of circles
  pairs = new HashMap();
  for(int i = 0; i < N_CIRCLES-1; i++) {
    for(int j = i+1; j < N_CIRCLES; j++) {
      int k = (i * N_CIRCLES) + j;
      Pair p = new Pair();
      pairs.put((int)k, (Pair)p);
    }
  }
}

void draw() {
  background(0);  // clear canvas

  // display all circles at their present position
  for(int i = 0; i < N_CIRCLES; i++) {
    Circle circ = (Circle)circ_list.get(i);
    circ.display();
    //text(i, circ.a, circ.b);
  }

  // check for collisions between all unique pairs
  for(int i = 0; i < N_CIRCLES-1; i++) {
    for(int j = i+1; j < N_CIRCLES; j++) {
      Circle c1 = (Circle)circ_list.get(i);
      Circle c2 = (Circle)circ_list.get(j);
      float L = check_collide(c1, c2);
      int k = (i * N_CIRCLES) + j;
      Pair p = (Pair)pairs.get((int)k);
      if(L == 0)
        p.mute();
      else {
        p.freq(L_to_freq(L));
        p.pan((c1.a + c2.a)/CanvasWidth - 1);
        p.unmute();
      }
    }
  }

  // compute next position for each circle
  for(int i = 0; i < N_CIRCLES; i++) {
    Circle circ = (Circle)circ_list.get(i);
    circ.update();
  }
}

void stop()
{
  out.close();
  minim.stop();
  super.stop();
}


class Circle {
  float r, a, b;
  float dir, vel;
  
  Circle(float rad, float x, float y, float d, float v) {
    r = rad;
    a = x;
    b = y;
    dir = d;
    vel = v;
  }
  
  void setmotion(float d, float v) {
    dir = d;
    vel = v;
  }
  
  void update() {
    a += vel*cos(dir);
    b += vel*sin(dir);
    if(a <= r)
      dir = PI - dir;
    if(a >= (CanvasWidth-r))
      dir = PI - dir;
    if(b <= r)
      dir = -dir;
    if(b >= (CanvasHeight-r))
      dir = -dir;
    if(dir > TWO_PI)
      dir = dir - TWO_PI;
    if(dir < TWO_PI)
      dir = dir + TWO_PI;
  }
  
  // display the circle in RED
  void display() {
    stroke(255,0,0);
    ellipseMode(CENTER);
    ellipse(a, b, r*2, r*2);
  }
}

class Pair {
  SineWave w;

  Pair() {
    w = new SineWave(0, 0, 44100);
    out.addSignal(w);
  }
  
  void mute()         {  w.setAmp(0);    }
  void unmute()       {  w.setAmp(0.1);  }
  void freq(float f)  {  w.setFreq(f);   }
  void pan(float lr)  {  w.setPan(lr);   }
}

// checks if two circles are in contact with each other and,
// if so, draws a GREEN line between the two contact points
float check_collide(Circle c1, Circle c2) {
  float linelen = 0.0;
  float theta, beta;
  float d, x1, x2, y1, y2;
 
  d = sqrt((c2.a-c1.a)*(c2.a-c1.a) + (c2.b-c1.b)*(c2.b-c1.b));
  if((abs(c1.r - c2.r) < d) && (d < (c1.r + c2.r))) {
    // collision
    theta = atan((c2.b-c1.b)/(c2.a-c1.a));
    if(c2.a - c1.a < 0)  // adjust for Quadrant II & III
      theta = PI+theta;
      
    beta = acos((c2.r*c2.r - c1.r*c1.r - d*d)/(-2*d*c1.r));
    if(beta > HALF_PI)  // adjust of obtuse angles
      beta = PI - beta;
      
    x1 = c1.a + c1.r*cos(theta + beta);
    y1 = c1.b + c1.r*sin(theta + beta);
    x2 = c1.a + c1.r*cos(theta - beta);
    y2 = c1.b + c1.r*sin(theta - beta);
        
    // draw line
    stroke(0,255,0);
    line(x1, y1, x2, y2);
    linelen = sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1));
  }
  return linelen;
}

// convert string length to frequency (fundamental)
// f = (1/2L)*sqrt(T/mu)
// T := tension of string
// mu := linear density of string
// with T = 85, u = 04.6e-4, L = 65(cm), f = 330 Hz
float L_to_freq(float L) {
  float T = 200;         // tension 85 [N]
  float u = 0.46/1000;  // linear density [kg/m]

  return (100/(2*L))*sqrt(T/u);
}

