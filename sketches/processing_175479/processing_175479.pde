
PVector velocity;
PVector location;

void setup() {
  size(700, 500);
  noStroke();
  location = new PVector(mouseX, mouseY);
  frameRate(30);
  background(#434343);

}

void draw() {
  background(#434343);
  velocity = new PVector(mouseX - pmouseX, mouseY - pmouseY);
  location.add(velocity);
  
  pushMatrix();
  translate(location.x, location.y);
  if (mouseX == pmouseX && mouseY == pmouseY) {
    rotate(0.0);
  }
  else {
    rotate(-velocity.heading2D());
  }
  int f = (int)random(frameCount);
  int r1 = (int)random(500);
  int r2 = (int)random(500);
  int r3 = (int)random(500);

  for (int i = 0; i < f; i++) {
    Hexagon h1 = new Hexagon(r1, r1, 1);
    h1.display();
    Hexagon h2 = new Hexagon(r2, r2, 1);
    h2.display();
    Hexagon h3 = new Hexagon(r3, r3, 1);
    h3.display();
  }
  popMatrix();
  
}
class Hexagon {
  color cHexagon;
  float xPt; 
  float yPt;
  float rt;
  float trans;

  color [] cArray = {
    color(#620ce8), // purply cobalt
    color(#0dbeff), // bright sky 
    color(#22ff3c), // lime
    color(#ff771f), // orangey red
    color(#ff2a3f), // rose
    color(#1b28e8), // mild cobalt
    color(#1dff76), // bluey green
    color(#ffe237), // butter yellow
    color(#38e8d9), // bright aqua
    color(#f359ff), // wisteria
    color(#26e82d), // bright leaf green
    color(#cae803), // yellow green
    color(#ff9726), // bright orange
    color(#176fe8), // cornflower
    color(#f7ef1d), // bright yellow
    color(#e81922), // coraly red
    color(#ff227b) // bright pink
  };
  
  Hexagon(float xPoint, float yPoint, int level) {
    xPt = xPoint;
    yPt = yPoint;
    rt = random(6.2831);
    
    int rnum  = (int)random(cArray.length);
    cHexagon = cArray[rnum];
  }
  
  void display() {
    fill(cHexagon);
    rotate(rt);
    float angle = TWO_PI / 5;
    beginShape();
      for (float a = 0; a < TWO_PI; a += angle) {
        float sx = xPt+cos(a) * 10;
        float sy = yPt+sin(a) * 10;
        vertex(sx, sy);
      }
    endShape(CLOSE);
  }  
  
}


