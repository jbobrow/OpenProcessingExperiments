
float r = 100;
float g = 80;
float b = 200;
float radX = 200;
float radY= 200;
float posX = 300;
float posY= 300;

void setup() {
  colorMode (RGB,600,600,600,100);
  size (600,600);
  background (500,3530,580,70);
  smooth();
}

void draw() {
  noStroke();
  fill (mouseX,60,mouseY,50);
  ellipse (posX,posY,radX,radX);
  posY = random(600);
  posX = random(600); 
  radX = random (30,80);
  
}

void mousePressed() {
 radX = radX * 1.3;
 radY = radY * 1.3;
}

void keyPressed() {
  radX = 50;
  radY = 50;
  background (mouseY ,mouseX,mouseY);
  fill (50,mouseY,mouseY);
}

