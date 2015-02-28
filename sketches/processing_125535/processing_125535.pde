
PImage snakes;
int xJit = 0;
int yJit = 0;

void setup(){
  size(800,800);
  background(#FFFFFF);
  snakes = loadImage("rotsnakesbig.png");
}

void draw(){
  background(#FFFFFF);
  image(snakes,-xJit,-yJit);
  stroke(#FFFFFF);
  fill(#FFFFFF);
  ellipse(385,410,10,10);
  stroke(#FF0000);
  strokeWeight(4);
  line(390,410,380,410);
  line(385,405,385,415);
}

void mousePressed(){
  xJit = floor(random(24));
  yJit = floor(random(24));
}



