

int n, m; //количество граней
float a, b;
float incX, incY; //задание скорости вращения

void setup() {
  size(500, 500);
  background(#F53905);
  noStroke();
  smooth();
  
  n = 5; m = 3;
  a = 0; b = 0;
  incX = 0; incY =0;
}

void draw() {
  background(#F53905);

  fill(255);
  beginShape();
  for (int i=0; i<n; i++) {
    vertex(width/2+cos(PI*b+TWO_PI/n*i)*100, height/2+sin(PI*b+TWO_PI/n*i)*100);
  }
  endShape();

  fill(#F53905);
  beginShape(TRIANGLES);
  for (int i=0; i<m; i++) {
    vertex(width/2+cos(PI*a+TWO_PI/m*i)*80, height/2+sin(PI*a+TWO_PI/m*i)*80);
  }
  endShape();

  a += map(incX, 0, 1, -0.1, 0.1);
  b -= map(incY, 0, 1, -0.1, 0.1);
  incX = noise(b+40);
  incY = noise(a+10);
  
  
}


