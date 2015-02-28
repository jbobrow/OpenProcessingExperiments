
PImage joker;
int xpos = 0;
  
void setup(){
  size(750,500, P3D);
  background(0);
  joker = loadImage("joker.jpg");
  joker.resize(joker.width, joker.height);
}
  
void draw(){
  pushMatrix();
 
  int xp = int(random(width));
  int yp = int(random(height));
  color c = joker.get(xp,yp);
  fill(c,80);
  stroke(0);
 
  pushMatrix();
  translate(xp,yp);
  frameRate(200.0);
  rectMode(CENTER);
  box(random(xp/8),random(yp/8),random(xp/8));
  popMatrix();
 
  popMatrix();
}


