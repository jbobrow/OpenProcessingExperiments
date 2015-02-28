
float r = 0;

void setup() {
  size(400,400);
  background(10);
  smooth();
  //noStroke();
  stroke(255);
  strokeWeight(2);
  colorMode(HSB,100);
  frameRate(20);
}
void draw() {
  fill(0,10);
  rect(0,0,width, height);
  translate(width/2, height/2);
  //fill(noise(r/3)*100,80,80);
  fill(random(100),80,90);
  rotate(r);
  float circle_size = random(10 + r/2, 20+r/2);
  ellipse(80 + r, 10, circle_size, circle_size);
  r = r + 0.2;
  if (r > 80) {
    noLoop()
  }
}
