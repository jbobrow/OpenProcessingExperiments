
  int x = 10;
  int framerate = 1;
  float alph = random(255);
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
  fill(82,199,240,alph);
  ellipse(randomx,randomy,20,20);
  fill(255);
  text("mizutama",250,250);
  textSize(30);
  }
  


  


