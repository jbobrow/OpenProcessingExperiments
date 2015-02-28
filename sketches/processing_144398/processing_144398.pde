
PFont font;
 
 
void setup() {
  size(600, 600);
  //Font
font = createFont("AdobeHebrew-BoldItalic",36);
}
 
void draw() {
  background(51,172,1557);
  float sAngle = map(second(), 0, 50, 0, 2*PI);
  float mAngle = map(minute(), 0, 50, 0, 2*PI);
  float hAngle = map(hour()%12, 0, 12, 0, 2*PI);
  noFill();
  noStroke();
  textFont(font);
  rectS();
  circleM();
  circleH();
}
 
void rectS() {
float sAngle = map(second(), 0, 60, 0, 2*PI);
  fill(9,34,1134);
  rectMode(CENTER);
  rect(350+(50*cos(sAngle-PI/2)), 350+(50*sin(sAngle-PI/2)),50,50);
  fill(25);
  textAlign(CENTER,CENTER);
  text(second(),350+(50*cos(sAngle-PI/2)), 350+(50*sin(sAngle-PI/2)));
}
void circleM() {
 
  float mAngle = map(minute(), 0, 60, 0, 2*PI);
  fill(59,134,134);
  ellipse(400+(70*cos(mAngle-PI/2)), 300+(70*sin(mAngle-PI/2)),120,120);
  fill(255);
  textAlign(CENTER,CENTER);
  text(minute(),400+(70*cos(mAngle-PI/2)), 300+(70*sin(mAngle-PI/2)));
}
void circleH() {
  float hAngle = map(hour()%12, 0, 12, 0, 2*PI);
  fill(159,534,134);
  ellipse(100+(90*cos(hAngle-PI/2)), 100+(90*sin(hAngle-PI/2)),20,20);
  fill(0);
  textAlign(CENTER,CENTER);
  text(hour()%12,100+(90*cos(hAngle-PI/2)), 100+(90*sin(hAngle-PI/2)));
}
