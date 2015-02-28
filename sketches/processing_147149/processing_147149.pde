
void setup() {
  size(800, 800);
  background(255);
  fill(50, 50, 150,50);
  smooth();
  
  //strokeWeight(5);
  frameRate(10);
 
}

void draw() {
  for (int i = 30; i < width ; i=i+50) {    // (i++ = i=i+1)
    for (int j = 50; j < height; j=j+100 ) {

      ellipse(i, j, random(30, 70), 100);
    }
  }
}

