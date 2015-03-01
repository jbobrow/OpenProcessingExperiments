
int counter;
int x = 20;
int dx = 5;
int y = 20; 
int dy = 3;

void setup() {  //setup function called initially, only once
  size(400, 400);
  
}

void draw() {  //draw function loops 
  fill(255,255,0);
  ellipse(x,y,10,10);
 
  x = x + dx;
  y = y + dy
  if (x > 400){
  dx = -5;
  }
  if(x<0){
  dx=5
}
if(y>400){
dy = -10
}
if (y<0){
dy = 3
}
if(mousePressed){
x = mouseX;
y = mouseY;
}
}
