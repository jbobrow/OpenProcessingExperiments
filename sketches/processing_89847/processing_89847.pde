
float t, P0x, P0y, P1x, P1y, P2x, P2y, P3x, P3y;  
PVector xy, lxy;
float segs;

void setup() {
  size (400, 400);
  smooth();

  t = 0;

  P0x = random(width);
  P0y = random(height);

  P1x = random(width);
  P1y = random(height);

  P2x = random(width);
  P2y = random(height);

  P3x = random(width);
  P3y = random(height);
}

void draw() {
  //background(230);

  strokeWeight(1);
  fill(0, 10);
  rect(0, 0, width, height);

  pushStyle();
  stroke(100, 100, 255, 25);
  fill(100, 100, 255, 25);

  line(P0x, P0y, P1x, P1y);
  ellipse(P0x, P0y, 5, 5);
  ellipse(P1x, P1y, 5, 5);
  line(P2x, P2y, P3x, P3y);
  ellipse(P2x, P2y, 5, 5);
  ellipse(P3x, P3y, 5, 5);
  stroke(100, 255, 100, 25);
  line(P1x, P1y, P2x, P2y);
  popStyle();
  

  segs = 100;

  if (t<=segs) {   

    for (float i=0; i<=segs; i++) {
      xy = Catmull(i/segs, P0x, P0y, P1x, P1y, P2x, P2y, P3x, P3y);
      lxy = Catmull((i-1)/segs, P0x, P0y, P1x, P1y, P2x, P2y, P3x, P3y);

      pushStyle();
      stroke(255, 0, 0, 7);   
      line(lxy.x, lxy.y, xy.x, xy.y);
      popStyle();
    }

    xy = Catmull(t/segs, P0x, P0y, P1x, P1y, P2x, P2y, P3x, P3y);
    lxy = Catmull((t-1)/segs, P0x, P0y, P1x, P1y, P2x, P2y, P3x, P3y);


    pushStyle();
    colorMode(HSB, segs, 100, 100);
    stroke(t, 100, 100);
    fill(t, 100, 100);

    strokeWeight(10);
    line(lxy.x, lxy.y, xy.x, xy.y);
    strokeWeight(1);
    noStroke();
    ellipse(xy.x, xy.y, 10, 10);
    popStyle();


    fill(0);
    stroke(155);
    rectMode(CORNERS);
    rect(width-80, height-30, width, height);
    fill(255);
    text("t = " + t/segs, width-60, height-16);

    for (float i=width-80;i<=map(t/segs, 0, 1, width-80, width); i++ ) {
      pushStyle();
      colorMode(HSB, 80, 100, 100);
      stroke(80-(width-i), 100, 100);
      line (i, height-10, i, height);
      popStyle();
    }
    
    t++;
  }
  else {
    t=0;

    P0x = P1x;
    P0y = P1y;

    P1x = P2x;
    P1y = P2y;

    P2x = P3x;
    P2y = P3y;

    P3x = random(20, width-20);
    P3y = random(20, height-20);
  }
}


PVector Catmull (float _t, float _P0x, float _P0y, float _P1x, float _P1y, float _P2x, float _P2y, float _P3x, float _P3y) {
  float _x = 0.5 * ((2*_P1x) + (-_P0x + _P2x)*_t + (2*_P0x - 5*_P1x + 4*_P2x -_P3x) * pow(_t, 2) + (-_P0x + 3*_P1x - 3*_P2x + _P3x) * pow(_t, 3));
  float _y = 0.5 * ((2*_P1y) + (-_P0y + _P2y)*_t + (2*_P0y - 5*_P1y + 4*_P2y -_P3y) * pow(_t, 2) + (-_P0y + 3*_P1y - 3*_P2y + _P3y) * pow(_t, 3));
  //float _z = 0.5 * ((2*_P1z) + (-_P0z + _P2z)*_t + (2*_P0z - 5*_P1z + 4*_P2z -_P3z) * pow(_t, 2) + (-_P0z + 3*_P1z - 3*_P2z + _P3z) * pow(_t, 3));

  return new PVector (_x, _y);
}
