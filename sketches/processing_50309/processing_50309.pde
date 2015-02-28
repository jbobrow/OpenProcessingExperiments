
float sizeChange = 0;
float inc = 1;
float alphaChange;
float alphaVar = 20;

void setup() {
  size(640, 480);
}
//When mouse is dragged to the right, colors more solid, opposite to the left
void mouseDragged() {
  alphaChange = mouseX - pmouseX;
  alphaVar += alphaChange;
}

void draw() {
  background(0);
  int yCent = height/2;
  noStroke();
  rectMode(CENTER);
//  Draw rectangles
  for(int i = 1; i <= 5; i++) {
    fill(255, 255, 255, alphaVar * i);
    rect((width/6) * i, yCent, (10 * i) + sizeChange, height);
//  Rects grow and shrink on a cosine curve
//  Mouse click stops growth
    if (!mousePressed) {
    sizeChange = 30 * abs(cos(radians(inc)));
    inc += .15;
    }
  }
}


