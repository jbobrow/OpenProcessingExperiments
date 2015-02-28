
int x=20;
int y=20;

int dx = 2;
int dy = 1;

void setup() {  
  size(300,300);
}

void draw() {  //draw function loops 

   
   background(0,0,0);
   
   fill(255,255,0);
   ellipse(x,y,20,20);
  
  x = x+dx;
  y = y+dy;
  
  if (y>300) {
      dy = -dy;
  }
  
  if (y<0) {
      dy = -dy;
  }
  
  if (x>300) {
      dx = -dx;
  }
  if (x<0) {
      dx = -dx;
  }
  
  if (mousePressed){
      x = mouseX;
      y = mouseY;
  }

}
