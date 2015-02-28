
float a, b, anglur, angles, friction,s,s2,vx,vy,speed;
Circle circle = new Circle();
boolean hold;
float spring, targetA,targetB,gravity,targetX,targetY;

int numSegments = 40;
float[] x = new float[numSegments];
float[] y = new float[numSegments];
float[] angle = new float[numSegments];
float segLength = 6.5;
Ball[] balls = new Ball[2];


void setup() {
  size(800,800);
  a = width/2;
  b = height/2;
  speed = 3;
  s = 40;
  s2 = 455;
  vx = 0;
  vy = 0;
  smooth();
  hold = false;
  spring = 0.1;
  targetA = width/2;
  targetB = height/2;
  friction = .85;
  gravity = .8;
  x[x.length-1] = width/2;
  y[x.length-1] = height/2;
  
  balls[0] = new Ball(width/2 - 2, 648);
  balls[1] = new Ball(width/2 - 2, 152);
 
}


void draw() {
  background(255);
  fill(255, 50);
  rect(0,0,width,height);
  fill(255);
  stroke(0);
  strokeWeight(4);
  ellipse(targetA,targetB,s2,s2);
  noStroke();
  noFill();
  
  
  for(int i=0; i < 2; i++) {

    anglur += 1;
    balls[0].xx = cos(radians(anglur)) * 250 + width/2;
    balls[0].yy = sin(radians(anglur)) * 250 + height/2;
    balls[1].xx = -cos(radians(anglur)) * 250 + width/2;
    balls[1].yy = -sin(radians(anglur)) * 250 + height/2;
    fill(0,0,200);
    ellipse(balls[i].xx,balls[i].yy,40,40);
    noFill();
    
    if (!hold && dist(a,b,balls[i].xx,balls[i].yy) < s/2) {
      println("slickness");
      
    }
  }
   reachSegment(0, a, b);
  for(int i=1; i<numSegments; i++) {
    reachSegment(i, targetX, targetY);
  }
  for(int i=x.length-1; i>=1; i--) {
    positionSegment(i, i-1);
  } 
  for(int i=0; i<x.length; i++) {
    segment(x[i], y[i], angle[i],(i+1)*1.5);
  }
  circle.display();
  circle.grab();
  
  
  
}


class Ball {
  
  float xx, yy;
  
  Ball(float x1, float y1) {
    this.xx = x1;
    this.yy = y1;
  }
  
}



void positionSegment(int a, int b) {
  x[b] = x[a] + cos(angle[a]) * segLength;
  y[b] = y[a] + sin(angle[a]) * segLength; 
  y[b] += gravity;
}

void reachSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  angle[i] = atan2(dy, dx);
  targetX = xin - cos(angle[i]) * segLength;
  targetY = yin - sin(angle[i]) * segLength;
}

void segment(float x, float y, float a, float sw) {

  stroke(0);
  strokeWeight(sw);
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}


class Circle {
  float dx, dy, ax, ay;
  Circle() { 
  }
  
  void display() {
    angles += speed;
    s = sin(radians(angles)) * 10 + 50;
    fill(0);
    ellipse(a,b,s,s);
  }
  
  void grab() {
    
  a += vx;
  b += vy;
  vx += ax;
  vy += ay;
  vx *= friction;
  vy *= friction;
  dx = targetX - a;
  dy = targetY - b;
  ax = dx * spring;
  ay = dy * spring;
    
    if (mousePressed) {
    if (dist(mouseX,mouseY,a,b) < 40) {
        a = mouseX;
        b = mouseY;
        hold = true;
      }
      
    if (hold) {
      if(dist(mouseX,mouseY,a,b) < 220) {
        a = mouseX;
        b = mouseY;
        speed += .06;
      }
      
    float dd = dist(targetA,targetB,a,b);
    if (dd > 290) {
      hold = false;
    }
    }
    }
    
    else {
        hold = false;
        speed -= .06;
      }
    if (vx < .03 && vx > -.03) {
      vx = 0;
      vy = 0;
    }
    
    if (speed < 3) {
    speed = 3;
    }    
    
    if (speed > 15) {
    speed = 15;
    } 
  }
  
  
}

