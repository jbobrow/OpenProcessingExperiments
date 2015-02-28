

PGraphics t;
PGraphics d;

void setup() {
  size(200, 200);
  t = createGraphics(width, height, JAVA2D);
  d = createGraphics(width, height, JAVA2D);

  smooth();
  noStroke();
  noLoop();
  float xnoise = 0.0;
  float ynoise = 0.0;
  float inc = 0.01;

  float k = random(70, 100); //left point y value
  float k2 = random(70, 100); //right point y value
  float b = random(50, 90); //top point x value
  float b2=random(60, 110); //bottom point x value
  float p = random(10, 30); // top side vertex and curve y value
  float q = random(140, 190); // right side vertex and curve x value
  float r = random(120, 170); //bottom side vertex and curve y value
  float s = random(5, 40); //left side vertex and curve x value
  t.beginDraw();
  t.colorMode(HSB, 360, 100, 100);
for (int y = 0; y<height;y++) {
  for (int x=0;x<width;x++) {
  float col = map(noise(xnoise, ynoise), 0, 1, 200, 285);
       float bright = map(noise(xnoise*.5, ynoise*.5),0,1,50,85);
       float sat = map(noise(xnoise*.125, ynoise*.125),0,1,50,85);
  t.stroke(col,sat,bright);
      t.point(x, y);
      xnoise = xnoise + inc;
    }
  xnoise = 0;
    ynoise = ynoise+inc;
  }
  t.endDraw();
  t.beginDraw();
  t.noStroke();
  t.smooth();
  t.fill(#688DBF,80);
  t.beginShape();
  t.vertex(b, p);
  t. bezierVertex(120, p, q, 30, q, k);
  t.vertex(q, k);
  t.bezierVertex(q, 125, 140, r, b2, r);
  t.vertex(b2, r);
  t.bezierVertex(71, r, s, 115, s, k2);
  t.vertex(s, k2);
  t. bezierVertex(s, 37, 41, p, b, p);
  t.endShape();
  t.endDraw();
 
  t.filter(BLUR,4);
   d.beginDraw();
  d.noStroke();
  d.smooth();
d.fill(#FF0000,50);
  d.beginShape();
  d.vertex(b, p);
  d. bezierVertex(120, p, q, 30, q, k);
  d.vertex(q, k);
  d.bezierVertex(q, 125, 140, r, b2, r);
  d.vertex(b2, r);
  d.bezierVertex(71, r, s, 115, s, k2);
  d.vertex(s, k2);
  d. bezierVertex(s, 37, 41, p, b, p);
  d.endShape();
  d.endDraw();
  d.filter(BLUR,8);
}
void draw() {


    image(t, 0, 0);
     blend(d,0,0,width,height,10,10,width-20,height-20,ADD);
//filter(BLUR,1);
}



