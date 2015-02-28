
PGraphics pg;

void setup() {
  size(400,400);
  smooth();
  background(0);
  pg = createGraphics(round(random(10,100)),round(random(10,100)));
  pg.beginDraw();
  pg.noFill();
  pg.stroke(255);
  pg.strokeWeight(1);
  pg.ellipseMode(CENTER);
  for(int i=0;i<10;i++) {
    pg.ellipse(random(pg.width),random(pg.height),random(10,40),random(10,40));
  }
  pg.endDraw();
}

void draw() {
  noStroke();
  fill(0,random(10,100));
  rectMode(CORNERS);
  rect(0,0,width,height);
  image(pg,random(-5,0),random(-5,0),random(405,420),random(405,420));
  if((frameCount%100)==0) {setup();}
}


