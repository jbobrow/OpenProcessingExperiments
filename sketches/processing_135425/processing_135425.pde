
void setup() {
  size(200,200);
  background(15,150,200);
  
  stroke(240,120,50);
  strokeWeight(15);
  smooth(5);
  line(0, height, width, 0);
  
  fill(15,150,200);
  println(width + ", " + height);
  rectMode(CORNERS);
  rect(width/4, height/4, 3*width/4, 3*height/4);
  
  
}


