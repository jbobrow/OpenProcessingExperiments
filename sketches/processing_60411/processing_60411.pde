

void setup() {
   size(400,400);
   noStroke();
   smooth();
   background(255);
}

void draw() {
    frameRate(15);
    drawLine(int(random(255)), int(random(255)), int(random(255)), 
    int(random(255)), int(random(50)), int(random(width)), 
    int(random(height)), 400);
  
}

void drawLine(int c1, int c2, int c3, int c4,
              int weight, int x, int y, int size) {
  stroke(c1,c2,c3,c4);
  strokeWeight(weight);
  line(x, y, x+size, y+size);
  line(x+size, y, x, y+size);
  line(y+size, x, y+size, x+size);
}


