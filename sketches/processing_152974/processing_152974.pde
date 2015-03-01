
  int x = 10;
  int framerate = 1;
  float alph = random(255);
  color randomcl = color(random(255));
  void setup(){
  size(500,500);
  background(255);
  smooth();
  }
  void draw(){
  frameRate(framerate++);
  float randomx = random(width);
  float randomy = random(height);
  noStroke();
  strokeWeight(0);
  color fillcol = color(random(255), random(255), random(255));
  fill(fillcol,alph);
  ellipse(randomx,randomy,20,20);
  fill(255);
  text("mizutama2",100,250);
  textSize(50);
  }


