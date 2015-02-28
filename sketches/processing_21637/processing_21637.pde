
float r;
float g;
float b;
float a;

void setup(){
  size(400,400);
  background(255);
}

void draw(){
  strokeWeight(random(10));
  stroke(0);
  line(pmouseX,pmouseY,mouseX,mouseY);
}

void mousePressed(){
  stroke(0);
  fill(0,255,255);
  rectMode(CENTER);
  rect(mouseX,mouseY,40,70);
}

void keyPressed(){
  stroke(0);
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,20,20);
}

