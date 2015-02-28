
int xpos = 0;
boolean record;
float x, y;
color c;
 
void setup(){
  size(750,500);
  background(0);
}

void draw(){
  pushMatrix();
  int xp = int(noise(width));
  int yp = int(noise(height));
  c= color (noise(0,255), random(0,255), random(0,255));
  fill(c,80);
  noStroke();

  pushMatrix();
  translate(xp, yp);
  frameRate(50.0);
  rectMode(CENTER);
  x = map(noise (frameCount/100.0), 0, 1,0, width);
  y = map(noise (frameCount/100.0), 1, 0, 1, height);
  
  if(mousePressed){
    stroke(c, 80);
    noFill();
    line(mouseX, mouseY, y/1, x/2);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  
  popMatrix();
  popMatrix();
}


