
int counter;
int x = 20;
int y = 20;

int dx = 2;
int dy = 3;
void setup() {  //setup function called initially, only once
  size(250, 250);
}

void draw() {  //draw function loops 


  background(255,255,255);
  
  fill(0,255,0);
  ellipse(x,y,20,20);
  
  if (y>250){
     dy =-dy;
     }  
  if (y<0){
     dy = -dy;
     }  
  if (x>250){
     dx = -dx;
     }  
  if (x<0){
     dx = -dx;     
     }
      y = y + dy;
      x = x + dx;
 }
