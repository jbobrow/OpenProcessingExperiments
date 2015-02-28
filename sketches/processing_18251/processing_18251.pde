

float x, y;
float velx, vely;
float lim = 30;

void setup() {
  size(157, 192);
  smooth();
  x = lim;
  y = lim;
  velx = 10 / lim;
  vely = 30 / lim;
}

void draw() {
  noStroke();
  fill(0, 8);
  rect (0, 0, width, height);

  ellipseMode(CENTER);
  fill(255, 1);
  for ( int i = 0; i < 5; i++) {
    int m = int ( random ( 5, 10));
    stroke(255, 80);
    strokeWeight (m /((m-i) *i +1));
    ellipse(width/2, height/2, x - 2*m*i, y - m*i);
    m += 2*m;
  }

  if (x > width-10 || x < lim) velx *= (-1);
  if (y > height-5 || y < lim) vely *= (-1);

  x += 1*velx;
  y -= 1*vely;
}


