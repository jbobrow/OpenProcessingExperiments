
int SIZE=400;

void setup(){
  size(SIZE,SIZE);
  colorMode(RGB,255);
  background(255,255,255);
  frameRate(30);
}

void draw(){
  noStroke();
  fill(255,255,255,30);
  rect(0,0,width,height);
  stroke((int)random(0,255),(int)random(0,255),(int)random(0,255),250);
  strokeWeight(random(5));
  line((int)random(0,SIZE),(int)random(0,SIZE),(int)random(0,SIZE),(int)random(0,SIZE));
}
