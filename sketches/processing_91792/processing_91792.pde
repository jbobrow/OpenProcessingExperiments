
float col;

void setup() {
  size(1000,500);
  background(255);
  smooth();
}

void draw() {
  if(mousePressed) {
    drawPoint(mouseX, mouseY);
  }
}

void drawPoint(int x, int y) {
  col = random(0,255);
  stroke(100,col,100);
  strokeWeight(random(1,10));
  point(x,y);
  drawPoints(x,y);
  
  drawLines(x,y);
}

void drawPoints(int x, int y) {
  for(int i=0; i<5; i++) {
    stroke(100,col,100);
    strokeWeight(random(1,5));
    fill(100,col,100,191);
    ellipse(x+random(-30,30),y+random(-30,30), random(1,20), random(1,20));
  }
}

void drawLines(int x, int y) {
  strokeWeight(random(1,3));
  float x2 = x + random(-50,50);
  float y2 = y + random(-50,50);
  stroke(100,col,100,127);
  line(x,y,x2,y);
  line(x,y,x,y2);
}



