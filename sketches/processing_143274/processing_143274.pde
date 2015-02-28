
int wsize = 600;
float theta = 0;
int numstars = 300;
float r1 = wsize * .1333;
float sz1 = r1/2;
float r2 = wsize * .1667;
float sz2 = wsize * .0417;
float r3 = r2*.62;
float sz3 = sz2 * .6;
float r4 = r2*.34;
float sz4 = sz2 * .32;
float r5 = r2*.14;
float sz5 = sz2 * .15;
float[] starx = new float[numstars];
float[] stary = new float[numstars];
float[] starc = new float[numstars];
boolean starz = false;


void setup() {
  size(wsize, wsize);
  colorMode(HSB);
  background(0, 0, 0);
  noStroke();
  strokeWeight(1);
  for (int i = 0; i < numstars; i++) {
    starx[i] = random(width);
    stary[i] = random(height);
    starc[i] = random(255);
  }
}

void draw() {
  background(0, 0, 0);
  if (starz) {
    for (int i = 0; i < numstars; i++) {
      //stroke(starc[i], random(150,200), random(150,200));
      stroke(starc[i], 150, 150);
      point(starx[i], stary[i]);
    }
  }
  noStroke();
  translate(width/2, height/2);

  rotate(radians(theta));
  translate(r1, 0);
  fill(175, 255, 255);
  ellipse(0, 0, sz1, sz1);

  for (float x = 0; x <= TWO_PI; x+=PI) {  // change the final PI to TWO_PI to have only one set of orbiters
    rotate(x);
    pushMatrix();
    rotate(radians(theta));  // *1.1
    translate(r2, 0);
    fill(76, 255, 255);
    ellipse(0, 0, sz2, sz2);

    for (float y = 0; y <= TWO_PI; y+=TWO_PI) {
      rotate(y);
      pushMatrix();
      rotate(radians(theta*2));  // *1.2
      translate(r3, 0);
      fill(25, 255, 255);
      ellipse(0, 0, sz3, sz3);

      for (float z = 0; z <= TWO_PI; z+=TWO_PI) {
        rotate(z);
        pushMatrix();
        rotate(radians(theta*2));  // *1.3
        translate(r4, 0);
        fill(0, 255, 255);
        ellipse(0, 0, sz4, sz4);

        for (float q = 0; q <= TWO_PI; q+=TWO_PI) {
          rotate(q);
          pushMatrix();
          rotate(radians(theta*2));  //
          translate(r5, 0);
          fill(214, 255, 255);
          ellipse(0, 0, sz5, sz5);

          popMatrix();
        }
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }

  theta+=1;
}

void keyPressed() {
  if (key == 's') {
    starz = !starz;
  }
}

