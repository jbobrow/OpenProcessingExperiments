
PImage fany;
int xpos = 0;
 
void setup(){
  size(750,500, P3D);
  background(0);
  fany = loadImage("fany1.jpg");
  fany.resize(fany.width, fany.height);
}
 
void draw(){
  pushMatrix();

  int xp = int(random(width));
  int yp = int(random(height));
  color c = fany.get(xp,yp);
  fill(c,80);
  noStroke();

  pushMatrix();
  translate(xp,yp);
  frameRate(30.0);
  rectMode(CENTER);
  box(random(xp/8),random(yp/8),random(xp/8));
  popMatrix();

  popMatrix();
}

