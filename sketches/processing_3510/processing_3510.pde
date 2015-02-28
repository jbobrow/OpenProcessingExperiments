
void setup() {
  size(400, 300);
  background(bgColor);
  noStroke();
  fill(255); rect(301, 0, 100, 300);
  frameRate(200);
  ellipseMode(RADIUS);
  posA = new PVector(30, 240);    velA = new PVector(0.4, -0.4);
  posB = new PVector(180, 150);    velB = new PVector(0.0, 0.0);
  impactA = new PVector(0, 0);     impactB = new PVector(0, 0);
  velTot = new PVector(0, 0);
  diff = new PVector(posA.x-posB.x, posA.y-posB.y);
  font = loadFont("MyriadWebPro-18.vlw"); 
  textFont(font, 18);
  T = 0; impactCounter = 0;
  drawLines();
}
// =============================================================================
//      GLOBAL VARIABLES
// ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
final int radius = 30, margin = 100;
PVector posA, posB, velA, velB, velTot, diff, impactA, impactB;
final PVector east = new PVector(1, 0);
boolean looping = true;
final color bgColor = 225;
float diffAngle, velAAngle, velBAngle, a2, a3;
PFont font;
int T, impactCounter;
// =============================================================================
//      MAIN LOOP
// ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
void draw() {
  fill(255);
  rect(301, 0, 100, 60);
  fill(bgColor);
  rect(0, 0, width-margin+1, height);
  diffAngle = PVector.angleBetween(diff, east); if(diff.y < 0) diffAngle = 2*PI - diffAngle;
  if(velA.mag() == 0) velAAngle = 0; else velAAngle = PVector.angleBetween(velA, east); if(velA.y < 0) velAAngle = 2*PI - velAAngle;
  if(velB.mag() == 0) velBAngle = 0; else velBAngle = PVector.angleBetween(velB, east); if(velB.y < 0) velBAngle = 2*PI - velBAngle;
  a2 = velAAngle - diffAngle;
  a3 = velBAngle - diffAngle;
  posA.add(velA); 
  posB.add(velB); 
  diff.set(posB.x-posA.x, posB.y-posA.y, 0);
  if(posA.dist(posB) < radius*2) collision();
  wallCheckBounce();
  fill(255); drawCircles();
  fill(0);
  text(T/10, 308, 14);
  fill(#e02020);
  text(velA.mag(), 300, 32);
  fill(#2020e0);
  text(velB.mag(), 350, 32);
  fill(#802080);
  text(velTot.mag(), 325, 48);
  T++;
}
// =============================================================================
//      METHODS
// ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
void collision() {
  impactA.set( velA.mag()*cos(a2) * cos(diffAngle), velA.mag()*cos(a2) * sin(diffAngle), 0 );
  impactB.set( velB.mag()*cos(a3) * cos(diffAngle), velB.mag()*cos(a3) * sin(diffAngle), 0 );
  velA.sub(impactA); velA.add(impactB);
  velB.sub(impactB); velB.add(impactA);
  impactCounter++;
  drawLines();
}
void drawLines() {
  fill(#e02020);
  rect(301, 60+impactCounter*3, velA.mag()*30, 2);
  fill(#2020e0);
  rect(301 + velA.mag()*30, 60+impactCounter*3, velB.mag()*30, 2);
  velTot.x = velA.x; velTot.y = velA.y; velTot.add(velB);
  fill(#802080);
  rect(400, 60+impactCounter*3, -velTot.mag()*30, 2);
}
void drawCircles() {
  ellipse(posB.x, posB.y, radius, radius);
  ellipse(posA.x, posA.y, radius, radius);
  fill(#e02020);
  ellipse(posA.x, posA.y, radius*0.1, radius*0.1);
  fill(#2020e0);
  ellipse(posB.x, posB.y, radius*0.1, radius*0.1);
}
void mousePressed() {
  if(mouseButton == LEFT) {
    if(looping) { noLoop(); looping = false; } 
    else { loop(); looping = true; }
  }
  else { loop(); looping = true; setup(); }
}
void wallCheckBounce() {
  if(posA.x < radius) velA.x *= -1;  if(posA.x + radius > width-margin) velA.x *= -1;
  if(posB.x < radius) velB.x *= -1;  if(posB.x + radius > width-margin) velB.x *= -1;
  if(posA.y < radius) velA.y *= -1;  if(posA.y + radius > height)       velA.y *= -1;
  if(posB.y < radius) velB.y *= -1;  if(posB.y + radius > height)       velB.y *= -1;
}
void wallCheckWrap() {
  if(posA.x < 0) posA.x += width-margin;  if(posA.x > width-margin) posA.x -= width-margin;
  if(posB.x < 0) posB.x += width-margin;  if(posB.x > width-margin) posB.x -= width-margin;
  if(posA.y < 0) posA.y += height;        if(posA.y > height)       posA.y -= height;
  if(posB.y < 0) posB.y += height;        if(posB.y > height)       posB.y -= height;
}




