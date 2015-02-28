

/* 
Konkuk University 
SOS iDesign 
Name: WOO Eunhye 
ID: 201420091
*/ 



PFont font;
 
 
void setup() {
  size(600, 600);
  //Font
font = createFont("AdobeHebrew-BoldItalic",36);
}
 
void draw() {
  background(255,255,255);
  float sAngle = map(second(), 0, 200, 0, 7*PI);
  float mAngle = map(minute(), 0, 60, 0, 2*PI);
  float hAngle = map(hour()%12, 0, 12, 0, 7*PI);
  noFill();
  noStroke();
  textFont(font);
  ellipseS();
  circleM();
  circleH();
}
 
void ellipseS() {
float sAngle = map(second(), 0, 100, 0, 7*PI);
  fill(random(255),random(255),random(255));
  ellipseMode(CENTER);
  ellipse(350+(50*cos(sAngle-PI/2)), 350+(50*sin(sAngle-PI/2)),50,50);
  fill(255);
  textAlign(CENTER,CENTER);
  text(second(),350+(50*cos(sAngle-PI/2)), 350+(50*sin(sAngle-PI/2)));
}
void circleM() {
 
  float mAngle = map(minute(), 0, 60, 0, 0*PI);
  fill(0, 0, 0);
  ellipse(400+(70*cos(mAngle-PI/2)), 300+(70*sin(mAngle-PI/2)),100,100);
  fill(255);
  textAlign(CENTER,CENTER);
  text(minute(),400+(70*cos(mAngle-PI/2)), 300+(70*sin(mAngle-PI/2)));
}
void circleH() {
  float hAngle = map(hour()%12, 0, 12, 0, 10*PI);
  fill(mouseX+10, mouseY+10,600);
  ellipse(100+(100*cos(hAngle-PI/2)), 200+(90*sin(hAngle-PI/2)),300,300);
  fill(0);
  textAlign(CENTER,CENTER);
  text(hour()%12,100+(200*cos(hAngle-PI/2)), 200+(90*sin(hAngle-PI/2)));
}

