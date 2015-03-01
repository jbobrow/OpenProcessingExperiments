


void setup() {
  size(500,500);
  background(147,138,57);
  noLoop();
}

void draw(){
  diamond(0,0);
  diamond(75,0);
  diamond(150,0);
  diamond(225,0);
  diamond(300,0);
  diamond(375,0);
  diamond(450,0);
  diamond(0,75);
  diamond(75,75);
  diamond(150,75);
  diamond(225,75);
  diamond(300,75);
  diamond(375,75);
  diamond(450,75);
  diamond(0,275);
  diamond(75,275);
  diamond(150,275);
  diamond(225,275);
  diamond(300,275);
  diamond(375,275);
  diamond(450,275);
  diamond(0,350);
  diamond(75,350);
  diamond(150,350);
  diamond(225,350);
  diamond(300,350);
  diamond(375,350);
  diamond(450,350);
}

void diamond(int x, int y) {
  noStroke();
  fill(111,196,232,120);
  beginShape();
  vertex(x,y);
  vertex(x+100,y+100);
  vertex(x,y+200);
  vertex(x-50,y+100);
  endShape(CLOSE);
}


