
Bubble[] bubbles = new Bubble[100];

void setup() {
  size(600, 600);
  for(int i = 0; i < 100; i++){
    bubbles[i] = new Bubble();
  }
}

void draw() {
  background(0);
  drawCircle(mouseX, mouseY);
  smooth();
  for(int i = 0; i < 100; i++){
    bubbles[i].move();
    if(dist(mouseX,mouseY,bubbles[i].x, bubbles[i].y) < 150){
      bubbles[i].display();
    }
  }
    
}

void drawCircle(float x, float y) {
  smooth();
  fill(3,0,247);
  strokeWeight(10);
  stroke(255);
  ellipse(x, y, 300, 300);
 
}


