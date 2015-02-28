
void setup() {
  size(900,350);
  smooth();
  //noLoop();
  
  colorMode(HSB);
}


void draw() {
  background(240);  
  for (int i = 0; i < 1000; i++) {
    // H,S,B,strokeWeight,xPos,yPos,size
    drawX(int(random(100,300)), int(random(255)), int(random(255)), int(random(50)), int(random(width)), int(random(height)), 20);
      }
}

void drawX(int r, int g, int b, int weight, int x, int y, int size) {
  stroke(r,g,b);
  strokeWeight(weight);
  line(x,y,x+size, y+size);
  line(x+size, y, x, y+size);
}


