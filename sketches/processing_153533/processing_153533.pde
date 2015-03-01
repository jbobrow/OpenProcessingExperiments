
float sz = 100;
float sizeNegative = sz * -1;
float sizeHalf = sz * .5;
float sizeHalfNegative = sizeHalf * -1;
float sizeThird = sz * .3;
float rec = 0;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  noFill();
  stroke(255);
  strokeWeight(10.0);

  strokeCap(ROUND);
  strokeJoin(ROUND);
  frameRate(7);
}

void draw() {
  background(255);

  for (float x = sz * .5; x < width; x += sz) {
    for (float y = sz * .5; y < height; y += sz) {
      fill(random(255), random(255), 0);
      pushMatrix();
      translate(x, y);
      drawShape();
      popMatrix();
    }
  }
}

void drawShape() {
  //float v = random(1.2);
  rec += .005;
  float v = noise(rec) * 1.4 + noise(rec * 100) * .2 - .2;

  if (v < .1) {
    rect(0, 0, sz, sz);
  } else  if (v < .4) {
    ellipse(0, 0, sz, sz);
    fill(255);
    ellipse(0, 0, sizeHalf, sizeHalf);
  } else  if (v < .5) {
    beginShape();
    vertex(sizeHalfNegative, sizeHalfNegative);
    vertex(sizeHalf, sizeHalfNegative);
    vertex(sizeHalf, sizeHalf);
    vertex(sizeHalfNegative, sizeHalfNegative);
    endShape();
  } else if (v < .6) {
    beginShape();
    vertex(sizeHalf, sizeHalfNegative);
    vertex(sizeHalf, sizeHalf);
    vertex(sizeHalfNegative, sizeHalf);
    vertex(sizeHalf, sizeHalfNegative);
    endShape();
  } else if (v < .7) {
    beginShape();

    vertex(sizeHalf, sizeHalf);
    vertex(sizeHalfNegative, sizeHalf);
    vertex(sizeHalfNegative, sizeHalfNegative);
    vertex(sizeHalf, sizeHalf);
    endShape();
  } else if (v < .8) {
    beginShape();
    vertex(sizeHalfNegative, sizeHalf);
    vertex(sizeHalfNegative, sizeHalfNegative);
    vertex(sizeHalf, sizeHalfNegative);
    vertex(sizeHalfNegative, sizeHalf);

    endShape();
  } else if (v < .9) {

    ellipse(0, sizeThird * -0.5, sizeThird, sizeThird);
    ellipse(0, sizeThird * 0.5, sizeThird, sizeThird);
  } else {
    ellipse(sizeThird * -0.5, 0, sizeThird, sizeThird);
    ellipse(sizeThird * 0.5, 0, sizeThird, sizeThird);
  }
  
}

