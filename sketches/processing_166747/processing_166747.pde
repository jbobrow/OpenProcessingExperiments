

void setup(){
size (500, 500);
colorMode(HSB, 360, 256, 256);
background(0);
noStroke();
smooth();
rectMode(CENTER);
}

void draw(){
for (int i = 0; i < 720; i++) {
  pushMatrix();
  translate(random(width), random(height));
  rotate(random(PI/2));
  scale(random(0.5, 5));
  fill(random(0, 90), 255/(frameCount*0.001), 255, 10);
  rect(0, 0, 10, 10);
  popMatrix();
}
}



