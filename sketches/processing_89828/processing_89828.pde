
float x, y;
float t;
float P0x, P0y;
float P1x, P1y; 
float P2x, P2y;
float P3x, P3y;
float segs;

void setup() {
  size(400, 400);
  smooth();
  t=0;
  P0x=20;
  P0y=15;
  P1x=80;
  P1y=300;
  P2x=380;
  P2y=380;
  P3x=200;
  P3y=50;
  //noLoop();
  noFill();

  //smooth();
  background(244);
}
void draw() {
  //background(250);

  strokeWeight(1);
  fill(0, 10);
  rect(0, 0, width, height);

  pushStyle();
  stroke(100, 100, 255, 25);
  fill(255, 255, 255, 25);

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

  for (int i=0; i<=segs; i++) {
    PVector c_xy =  BezierPoint(i/segs, P0x, P0y, P1x, P1y, P2x, P2y, P3x, P3y);
    PVector p_xy =  BezierPoint((i-1)/segs, P0x, P0y, P1x, P1y, P2x, P2y, P3x, P3y);

    //if (i==0) c_xy = p_xy.get();

    pushStyle();
    strokeWeight(1);
    stroke(255, 50, 50, 12);
    line (p_xy.x, p_xy.y, c_xy.x, c_xy.y);
    popStyle();
  }

  if (t<=segs) {
    PVector xy  =  BezierPoint(t/segs, P0x, P0y, P1x, P1y, P2x, P2y, P3x, P3y);
    PVector lxy =  BezierPoint((t-1)/segs, P0x, P0y, P1x, P1y, P2x, P2y, P3x, P3y);
    pushStyle();
    colorMode(HSB, segs, 100, 100);
    stroke(segs-t, 100, 100);
    strokeWeight(10);
    line(lxy.x, lxy.y, xy.x, xy.y);

    noStroke();
    fill(t, 100, 100);
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
      stroke(width-i, 100, 100);
      line (i, height-10, i, height);
      popStyle();
    }

    t++;
  } 
  else {
    t=0;
    P0x=P3x;
    P0y=P3y;
    P1x=P2x;
    P1y=P2y;
    P2x=(random(width));
    P2y=(random(height));
    P3x=(random(width));
    P3y=(random(height));
  }
}
PVector BezierPoint(float _t, float _P0x, float _P0y, float _P1x, float _P1y, float _P2x, float _P2y, float _P3x, float _P3y) {
  float oMinT = (1 - _t); 
  x = pow(oMinT, 3) * _P0x   +   3 * pow(oMinT, 2) * _t * _P1x   +   3 * oMinT * pow(_t, 2) * _P2x   +   pow(_t, 3) * _P3x;
  y = pow(oMinT, 3) * _P0y   +   3 * pow(oMinT, 2) * _t * _P1y   +   3 * oMinT * pow(_t, 2) * _P2y   +   pow(_t, 3) * _P3y;
  return new PVector(x, y);
}
