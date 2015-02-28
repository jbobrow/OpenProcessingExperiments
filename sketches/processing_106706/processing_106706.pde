
int x=20;
int y=20;

int dx=2;
int dy=1;

void setup() {  //setup function called initially, only once
 size(300,300); 
}

void draw() {  //draw function loops 
  ellipse(x,y,20,20);
  ellipse(y,x,20,20);
  
  x= dx + x;
  y= dy + y;
  
  if (y > 300) {
  dy= -dy;
 }
 if (x > 300) {
 dx=-dx;
 }
 if(x < 0){
 dx= -dx;
 }
 if (y < 0){
 dy= -dy;
 }
 }
