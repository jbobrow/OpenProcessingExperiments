
int x=20;
int y=20;

int dx = 4;
int dy = 7;

void setup() {  //setup function called initially, only once
  size(500,700)
}

void draw() {  //draw function loops 
  background(255,255,255)
  fill(255,0,0);
  ellipse(x,y,30,30);
  rect(x,y,30,30);
  rect(x-30,y,30,30);
  triangle(x,y,30);
  arc(x,y,30);
  
  if (y>700) {dy = -dy}
  if (y<0) {dy=-dy}
  y = y+dy;
  
  if (x>500) {dx=-dx}
  if (x<0) {dx=-dx}
  x=x+dx;
  
  if (mousePressed) {
  x= mouseX;
  y= mouseY;}
  }
