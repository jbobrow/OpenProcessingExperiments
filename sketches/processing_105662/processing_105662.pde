
float i=1;
float m=1;
void setup() {
  size(400, 400);
  background(255);
  rectMode(RADIUS);
  noStroke();
}


void draw() {
  if (mousePressed) {
    m=m-0.01;
  }
  else {
    m=m+0.01;
  }
  translate(mouseX, mouseY);
  rotate(0.3+i*0.1);
  scale(m);
  background(255);
  for (int j=0; j<3;j++) {
    fill(0,255/m,255/m,j*40+10);
    rect(0, 0, 100-j*20, 100-j*20);
  }
  i++;
}



