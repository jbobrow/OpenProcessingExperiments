
void setup() {
  size(200,200);
}
void draw() {
  
  for (int i = 0; i< 5; i++) {
    for (int j = 0; j<5; j++) {
      ellipseStack(40 + i * 30, 40 + j*30, 40);
    }
  }
  
  drawRects(40, 50, 20, 20);

  target();
}

void drawRects(int rect_x, int rect_y, float rect_w, float rect_h) {
  rect(rect_x + 30, rect_y, rect_w, rect_h);
  rect(rect_x, rect_y + 10, rect_w, rect_h);
  rect(rect_x, rect_y, rect_w/3, rect_h);
}

void target() {
  for (int i = 60; i>0; i-=10) {
    ellipse(width/2, height/2, i, i);
  }
}

void ellipseStack(int x_pos, int y_pos, int circ_w) {
  ellipse(x_pos, y_pos, circ_w, 40);
  circ_w -= 5;
  ellipse(x_pos, y_pos, circ_w, 40);
  circ_w -= 8;
  ellipse(x_pos, y_pos, circ_w, 40);
  circ_w -= 10;
  ellipse(x_pos, y_pos, circ_w, 40);
  circ_w -= 13;
  ellipse(x_pos, y_pos, circ_w, 40);
}
