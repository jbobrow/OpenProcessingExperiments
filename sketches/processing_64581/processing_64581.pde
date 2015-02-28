
PImage[] sign = new PImage[12];

float theta;
int j;
color[] c = {
  color(255), color(232, 248, 255), color(255, 155, 118)
};

void setup() {
  size(250, 250);
  background(0);
  smooth();

  frameRate(10);

  for (int i= 0; i < 12;i++) {
    sign[i] = loadImage("sign" + nf(i, 2) + ".png");
  }
  imageMode(CENTER);
}

void draw() {
  noStroke();
  fill(0, 40);
  rect(0, 0, width, height);

  for (int i = 0; i < 3;i++) {
    stars(c[i]);
  }

  tint(255, 30*abs(sin(theta)));
  image(sign[j], width/2, height/2-20);

  theta+=0.075;
  if (theta > 2) {
    theta = 0;
    j++;
    if (j > 11) {
      j = 0;
    }
  }
}

void stars(color c) {
  stroke(c);
  strokeWeight(2);
  point(random(width), random(height));
}

