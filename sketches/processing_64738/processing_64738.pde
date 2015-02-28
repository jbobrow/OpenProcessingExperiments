
int N = 150;

color p = color(245, 116, 255);
color b = color(48, 133, 206);

float r;
float r_x = random(width);
float r_y = random(height);

float alp = 255;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  strokeJoin(ROUND);
}

void draw() {
  fill(255, 130);
  noStroke();
  rect(0, 0, width, height);

  flower(width/2-70, height/2-50, p);
  flower(width/2+70, height-100, b);

  rain();
}

void ajisai(float x, float y, float s, color c) {
  stroke(360);
  fill(c);

  pushMatrix();
  translate(x, y-(38+15));

  for (int i = 0;i < 2;i++) {
    for (int j = 0; j < 2;j++) {  
      pushMatrix();
      rotate(radians(45));

      rect(45*i*s, 45*j*s, 38*s, 38*s);
      popMatrix();
    }
  }
  noStroke();
  fill(255, 255, 0);
  ellipse(0, 60*s, 15*s, 15*s);
  popMatrix();
}

void flower(float x, float y, color c) {
  pushMatrix();
  translate(x, y);

  for (int j = 2;j>=1;j--) {
    for (int i = 0;i<8*j;i++) {
      fill(296, 50, 100);
      ajisai(45*j*sin(radians(360 * i /(8*j))), 45*j*cos(radians(360 * i /(8*j))), 0.5, c);
    }
  }
  ajisai(0, 0, 0.5, c);
  popMatrix();
}


void rain() {
  noFill();
  strokeWeight(5);
  stroke(201, 254, 255, alp);
  ellipse(r_x, r_y, r, r);
  r+=5;
  alp-=5;

  if (alp < 0) {
    alp = 255;
    r = 0;
    r_x = random(width);
    r_y = random(height);
  }
}

