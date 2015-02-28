
float theta = 0;
float r1 = 100;
float sz1 = 30;
float r2 = 100;
float sz2 = 18;
float r3 = 40;
float sz3 = 12;
float r4 = 20;
float sz4 = 6;


void setup() {
  size(600, 600);
  colorMode(HSB);
  background(0,0,0);
}

void draw() {
    fill(0, 0, 0, 180);
    rect(0, 0, width, height);
//  background(0, 0, 0);


  translate(width/2, height/2);
  fill(0, 0, 255);

  rotate(radians(theta));
  translate(r1, 0);
  fill(175, 255, 255);
  ellipse(0, 0, sz1, sz1);

  for (float x = 0; x <= TWO_PI; x+=HALF_PI) {
    rotate(x);
    pushMatrix();
    rotate(radians(theta*1.1));
    translate(r2, 0);
    fill(76, 255, 255);
    ellipse(0, 0, sz2, sz2);

    for (float y = 0; y <= TWO_PI; y+=HALF_PI) {
      rotate(y);
      pushMatrix();
      rotate(radians(theta*1.2));
      translate(r3, 0);
      fill(25, 255, 255);
      ellipse(0, 0, sz3, sz3);

      for (float z = 0; z <= TWO_PI; z+=PI) {
        rotate(z);
        pushMatrix();
        rotate(radians(theta*1.3));
        translate(r4, 0);
        fill(124, 255, 255);
        ellipse(0, 0, sz4, sz4);

        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }

  rotate(radians(theta*3));
  fill(0, 255, 255);
  ellipse(sz1/2+5, sz1/2+5, 5, 5);
  rotate(TWO_PI/3);
  ellipse(sz1/2+5, sz1/2+5, 5, 5);
  rotate(TWO_PI/3);
  ellipse(sz1/2+5, sz1/2+5, 5, 5);

  theta+=1;
}

