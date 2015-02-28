

void setup() {
  
  size(200,300);
  background(102);
  smooth();
  stroke(0);
  
}

void draw() {
  
  rectMode(CORNERS);
  
  fill(0);
  rect(80,40,120,80);
  rect(70,90,130,160);
  rect(50,100,70,120);
  rect(130,100,150,120);
  rect(140,120,150,140);
  rect(50,120,60,140);
  rect(150,100,170,110);
  rect(30,100,50,110);
  rect(160,110,170,150);
  rect(30,110,40,150);
  rect(150,110,160,120);
  rect(40,110,50,120);
  triangle(70,160,100,240,130,160);
  smooth();
  fill(mouseX,0,mouseY);
  ellipseMode(CENTER);
  triangle(90,150,100,190,110,150);
  noStroke();
  rect(90,50,110,70);
  rect(90,100,110,150);
  
  
  
  
}

