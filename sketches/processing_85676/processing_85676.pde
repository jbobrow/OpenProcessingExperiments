
PImage alex;
int xpos = 0;
  
void setup(){
  size(750,500, P3D);
  background(0);
  alex = loadImage("alex.jpg");
  alex.resize(alex.width, alex.height);
}
  
void draw(){
  pushMatrix();
 
  int xp = int(random(width));
  int yp = int(random(height));
  color c = alex.get(xp,yp);
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


