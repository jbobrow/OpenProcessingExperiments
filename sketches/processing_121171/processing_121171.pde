
PImage a;
PGraphics pg;
PFont font;

void setup() {
  size(512, 512);
  smooth();
  pg=createGraphics(4096, 4096);
  a=loadImage("Earth-November.jpg");
  font=loadFont("ArialRoundedMTBold-255.vlw");
  noLoop();
}

void draw() {
  pg.beginDraw();
  pg.textFont(font, 255*pg.width/4096);
  pg.textAlign(CENTER, CENTER);
  pg.stroke(255);
  pg.strokeWeight(16*pg.width/4096);
  pg.fill(255);
  pg.image(a, 0, 0, pg.width, pg.height);
  for(int i=0; i<12; i++) {
    float x=pg.width/2 + (pg.width/2-pg.width/24)*cos(PI*i/6-PI/3);
    float y=pg.height/2 + (pg.height/2-pg.height/24)*sin(PI*i/6-PI/3);
    float x1=pg.width/2 + (pg.width/2-pg.width/48)*cos(PI*i/6-PI/3);
    float y1=pg.height/2 + (pg.height/2-pg.height/48)*sin(PI*i/6-PI/3);
    float x2=pg.width/2 + (pg.width/2-pg.width/12)*cos(PI*i/6-PI/3);
    float y2=pg.height/2 + (pg.height/2-pg.height/12)*sin(PI*i/6-PI/3);
    pg.line(x, y, x1, y1);
    pg.text(i+1, x2, y2);
    pg.ellipse(pg.width/2, pg.height/2, pg.width/48, pg.height/48);   
  }
  pg.endDraw();
  image(pg, 0, 0, width, height);
  pg.save("clock_face.png");
}
