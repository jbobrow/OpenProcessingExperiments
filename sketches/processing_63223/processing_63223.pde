
void setup() {
  size(600, 250);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  noStroke();
}

float theta;
float updown;
int val = 8;
int col;

int angle = 360 / val;
int radius = 40;

void draw() {
  background(0);



  for (int j = 0;j < 6;j++) {
    ellipses(j);
  }
  theta += 2;
  updown += 0.025;
  col += 2;

  if (col > 360) {
    col = 0;
  }

  filter(BLUR, 1.5);
}


void ellipses(int j) {
  pushMatrix();
  fill(col, 100, 100);
  translate(j*120, height/2 + 70*sin(updown+j));
  ellipse(0, 0, 30, 30);
  for (int i = 0; i < val ; i++) {
    pushMatrix();
    rotate(radians(i*angle+theta));
    translate(radius, 0);

    ellipse(0, 0, 20, 20);
    popMatrix();
  }


  popMatrix();
}

