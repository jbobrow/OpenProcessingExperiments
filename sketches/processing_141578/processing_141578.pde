
float len, maxlen, ballrad, theta = 0, halfx, halfy;
int sz = 80, num = 16;
float hu1, hu2, hu3, hu4;
int ahi = 140, alow = 60;
int alph = alow;
int ballzlow = 480, ballzhi = 540;
int ballz = ballzlow;

void setup() {
  size(480, 480);
  halfx = width/2;
  halfy = width/2;
  maxlen = halfx;
  ballrad = sz/2;
  colorMode(HSB);
  strokeWeight(3);
  hu1 = 25;
  hu2 = 76;
  hu3 = 44;
  hu4 = 214;
}

void draw() {
  background(0, 0, 255);
  //  background(0, 0, abs(sin(radians(theta))* 150));
  len = (maxlen - ballrad) * sin(radians(theta));   // set maxlen-ballrad above 
  for (int i = 0; i < num; i++) {
    float temp = len*(i+1)/num;
    balls(ballz/num * i, temp); // originally 100 not 270, 360, 450, 480, 540
  }
  theta+=5;

  if (theta % 180 == 0) {        // could be combined with next (if theta)
    if (ballz == ballzlow) {
      ballz = ballzhi;
    } 
    else {
      ballz = ballzlow;
    }
  }

  if (theta % 180 == 0) {
    if (alph == alow) {
      alph = ahi;
    } 
    else {
      alph = alow;
    }
  }
//    if (frameCount%4 == 0) {
//      saveFrame("frames/####.gif");
//    }
}


void balls(float angle, float dist) {
  float inner1 = sz/8;
  float inner2 = sz/2;
  pushMatrix();
  stroke(0, 0, 0, 125);
  translate(halfx, halfy);
  rotate(radians(angle));
  fill(hu1, 255, 255, alph);  // fill 0,44,76,175
  ellipse(dist, 0, sz, sz);
  ellipse(dist, 0, inner1, inner1);
  ellipse(dist, 0, inner2, inner2);
  fill(hu2, 255, 255, alph);
  ellipse(0, dist, sz, sz);
  ellipse(0, dist, inner1, inner1);
  ellipse(0, dist, inner2, inner2);
  fill(hu3, 255, 255, alph);
  ellipse(-dist, 0, sz, sz);
  ellipse(-dist, 0, inner1, inner1);
  ellipse(-dist, 0, inner2, inner2);
  fill(hu4, 255, 255, alph);
  ellipse(0, -dist, sz, sz);
  ellipse(0, -dist, inner1, inner1);
  ellipse(0, -dist, inner2, inner2);
  popMatrix();
}

