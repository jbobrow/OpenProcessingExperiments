
//-----------GLOBAL VARIABLES
int shapecolour = 255;
int shapetransparency = 80;
int maxDistance = 150;
int a = 220;



//-----------SETUP
void setup() {
  size(600, 600, P3D);
}

//------------DRAW LOOP
void draw() {
  background (0);
  noFill();
  //smooth();
  stroke(a);
  strokeWeight(1);
  for (int gridY = 0; gridY < width; gridY = gridY + 25) {
    for (int gridX = 0; gridX < height; gridX = gridX + 25) {
      float d;
      PVector mousePos = new PVector(mouseX, mouseY, 0);
      PVector shapePos = new PVector(gridX, gridY, 0);
      d=PVector.dist(mousePos, shapePos)/maxDistance*40;
      pushMatrix ();
      translate(gridX, gridY, d*5);
      fill(245, 145, 45, 40);
      if (d<30) {
        float r = random(0, 200);
        fill(r, r, 50);
      } 
      if (mousePressed == true){
        d = 10;
      }
      stroke(a);
      rect(0, 0, d, d);
      noStroke();
      fill(200, 90, 80, 120);
      rect(0+6, 0+6, 20, 20);
      popMatrix();
    }
  }
}



