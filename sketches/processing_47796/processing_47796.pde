
float xa = -1.0;
float ya;
float xb = -1.0;
float yb;

int n = 170;

void setup() {
  size(400, 400);
  background(0);

  smooth();
}

void draw() {
  strokeWeight(10);

  ya = xa * sqrt(1 - sq(xa));
  yb = -1 * xb * sqrt(1 - sq(xb));

  stroke(255, 255, 0, 80);
  line(width/2, height/2, n*xa+width/2, 2*n*ya+height/2); 
  stroke(0, 255, 255, 80);
  line(width/2, height/2, n*xb+width/2, 2*n*yb+height/2); 

  xa += 0.01;
  xb += 0.01;

  if (mousePressed == true || xa > 1.3 || xb > 1.3) {
    background(0);
    xa = -1.0;
    xb = -1.0;
  }
}


