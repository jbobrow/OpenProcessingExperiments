
float theta = 0;
float r1 = 0;
float sz1 = 30;
float r2 = 120;
float sz2 = sz1 * .75;
float r3 = r2*.715;
float sz3 = sz1 * .5;
float r4 = r2 *.423;
float sz4 = sz1 * .25;
float r5 = r2*.214;
float sz5 = sz1 * .25;
float r6 = sz1/2+5;
float sz6 = sz1 * .25;
int alph = 150;


void setup() {
  size(600, 600);
  colorMode(HSB);
  background(0, 0, 255);
}

void draw() {
  fill(0, 0, 255);
  rect(0, 0, width, height);
  //  background(0, 0, 0);


  translate(width/2, height/2);
  fill(0, 0, 255);

  //rotate(radians(theta));
  //translate(r1, 0);
  fill(175, 255, 255, alph);
  ellipse(0, 0, sz1, sz1);

  for (float x = 0; x < TWO_PI; x+=HALF_PI) {
    rotate(x);
    pushMatrix();
    rotate(radians(theta));
    translate(r2, 0);
    fill(76, 255, 255, alph);
    ellipse(0, 0, sz2, sz2);

    for (float y = 0; y < TWO_PI; y+=HALF_PI) {
      rotate(y);
      pushMatrix();
      rotate(radians(theta));
      translate(r3, 0);
      fill(25, 255, 255, alph);
      ellipse(0, 0, sz3, sz3);

      for (float z = 0; z < TWO_PI; z+=PI) {
        rotate(z);
        pushMatrix();
        rotate(radians(theta));
        translate(r4, 0);
        fill(153, 255, 255, alph);
        ellipse(0, 0, sz4, sz4);

        for (float k = 0; k < TWO_PI; k+=PI) {
          rotate(k);
          pushMatrix();
          rotate(radians(theta));
          translate(r5, 0);
          fill(124, 255, 255, alph);
          ellipse(0, 0, sz5, sz5);

          popMatrix();
        }
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }

  rotate(radians(theta*3));
  fill(214, 255, 255, alph);
  for (int q = 0; q < 6; q++) {
    ellipse(r6, r6, sz6, sz6);
    rotate(TWO_PI/6);
  }
//  if (frameCount % 5 == 0) {
//    saveFrame("frames/####.png");
//  }
  theta+=.5;
}

