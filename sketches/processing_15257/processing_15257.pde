
PImage stem;
PImage coral;
PImage pod;




void setup() {
  background(0);
  size(500,500);
  stem=loadImage("stem.jpg");
  coral=loadImage("coral.jpg");
  pod=loadImage("pod.jpg");
}

void draw() {
  background(255,255,255);
  tint(255,255,255,255);
  image(pod,0,0);
  tint(255,255,255,120);
  image(stem,0,0);
  tint(255,255,255,80);
  image(coral,0,0);
}


