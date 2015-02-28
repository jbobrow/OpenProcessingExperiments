
void setup() {
  size(800,800);
  background(255);
  smooth();
}

void draw() {
  fill(1,1);
  noStroke();
  for(int i = 0; i < width; i += 50) {
    for(int j = 0; j < height; j += 50) {
      ellipse(random(0,i),random(0,j),50,50);
    }
  }
  for(int i = 0; i < width; i += 30) {
    for(int j = 0; j < height; j += 30) {
      ellipse(random(0,i),random(0,j),30,30);
    }
  }
  fill(255,10);
  for(int i = 0; i < width; i += 30) {
    for(int j = 0; j < height; j += 30) {
      ellipse(random(0,i),random(0,j),30,30);
    }
  }
  //filter(BLUR,.1);
  
  fill(255,15);
  ellipse(mouseX,mouseY,400,400);
}

