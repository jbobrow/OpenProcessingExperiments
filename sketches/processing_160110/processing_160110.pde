
void setup() {
  size(700,700);
  background(0);
 
}

void draw() {
  //background(0);
  float x1 = random(width);
  float y1 = random(height);
  float x2 = random(width);
  float y2 = random(height);
  strokeWeight(y1);
  stroke(random(255),random(255),random(255),50);
  line(x1,height,x2,0);

}
