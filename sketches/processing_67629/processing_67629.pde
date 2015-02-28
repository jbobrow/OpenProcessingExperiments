
PImage img; 

void setup () {
  size(256, 256);
  img = loadImage("IMG_6095.png");
  tint(255, 127);  
  image(img, 0, 0);
}

void draw() {
  rectMode(CENTER);
  stroke(#FFFFFF);
  strokeWeight(1);
  smooth();
  fill(random(256), random(256), random(256));
  rect(128, 128, 100, 100, 100, 100);
  fill(random(256), random(256), random(256));
  rect(0, 0, 50, 50, 50, 50);  
  fill(random(256), random(256), random(256));
  rect(255, 255, 50, 50, 50, 50);
  fill(random(256), random(256), random(256));
  rect(0, 255, 50, 50, 50, 50);  
  fill(random(256), random(256), random(256));
  rect(255, 0, 50, 50, 50, 50);
  image (img, 0, mouseY * +5);
}

void mouseClicked() {
  strokeWeight(3);
  stroke(0);
  smooth();
  fill(random(256), random(256), random(256));
  ellipse(mouseX, mouseY, 50, 50);
}

void mouseDragged() {
  noStroke();
  rect(mouseX, mouseY, 10, 10, 50, 50);
}


