
float X, Speed, Acc, Angle, FRICTION;

void setup(){
  
  size(940, 140);
  colorMode(HSB, 360, 100, 100);
  background(0);
  frameRate(30);
  
  X = 0;
  Speed = 1;
  Acc = 1.02;
  Angle = 0;
  FRICTION = 0.9;
}

void draw(){

  draw_m(120);
  draw_o(320);
  draw_c(430);
  draw_dot(540);
  draw_c(630);
  draw_o(740);
  draw_m(850);
  
  draw_m_t(120);
  
  draw_t(50, 50);
  draw_t_r(205, 0);
}

void draw_t(int x, int y){
  fadeToWhite();

  noStroke();
  rectMode(CENTER);
  
  //T
  int mo = month();
  int h = hour();
  int m = minute();
  translate(x, y);

  fill(m + 55, h + 50, 95 - mo, 100);
  rect(0, 0, 20, 80);
  
  fill(m + 55, h + 50, 95 - mo, 100);
  rect(0, 0, 80, 20);

  fill(m + 55, h + 50, 95 - mo, 100);
  beginShape();
  vertex(0, 0 + 25 - 50);
  vertex(0 - 25, 0 + 50 - 50);
  vertex(0, 0 + 75 - 50);
  vertex(0 + 25, 0 + 50 - 50);
  endShape(CLOSE);
  
}

void draw_t_r(int x, int y){
  fadeToWhite();

  noStroke();
  rectMode(CENTER);
  
  //T
  translate(x, y);
  
  rotate(radians(Angle)); 

  fill(216, 100, 60, 100);
  rect(0, 0, 20, 80);
  
  fill(216, 100, 60, 100);
  rect(0, 0, 80, 20);

  fill(216, 100, 60, 100);
  beginShape();
  vertex(0, 0 + 25 - 50);
  vertex(0 - 25, 0 + 50 - 50);
  vertex(0, 0 + 75 - 50);
  vertex(0 + 25, 0 + 50 - 50);
  endShape(CLOSE);
  
  Angle += 3;
  
}

void draw_m(int y){
  fadeToWhite();
  
  noStroke();
  
  //M
  int mo = month();
  int h = hour();
  int m = minute();
  fill(mo * 30, h * 3, m * 3, 30);
  smooth();
  beginShape();
  curveVertex(y, 120);
  curveVertex(y, 120);
  curveVertex(y, 40);
  curveVertex(y+70, 40);
  curveVertex(y+70, 120);
  curveVertex(y+70, 120);
  vertex(y+70, 120);
  vertex(y, 120);
  endShape(CLOSE);
  
  fill(0, 0, 99, 100);
  beginShape(TRIANGLES);
  vertex(y+20, 120);
  vertex(y+20, 60);
  vertex(y+35, 120);
  vertex(y+35, 120);
  vertex(y+50, 60);
  vertex(y+50, 120);
  endShape(CLOSE);
}

void draw_m_t(int y){
  fadeToWhite();
  
  Speed = Speed + Acc;
  X = X + 0.1 * Speed;
  noStroke();
  
  bounce(740);
  
  //M
  int d = day();
  int h = hour();
  int m = minute();
  fill(d * 10, h + 50, m + 95, 60);
  smooth();
  beginShape();
  curveVertex(X+y, 120);
  curveVertex(X+y, 120);
  curveVertex(X+y, 40);
  curveVertex(X+y+70, 40);
  curveVertex(X+y+70, 120);
  curveVertex(X+y+70, 120);
  vertex(X+y+70, 120);
  vertex(X+y, 120);
  endShape(CLOSE);
  
  fill(0, 0, 99, 60);
  beginShape(TRIANGLES);
  vertex(X+y+20, 120);
  vertex(X+y+20, 60);
  vertex(X+y+35, 120);
  vertex(X+y+35, 120);
  vertex(X+y+50, 60);
  vertex(X+y+50, 120);
  endShape(CLOSE);
}

void draw_o(int y){
  fadeToWhite();
  
  noStroke();
  
  //O
  int mo = month();
  int h = hour();
  int m = minute();
  fill(mo * 20, h + 60, m + 50, 30);
  smooth();
  beginShape();
  curveVertex(y, 40);
  curveVertex(y+70, 40);
  curveVertex(y+70, 110);
  curveVertex(y, 110);
  curveVertex(y, 40);
  curveVertex(y+70, 40);
  curveVertex(y+70, 110);
  endShape();
  
  fill(0, 0, 99, 100);
  smooth();
  beginShape();
  curveVertex(y+20, 60);
  curveVertex(y+50, 60);
  curveVertex(y+50, 90);
  curveVertex(y+20, 90);
  curveVertex(y+20, 60);
  curveVertex(y+50, 60);
  curveVertex(y+50, 90);
  endShape();
}

void draw_c(int y){
  fadeToWhite();
  
  noStroke();
  
  //C
  int mo = month();
  int h = hour();
  int m = minute();
  fill(mo * 10, h, m + 30, 60);
  smooth();
  beginShape();
  curveVertex(y, 40);
  curveVertex(y+70, 40);
  curveVertex(y+70, 110);
  curveVertex(y, 110);
  curveVertex(y, 40);
  curveVertex(y+70, 40);
  curveVertex(y+70, 110);
  endShape();
  
  fill(0, 0, 99, 100);
  smooth();
  beginShape();
  curveVertex(y+20, 60);
  curveVertex(y+50, 60);
  curveVertex(y+50, 90);
  curveVertex(y+20, 90);
  curveVertex(y+20, 60);
  curveVertex(y+50, 60);
  curveVertex(y+50, 90);
  endShape();
  
  fill(0, 0, 99, 100);
  rectMode(CENTER);
  rect(y+50, 75, 60, 20);
}

void draw_dot(int y){
  fadeToWhite();
  
  noStroke();
  
  //.
  int m = minute();
  fill(216, 40 + m, 95, 100);
  smooth();
  beginShape();
  curveVertex(y, 90);
  curveVertex(y+20, 90);
  curveVertex(y+20, 110);
  curveVertex(y, 110);
  curveVertex(y, 90);
  curveVertex(y+20, 90);
  curveVertex(y+20, 110);
  endShape();
}

void fadeToWhite(){
  noStroke();
  fill(359, 8);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

void bounce(int y){
  float bounceMinX = 0;
  float bounceMaxX = y - 7;
  
  if(X < bounceMinX || X > bounceMaxX){
    Speed = -Speed * FRICTION;
    if(X < bounceMinX)
      X = bounceMinX - (X - bounceMinX);
    if(X > bounceMaxX)
      X = bounceMaxX - (X - bounceMaxX);
  }
}

