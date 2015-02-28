
int x = 30;
PFont fontA;


void setup() {
  fontA=loadFont("BaskOldFace-42.vlw");
  textFont(fontA);
  size(600, 600);
}


void draw() {
  noStroke();
  colorMode(HSB, 600);
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < width; j++) { 

      stroke(i, j, 600);
      point(i, j);
    }
  }

  noStroke();
  for (int i=0;i <width;i+=20) {
    fill(random(100), 100, 100, 100);
    ellipse(i, i, 100, 100);
  }

  colorMode(RGB, 200);
  fill(299, 10, 200);
  text("Lauren", 100, 200);
  fill(255, 0, 0);
  text("David", 210, 300);
  fill(255, 255, 10);
  text("Stephanie", 300, 400);
}


