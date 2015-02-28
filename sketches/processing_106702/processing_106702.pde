
int x=20;
int y=20;

int dx=20;
int dy=10;

void setup() {  //setup function called initially, only once
  size(500, 600);
  
}

void draw() {  //draw function loops 
background(255,255,255)
  fill (30,40,50);
  ellipse(x,y,20,20);
  x=x+dx;
  y=y+dy;
  if (y>600) {
  
  dy=-dy;
  }
  if (y<0){
  dy=-dy;
  }
  if (x<0) {
  dx=-dx;
  }
  if (x>300) {
  dx=-dx;
  }
  if (mousePressed){
  x=mouseX;
  y=mouseY; 
  }
}
