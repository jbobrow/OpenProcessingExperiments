
int x=20;
int y=20;

int dx=0;
int dy=0;

void setup() {  //setup function called initially, only once
  background(255,255,0)
  size(300, 200);
 }

void draw() {  //draw function loops 
  ellipse(x,y,20,20);
  
  if (key == 'd') {
     dx = 1; 
     dy = 0;
  }
  if (key == 's') {
      dx == -1;
      dy == 0;
  }
  
  x = x + dx;
  y = y + dy;
}

if (key == 'E') {
     dx = 1; 
     dy = 0;
  }
  if (key == 'C') {
      dx == -1;
      dy == 0;
  }
