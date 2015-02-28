
int x=250;
int y=23;

int dx=5;
int dy=2;

void setup() {  //setup function called initially, only once
  size(250, 250);
  }

void draw() {  //draw function loops 
  background(124,68,40);
  
  fill(2,200,20);
  ellipse(x,y,20,20);

 
  if (y>250){
  dy=-dy;
  }
  y=y+dy
  
  if (y<0){
  dy=-dy;
  }
 
  if (mousePressed) {
  x=mouseX;
  y=mouseY;
  }
  if (x>250){
  dx=-dx;
  }
  x=x+dx
  
  if (x<0){
  dx=-dx;
  }
}
