
void setup() {
  size(500, 500);
  background(0);
  smooth();
  strokeWeight(0.5);
  stroke(255);
  noFill();
  frameRate(50);

}

void draw() {
  for(int b = 0; b<1000; b = b+80){
  float a = random(500);
  ellipse(a,a+b,b%a,a);
  rect(b,a-b,b%a,a);}
}          
