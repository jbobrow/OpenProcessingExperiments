
float theta=0;
PGraphics R;
PGraphics G;
PGraphics B;
color red=#FF0000;
color green=#00FF00;
color blue=#0000FF;

void setup() {
  size(700, 700, JAVA2D);
  background(0);
  R=off();
  G=off();
  B=off();
}

PGraphics off() {
  PGraphics pg=createGraphics(width, height, JAVA2D);
  pg.smooth();
  return pg;
}

void render(PGraphics pg, color c, float cx, float cy, float r) {
  pg.beginDraw();

  pg.background(0);
  float str=map(r, 0, 1000, 6, 18);
  pg.strokeWeight(str);
  pg.stroke(c);
  pg.noFill();
  pg.pushMatrix();
  pg.translate(width/2, height/2);
  pg.ellipse(cx, cy, r, r);
  pg.popMatrix();
  pg.endDraw();
}

void draw() {

  theta+=0.18;

  for (int j=25; j<1000; j+=51) {
    int r=9;
    float x1=sin(theta-PI/4-j)*r;
    float y1=cos(theta-PI/4-j)*r;
    float x2=sin(theta-PI/6-j)*r;
    float y2=cos(theta-PI/6-j)*r;
    float x3=sin(theta-PI/8-j)*r;  
    float y3=cos(theta-PI/8-j)*r;

    render(R, red, x1, y1, j);
    render(G, green, x2, y2, j);
    render(B, blue, x3, y3, j);


    blend(B, 0, 0, width, height, 0, 0, width, height, ADD);
    blend(R, 0, 0, width, height, 0, 0, width, height, ADD);
    blend(G, 0, 0, width, height, 0, 0, width, height, ADD);
  }
}



