
int x = 20;
int y = 20;
int dx = 0;
int d2x = 0;
int dy = 0;
int d2y = 0;
void setup() {  //setup function called initially, only once
  size(800, 600);
}

void draw() {  //draw function loops 
  fill(random(255),random(255),random(255));
  background(255,255,255);
for (int i = 0; i < 20; i = i+1) {

  ellipse(x+i*dx, y+i*dy, 20-i, 20-i);

}
  ellipse(x,y,20,20);
  y = y + dy;
  x = x + dx;
  dx = dx + d2x*0.1;
  dy = dy + d2y*0.1;
  if (x<0) {
      dx = -dx;
      }
  else if (x>800) {
      dx = -dx;
      }
  if (y<0) {
      dy = -dy;
      }
  else if (y>600) {
      dy = -dy;
      }
  if (keyPressed) {   
      if (key == 'd' || key == 'D' ) {
          fill (255,255,0);
          d2x = 1;
          }
      else if (key == 'a' || key == 'A') {
         fill (0,255,255);
         d2x = -1;
         }
      else if (key == 's' || key == 'S') {
         fill (255,0,255);
         d2y = 1;
         }
      else if (key == 'w' || key == 'W') {
         fill (0,0,0);
         d2y = -1;
         }
    }
  else {
  d2y=0;
  d2x=0;
  if (dx>0) {
  dx=dx-0.1;
  }
  else if (dx<0) {
  dx=dx+0.1;
  }
  if (dy>0) {
  dy=dy-0.1;
  }
  if (d2y<0) {
  dy=dy+0.1;
  }
}

}
  void mouseClicked() {
  x=mouseX;
  y=mouseY;
  }
