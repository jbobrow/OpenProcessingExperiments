
void setup() {
  size(400, 400);
  background(255);
  noFill();
}

void draw() {
  for (int x=50; x<width; x += 100) {
    for (int y=50; y<height; y += 100) {
      circles(x, y); //uses function below
    }
  }
  noLoop();
}

void circles(float x, float y) { //creates what the function is going to do above
  pushMatrix(); 
  translate(x, y); //changes center of ellipses to follow above grid
  for (int w=25; w<150; w+=25) {
    for (int h=25; h<150; h+=25) {
      ellipse(0, 0, w, h);
    }
  }
  popMatrix();
}


