
float r;
float g;
float b;
float a;

void setup(){
  size(400,400);
  background(255);
}

void draw(){
  r = random (255);
  g = random (255);
  b = random (255);
  a = random (255);
  
  strokeWeight(random(10));
  stroke(r,g,b,a);
  line(pmouseX,pmouseY,mouseX,mouseY);
}

void mousePressed(){
  stroke(0);
  fill(r,g,b,a);
  rectMode(CENTER);
  rect(mouseX,mouseY,40,70);
}

void keyPressed(){
  stroke(0);
  fill(r,g,b,a);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,20,20);
}

