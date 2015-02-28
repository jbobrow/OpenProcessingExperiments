
PFont Miso;
PShape bar;
PImage side;
PImage grid;
int m;
int h;

void setup() {
  size(500, 700);
  smooth();
  
  }

void draw() {
  background(255);
  noStroke();
  
  m=minute();
  if (hour()>12) h = hour() - 12;
  else h=hour();

  Miso = loadFont("Miso.vlw");
  bar = loadShape("bar.svg");
  grid = loadImage("grid.png");
  side = loadImage("side.png");
  
  
  //image(grid,0,0);
  image(side,0,0);
  shape(bar,0,0);
  
  
  pushMatrix();
  float s = second();
  translate(180,520);
  float sMapped = map(s, 0, 60, 0, 360);
  rotate(radians(sMapped));
  fill(250,175,64,180);
  arc(0, 0, 180, 180,0, PI+HALF_PI);
  popMatrix();
  
  
  textFont(Miso,24);
  fill(255,0,0);
  text(h + "/" + nf(m,1),435,30);
  
  
  
}

