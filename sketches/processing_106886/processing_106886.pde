
int x=20;
int y=20;

int dx=0;
int dy=1;

void setup() {  //setup function called initially, only once
  size(300, 200);
  
}
void draw() {  //draw function loops
 background(255,0,0);
 ellipse(x,y,20,20);
  
  if (key == 'd'){
      dx = 1;
      dy = 0;
  }
  if (key == 'g'){
      dy = 1;
      dx = 0;
  }
      
  if (key == 'a'){
      dx = -1;
      dy = 0
  }
  
  x=x+dx;
  y=y+dy;
}
