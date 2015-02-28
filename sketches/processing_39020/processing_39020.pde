
void setup() {
  size (400, 400);
  background(16, 180, 195);
  }

  void draw() {  // Draws the grid of Smiles
    for (int y= 20; y<height; y+=65) {   
      for (int x= 15; x<height; x+=65) {   
        smile(x, y); //use fuction that sets up function below
      }
    }
    noLoop();
  }
void smile (float x, float y) { //Sets up the function "smile"
  pushMatrix();
  translate (x, y);
  noStroke();
  fill(255,255,0);
  ellipseMode(CENTER);
  ellipse(20, 20, 50, 50);
  fill(0);
  ellipse(10, 10, 5, 5);
  ellipse(30, 10, 5, 5);
  arc(20, 25, 35, 20, 0, PI);
  popMatrix();
}


