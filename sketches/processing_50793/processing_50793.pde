
float rX, rY;
float vX, vY;
float aX, aY;
float theta;
float omega;
float thrust;

float r, v;
float u, k, eMec, h;
float p, e, a, th, rp, ra;

float timeStep;
int stepsPerFrame;
float turnSpeed = PI/10;
float thrustRate = 0.02;

float minScaleFactor = 20.0;
float scaleFactor;

float tickSpacing = 1.0;

PGraphics pg;

PFont bigFont;

void setup() {
  size(600, 600);
  //  size(1200, 600);
  smooth();
  
  //  pg = createGraphics(width-height, height, JAVA2D);
  //  bigFont = loadFont("TimesNewRomanPSMT-48.vlw");
  //  pg.textFont(bigFont);
  
  initData();
}

void initData() {
  rX = 4.0 + 0.001;
  rY = 0.0 + 0.002;
  vX = 0.0 + 0.001;
  vY = - 1.0/2.0 + 0.001;
  theta = 0;
  omega = 0;
  thrust = 0;
  
  timeStep = 0.01;
  stepsPerFrame = 10;
  
  scaleFactor = 10.0;
}

void updateSim() {
    
  float r3 = pow(rX*rX + rY*rY, 1.5);
  float aXold = - rX/r3;
  float aYold = - rY/r3;
  
  aXold += thrust*sin(theta);
  aYold += thrust*cos(theta);
  
  rX += (vX*timeStep + 0.5*aXold*timeStep*timeStep);
  rY += (vY*timeStep + 0.5*aYold*timeStep*timeStep);
  
  vX += aXold*timeStep;
  vY += aYold*timeStep;
  
  theta += omega*timeStep;
 
  r3 = pow(rX*rX + rY*rY, 1.5);
  aX = - rX/r3;
  aY = - rY/r3;
  
  aX += thrust*sin(theta);
  aY += thrust*cos(theta);
  
  vX += 0.5*(aX-aXold)*timeStep;
  vY += 0.5*(aY-aYold)*timeStep;
  
  rX += 1.0/6.0*(aX-aXold)*timeStep*timeStep;
  rY += 1.0/6.0*(aY-aYold)*timeStep*timeStep;
  
  r = sqrt(rX*rX + rY*rY);
  v = sqrt(vX*vX + vY*vY);
  
  u = - 1.0/r;
  k = 0.5*v*v;
  eMec = u+k;
  h = rX*vY - rY*vX;
  
  p = h*h;
  e = sqrt(1 + 2*eMec*h*h);
  float dth = acos((p-r)/(r*e));
  if (rX*vX + rY*vY < 0) {
    dth = -dth;
  }
  float thShip = atan2(rY, rX);
  th = thShip + dth;
  
  rp = p/(1+e);
  ra = p/(1-e);
  
  a = 0.5*(ra+rp);
  
  println("r = " + r + ", v = " + v);
  println("U = " + u + ", K = " + k + ", Emec = " + eMec + ", h = " + h + ", p = " + p);
  println("p = " + p + ", e = " + e + ", th = " + th + ", rp = " + rp + ", ra = " + ra);
  
}

void drawPanel() {
  pg.beginDraw();
  pg.smooth();
  pg.background(50);
  
  pg.pushMatrix();
  
  pg.translate(pg.width/10, 4*pg.height/20);
  pg.scale(1, -1);
  pg.scale(pg.height*0.25);
  pg.strokeWeight(10.0/pg.height);
  
  pg.stroke(255);
  pg.noFill();
  pg.line(0, -1, 0, 0.6);
  pg.line(-0.1, 0, 3.2, 0);
  
  pg.stroke(0, 0, 255);
  pg.noFill();
  pg.beginShape();
  float maxX = 0.6*height/minScaleFactor;
  for (float x = 1; x < maxX; x += 0.1) {
    float y = -1.0/x;
    pg.curveVertex(x*3.2/maxX, y);
  }
  pg.endShape();
 
  pg.stroke(255, 0, 255);
  pg.line(-0.1, u+k, 3.2, u+k);
  
  pg.rectMode(CORNERS);
  pg.stroke(255, 0, 0);
  pg.fill(150, 0, 0);
  pg.rect(r*3.2/maxX - 0.02, u, r*3.2/maxX + 0.02, u+k);
  
  pg.popMatrix();
  
  pg.textFont(bigFont);
  pg.textAlign(LEFT, CENTER);
  pg.textSize(48);
  pg.fill(255, 0, 0);
  pg.text("E = U + K", pg.width/2, 2*pg.height/5);
  pg.fill(255);
  pg.text("E = U +", pg.width/2, 2*pg.height/5);
  pg.fill(0, 0, 255);
  pg.text("E = U", pg.width/2, 2*pg.height/5);
  pg.fill(255);
  pg.text("E =", pg.width/2, 2*pg.height/5);
  pg.fill(255, 0, 255);
  pg.text("E", pg.width/2, 2*pg.height/5);
   
  pg.endDraw();

}

void draw() {
  
  for (int i = 0; i < stepsPerFrame; ++i) {
    updateSim();
  }
  
  ellipseMode(RADIUS);

  background(0);
  pushMatrix();
  translate(height/2, height/2);
  scaleFactor = min(minScaleFactor, 0.9*min(width, height)/(2*r));
  scale(scaleFactor, -scaleFactor);
  
  stroke(75, 75, 75);
  noFill();
  float tickEdge = 20*tickSpacing;
  for (float x = -tickEdge; x <= tickEdge; x += tickSpacing) {  
    strokeWeight(1.0/minScaleFactor);
    line(x, -tickEdge, x, tickEdge);
    line(-tickEdge, x, tickEdge, x);
    
    strokeWeight(3.0/minScaleFactor);
    line(5*x, -5*tickEdge, 5*x, 5*tickEdge);
    line(-5*tickEdge, 5*x, 5*tickEdge, 5*x);
  }

  pushMatrix();
  rotate(th);
  strokeWeight(2.0/scaleFactor);
  noFill();
  if (e<1) {
    stroke(100, 100, 0);
    line(0, 0, rp, 0);
    translate(-e*a, 0);
    stroke(200, 200, 0);
    ellipse(0, 0, a, a*sqrt(1-e*e));
  } else {
    stroke(50, 50, 100);
    line(rp, 0, 0, 0);
    float thAsy = acos(1/e);
    stroke(100, 100, 200);
    beginShape();
    for (float t = -0.95*thAsy; t <= 0.95*thAsy; t += 0.01*thAsy) {
      float ro = p/(1-e*cos(t));
      curveVertex(ro*cos(t) - ra + rp, ro*sin(t));
    }
    endShape();
  }
  popMatrix();
  
  stroke(0, 0, 255);
  strokeWeight(1.0/scaleFactor);
  fill(0, 255, 0);
  ellipse(0, 0, 1, 1);
  
  pushMatrix();
  translate(rX, rY);
  rotate(-theta);
  
  pushMatrix();
  
  scale(1.5);
  if (thrust>0) {
    stroke(255, 100, 0);
    fill(150, 50, 0);
    beginShape();
    vertex(0, -3.2);
    vertex(-0.3, -0.6);
    vertex(0, -0.4);
    vertex(0.3, -0.6);
    endShape(CLOSE);
  }
  
  stroke(255, 255, 255);
  fill(150, 150, 150);
  beginShape();
  vertex(0, -0.2);
  vertex(-0.3, -0.4);
  vertex(0, 0.4);
  vertex(0.3, -0.4);
  endShape(CLOSE);

  popMatrix();
  
  popMatrix();
  
  popMatrix();
  
  //drawPanel();
  //image(pg, height, 0, pg.width, pg.height);
  
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode==LEFT) {
      omega = -turnSpeed;
    } else if (keyCode==RIGHT) {
      omega = +turnSpeed;
    } else if (keyCode==UP) {
      thrust = thrustRate;
    }
  } else if (key=='r' || key=='R') {
    initData();
  }
}

void keyReleased() {
  if (key==CODED) {
    if (keyCode==LEFT || keyCode==RIGHT) {
      omega = 0;
    } else if (keyCode==UP) {
      thrust = 0;
    }
  }
}

