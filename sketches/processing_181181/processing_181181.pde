
int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2;

void setup() {
  size(640, 360);

  b1 = color(255);
  b2 = color(0);
  c1 = color(204, 102, 0);
  c2 = color(0, 102, 153);

  noLoop();
}

void draw() {
  setGradient(0, 0, width/2, height, c2, b2, X_AXIS);
  setGradient(width/2, 0, width/2, height, b2, c2, X_AXIS);

}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == X_AXIS) {  
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      
      stroke(c);
      line(i, y, i, y+h);
    }
    
    fill(0,102,153,230);
    ellipse(120,180,150,150);
    fill(0,0,0,230);
    ellipse(320,180,150,150);
    fill(0,102,153,230);
    ellipse(520,180,150,150);
    
    fill(0);
    ellipse(100,180,100,100);
    fill(0, 102, 153);
    ellipse(320,180,100,100);
    fill(0);
    ellipse(540,180,100,100);
    fill(0,0,0,0);
    stroke(0);
    rect(10,10,620,340);
    rect(20,20,600,320);
  }
  print("dibuix lliure");
}

