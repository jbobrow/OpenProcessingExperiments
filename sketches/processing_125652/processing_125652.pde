
float theta, r, offset, t, angle, max;
float n=10;
void setup() {
  size(500, 500);
  //background(50, 40, 100, 100);
  background(232, 222, 129);
  theta=0; 
  r=5;
  offset=0;
  t=0;
  angle=0;
  max=0;
  strokeWeight(2);
  smooth();
  while (n>7) {
    n=map(noise(t), 0, 1, 0, 20);
    t+=0.01;
  }
}
void draw() {
  translate(width/2, height/2);
  float x=r*sin(theta);
  float y=r*cos(theta);
  float x2=r*sin(theta-0.01);
  float y2=r*cos(theta-0.01);
  stroke(34, 77, 36);
  fill(0);
  float off=0;
  if (keyPressed) {
    if (r<50) {
      max=20;
      n=map(noise(t), 0, 1, 1, max);
      if (n>7)
        offset=n-7;
      else offset=0;
    }
    else {
      max=30;
      n=map(noise(t), 0, 1, 1, max);
      if (n>10)
        offset=n-10;
      else offset=0;
    }
    t+=0.01;
  }
  else {
    if (offset>0) {
      if (r<50) {
        max=20;
        n=map(noise(t), 0, 1, 0, max);
        offset=n-7;
      }
      else {
        max=30;
        n=map(noise(t), 0, 1, 0, max);
        offset=n-10;
      }                         
      t+=0.01;
    }
  }
  line(x+offset, y+offset, x2+offset, y2+offset);
  r+=0.04;
  float avel=map(r, 0, 300, 0.02, 0.005);
  theta-=avel;
  float c=sin(angle);
  fill(240, 30, 10);
  textAlign(CENTER);                                                                            
  text("Pressure", width/2-30, -height/2+60);
  if (c>0) {
    stroke(255, 30, 10);
    fill(255, 50, 10);
  }
  else {
    stroke(130, 50, 10);
    fill(150, 50, 10);
  }
  ellipse(width/2-30, -height/2+30, 23, 23);
  angle+=0.05+pow(offset, 2)/200;
}
void mousePressed() {
  background(232, 222, 129);
  r=0;
}

