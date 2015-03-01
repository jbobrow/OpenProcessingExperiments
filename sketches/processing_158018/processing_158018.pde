
int counter;
int x = 20;
int dx = 5;
int y = 20;
int dy = 3;

void setup() {  //setup function called initially, only once
  size(400, 400);
}

void draw() {  //draw function loops 
 ellipse(x,y,20,20);
 ellipse(y,x,20,20);
 
 x = x + dx;
 y = y + dy;
 
 if(x > 400) {
    dx = -5;
 }
 
 if(x < 6) {
    dx = 5;
 }
 if(y > 400) {
    dy = -3;
 }
 if(y < 6){
    dy = 3;
}
 
 if (mousePressed){
     x = mouseX;
     y = mouseY;
 }
  
 }
