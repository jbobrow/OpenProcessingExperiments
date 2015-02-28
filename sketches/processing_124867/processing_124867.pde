
PImage Higuchi;

void setup() {
  size(1026,254);
  smooth();
  Higuchi = loadImage("Higuchi_clock.png");
}

void draw(){  
  image(Higuchi,0,0);
  float minuteMap = map(minute(), 0 , 59, 0, width);
  rect(minuteMap, 15, 1026, 220);
  fill(255, 243, 131);{
  noStroke();
  float secondMap = map(second(), 0, 59, 0, width);
  rect(secondMap, 208, 1026, 12);
  fill(255);
  }
}


