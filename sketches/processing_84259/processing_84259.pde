
void setup() {

  smooth();

  size(300, 300);

}



void draw() {

  background(0);

  int ox = width / 2;

  int oy = height / 2;

  stroke(100); fill(100); strokeWeight(1);

  line(0, oy, width, oy);

  line(ox, 0, ox, height);    



  for (int i = 0; i < 60; i++) {    

    float xx = 90 * cos(radians(90/15.0 * i));

    float yy = 90 * sin(radians(90/15.0 * i));

    int sz = i % 5 == 0 ? 7 : 1;

    ellipse(ox + xx, oy - yy, sz, sz);

  }

  

  int h = hour();

  int m = minute();

  int s = second();

  

  stroke(255);

  // 秒

  int slen = 100;

  noFill();

  ellipse(ox, oy, slen*2, slen*2);

  float sdeg = 90 - s * 6.0;

  float sx = slen * cos(radians(sdeg));

  float sy = slen * sin(radians(sdeg));

  line(ox, oy, ox + sx, oy - sy);

  

  // 分

  int mlen = 80;

  float mdeg = (90 - m * 6.0) - 6.0*s/60.0;

  float mx = mlen * cos(radians(mdeg));

  float my = mlen * sin(radians(mdeg));

  strokeWeight(3);

  line(ox, oy, ox + mx, oy - my);

  

  // 時

  int hlen = 60;

  float hdeg = (90 - h * 30) - 30.0*m/60.0;

  float hx = hlen * cos(radians(hdeg));

  float hy = hlen * sin(radians(hdeg));

  strokeWeight(5);

  line(ox, oy, ox + hx, oy - hy);

  

  fill(255);

  text(h+":"+m+":"+s, 20, 20);

}
