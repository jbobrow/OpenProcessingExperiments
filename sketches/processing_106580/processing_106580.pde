
int x = 20;
int y = 20;
int dx = 0;
int dy = 0;
void setup() {  //setup function called initially, only once
  size(250, 250);
}

void draw() {  //draw function loops 
  fill(random(255),random(255),random(255));
  background(255,255,255);
  ellipse(x,y,20,20);
  y = y + dy;
  x = x + dx;
  if (keyPressed) {   
      if (key == 'd' || key == 'D' ) {
          fill (255,255,0);
          dx = 1;
          }
         
      else if (key == 'a' || key == 'A') {
         fill (0,255,255);
         dx = -1;
         }
      else if (key == 's' || key == 'S') {
         fill (255,0,255);
         dy = 1;
         }
      else if (key == 'w' || key == 'W') {
         fill (0,0,0);
         dy = -1;
         }
    }
  else {
  dx=0;
  dy=0;
  }

}
  void mouseClicked() {
  x=mouseX;
  y=mouseY;
  }
