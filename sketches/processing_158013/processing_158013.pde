
int counter;
int x = 20;
int dx = 5;
int y = 20;
int dy = 5;

void setup() {  //setup function called initially, only once
  size(400,400);
  }

void draw() {  //draw function loops 
  fill(255,255,0)
  ellipse(y,x,20,20);
  fill(255,0,0)
  ellipse(x,y,20,20);
  x=x+dx;
  y=y+dy
  
  if(x>400){
     dx=-5;}
  if(x<0){
     dx=5;}
  if(y>400){
     dy=-3;}
  if(y<0){
     dy=3;}
  if (mousePressed){
      x = mouseX;
      y = mouseY;}
  }
