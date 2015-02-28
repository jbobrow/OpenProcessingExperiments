
void setup() {
  size(400, 400);
  colorMode(RGB, 100);
  background(0);
}

void draw() { //sets up grid for circles
  for (int x = 10; x <= width; x += 25) {
    for (int y = 10; y <= width; y += 25) {
      circles (x, y);
    }
  }
  noLoop();
}


void circles(float x, float y) {
  pushMatrix();
  stroke(0, random(200), random(200), random(150)); //stroke has random colors of 
  //green and blue in the 200 range and a random transparency
  strokeWeight(random(5)); //the stroke weight has a random component with a
  //value of 5
  translate (0, 0); //starts grid at this point
  fill(random(100), 0, random(150), random(75)); 
  ellipse(x, y, 10, 10); //ellipse will follow loop and have a diameter of 10
  popMatrix();
}


