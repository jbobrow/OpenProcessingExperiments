
color c;
float r;

void setup(){
  size(500,500);
  background(255);
  noStroke();
}

void draw(){
  c = color(random(255),random(255),random(255));
  fill(c,random(10,50));
  r= random(30,70);
  ellipse(random(width),random(height),r,r);
}

void mousePressed(){
  background(255);
}
