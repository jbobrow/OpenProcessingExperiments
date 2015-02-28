
float s = 0;
float t = 0;
float a = 0;
float r = 0;
 
float diam;
float x;
float y;

void setup(){
 size(500,500);
 background(255);
}

void draw(){
  diam = random(20);
  x = random(width);
  y = random(height);
  noStroke();
  fill(s,t,a,r);
  ellipse(x,y,diam,diam);
}

void mousePressed(){
  s = random(0, 255);
  t = random(0, 255);
  a = random(0, 255);
  r = random(0, 255);
  fill(s, t, a, r);
  translate(mouseX, mouseY);

//Star Shape
  strokeWeight(2);
  stroke(s,t,a,r);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
}



