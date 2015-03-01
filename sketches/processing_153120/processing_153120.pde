
void setup() {
  size(400, 200); // size(1200, 800);
  background(255);
  // ellipseMode(CENTER);
  // rectMode(CENTER);

for (int y = 0; y < height; y+=50) {
renderRows(y);
}


}
  
  void renderRows(y) {
    float r = random(0, 1);
  for (int x = 0; x < width; x += 50) {
  
if (r<=0.5) {
    house(x, y);
    }
    
    else if(r>0.5) {
    circle(x, y);
    }
    
    
    
  }
  

  }


void draw() {
}


void house(int x, int y)
{
  pushMatrix();
  translate(x, y);
  triangle(15, 0, 0, 15, 30, 15);
  rect(0, 15, 30, 30);
  rect(12, 30, 10, 15);
  popMatrix();
}

void circle(int x, int y)
{
  pushMatrix();
  translate(x, y);
  ellipse(0, 15, 30, 30);
  popMatrix();
}
