
int x=0;
int y=0;
int m =0;

void setup() {
  size(600, 600);
  noStroke();
  smooth();
  y=height/2;
}

void draw() {
  smooth();
  background(0, 0, 0);
  fill(204, 4, 4);
  triangle(x, y, 27, 14, 10, 39);
  x ++;
  translate(width/2, height/2);
  rotateX(PI/0.25);
  rotateY(PI/0.25);
  triangle(-x, -y, 27, 14, 10, 39);
  fill(116, 2, 2);
  triangle(x, y, 27, 14, 10, 39);
  x++;
  translate(width/2, height/2);
  rotateX(PI/0.5);
  rotateY(PI/0.5);
  triangle(-x, -y, 27, 14, 10, 39);
  fill(204, 3, 3);
  triangle(x, y, 27, 14, 10, 39);
  x ++;
  translate(width/2, height/2);
  rotateX(PI/0.5);
  rotateY(PI/0.5);
  triangle(-x, -y, 27, 14, 10, 39);
  triangle(x, y, 27, 14, 10, 39);
  x ++;
  translate(width/2, height/2);
  rotateX(PI/0.5);
  rotateY(PI/0.5);
  triangle(-x, -y, 27, 14, 10, 39);
  triangle(x, y, 27, 14, 10, 39);
  x ++;
  translate(width/2, height/2);
  rotateX(PI/0.5);
  rotateY(PI/0.5);
  triangle(-x, -y, 27, 14, 10, 39);
  triangle(x, y, 27, 14, 10, 39);
  x ++;
  translate(width/2, height/2);
  rotateX(PI/0.5);
  rotateY(PI/0.5);
  triangle(-x, -y, 27, 14, 10, 39);

  if (x==width) {
    m=m*(-1);
  }

  if (x>0) {
    m=m*(-1);
  }
}


