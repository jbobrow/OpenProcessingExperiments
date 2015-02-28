
PFont font;


void setup() {
  size(205, 205);
font = createFont("HelveticaNeue-Thin",12);
  //String[] fontList = PFont.list();
  //println(fontList);
}

void draw() {
  background(11,72,107);
float sAngle = map(second(), 0, 60, 0, 2*PI);
  float mAngle = map(minute(), 0, 60, 0, 2*PI);
  float hAngle = map(hour()%12, 0, 12, 0, 2*PI);
  noFill();
  stroke(207,240,158);
  strokeWeight(5);
  arc(100, 100, 100, 100, -PI/2, sAngle-PI/2);
  stroke(168,219,168);
  arc(100, 100, 140, 140, -PI/2, mAngle-PI/2);
  stroke(121,189,154);
  arc(100, 100, 180, 180, -PI/2, hAngle-PI/2);
  noStroke();
  textFont(font);
  circleS();
  circleM();
  circleH();
}

void circleS() {
float sAngle = map(second(), 0, 60, 0, 2*PI);
  fill(59,134,134);
  ellipse(100+(50*cos(sAngle-PI/2)), 100+(50*sin(sAngle-PI/2)),20,20);
  fill(255);
  textAlign(CENTER,CENTER);
  text(second(),100+(50*cos(sAngle-PI/2)), 100+(50*sin(sAngle-PI/2)));
}
void circleM() {

  float mAngle = map(minute(), 0, 60, 0, 2*PI);
  
  fill(59,134,134);
  ellipse(100+(70*cos(mAngle-PI/2)), 100+(70*sin(mAngle-PI/2)),20,20);
  fill(255);
  textAlign(CENTER,CENTER);
  text(minute(),100+(70*cos(mAngle-PI/2)), 100+(70*sin(mAngle-PI/2)));
}
void circleH() {
  float hAngle = map(hour()%12, 0, 12, 0, 2*PI);
  fill(59,134,134);
  ellipse(100+(90*cos(hAngle-PI/2)), 100+(90*sin(hAngle-PI/2)),20,20);
  fill(255);
  textAlign(CENTER,CENTER);
  text(hour()%12,100+(90*cos(hAngle-PI/2)), 100+(90*sin(hAngle-PI/2)));
}

