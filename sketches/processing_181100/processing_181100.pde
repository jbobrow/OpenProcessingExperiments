
int h;   
int m;  
int s;
int ms;


void setup() {
  size(680, 280);
  smooth();
  noFill();
  strokeWeight(4);
  background(255);
}

void draw() {
  translate(40,40);
  background(255);
  updateTime();

  float seconds = map(s, 0, 60, 30, 200);
  float minutes = map(m, 0, 60, 30, 200);
  float hours   = map(h, 0, 23, 30, 200);

  stroke(0,0,255);
  //ellipse(100,100,200,200);
  //stroke(255);
  ellipse(100, 100, seconds, seconds);

  stroke(0,255,0);
  //ellipse(300,100,200,200);
  ellipse(300, 100, minutes, minutes);
  
  stroke(255,0,0);
  //ellipse(500,100,200,200);
  ellipse(500, 100, hours, hours);
}

void updateTime() {
  h = hour();   
  m = minute();  
  s = second();
}

