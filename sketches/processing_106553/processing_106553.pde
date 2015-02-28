
int counter;
int x = 20;
int y = 20;

int dx = 100;
int dy = 100;
void setup() {  //setup function called initially, only once
  size(250, 250);
}

void draw() {  //draw function loops 
  
  
  background(255,255,255);
  
  fill(200,200,0);
  ellipse (x,y,20,20);
  
  if (y<0 || y>250){
 dy = -dy;
 }
   if (x<0 || x>250) {
   dx = -dx;
   }
   x = x + dx;
        y = y + dy;
        
        if (mousePressed) {
        
        x=mouseX;
        y=mouseY;
  }
 }
