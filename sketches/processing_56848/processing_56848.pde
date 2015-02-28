
void setup() {
  size (400, 400);
  background(0);
  smooth();
  strokeWeight(2);
  frameRate(3);
}
 void draw() {

for (int i = 10; i <=600; i += 25) {
  for(int j = 15; j <= 600; j += 25){
    float r = random(0, 255);
    float b = random(0, 255);
    float offsetA = random (0, 400);
    float offsetB = random (0, 400);
    fill(r, 0, b);
  rect(offsetA-j, offsetB-i, 14-j/10.0, 14- j/10.0);
  
  if (mousePressed == true) {
    background(0);
  }
  }
}
 }


