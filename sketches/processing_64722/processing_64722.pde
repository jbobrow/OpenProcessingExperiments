

int r = 50;
int num_x;
int num_y;


void setup() {
  size(200, 450);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  num_x = width/r;
  num_y = height /r;
}

float theta;
float w;

void draw() {
  background(360);

  for (int j = 0;j <= num_x;j++) {
    for (int i = 1; i<=num_y ; i++) {
      w = abs(sin(theta+i+j));
      fill(r*w, 80, 100);
      ellipse(50*j, i*r-r/2, r*w, r);
    }
  }
  theta += 0.025;
  if (theta > TWO_PI) {
    theta = 0;
  }
}


