
void setup() {
  size(600, 600);
  background(255);
  noSmooth();
  triangle(0, 580, 600, 580, 300, 580 - sqrt(3)*300); 
  sierpinskiCarpet(300, height-20, 300); 
}


void sierpinskiCarpet(float x, float y, float size) { //size是等边三角形的边长，x和y是倒三角的下顶点
  float nextSize = size/2;
  // xp = x + size/2;  yp = y - sqrt(3)*size/2 
  stroke(0);
  fill(0);
  //triangle(x, y, x + size, y, x+size/2, y - sqrt(3)*size/2);
  triangle(x, y, x-size/2, y - sqrt(3)*size/2, x+ size/2, y-sqrt(3)*size/2); //先画一个倒三角

  if (nextSize > 7) {  //每次都会在原来的三角旁边生成3个倒三角
    sierpinskiCarpet(x + nextSize, y, nextSize);
    sierpinskiCarpet(x - nextSize, y, nextSize);
    sierpinskiCarpet(x, y-sqrt(3)*nextSize, nextSize);
  }
}
