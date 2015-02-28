
int x=20;
int y=20;

int dx=1;
int dy=1;

void setup() { //setup function called initially, only once
  background(200,150,202);
  size(300, 400);
 }

void draw() {  //draw function loops 
   ellipse(x,y,0,10);
   rect(100,100,50,200);
   
   if (key == 'd' && keyPressed) {
   dx = 1;
   }
   
   if (key == 'a' && keyPressed){
   dx = -1;
   }
   
   if (key == 's' && keyPressed){
   dy = 1;
   }
   
   if (key == 'w' && keyPressed){
   dy = -1;
  }
  
  x=x+dx;
  y=y+dy;
  
  if (x>100 && x<120  && y>100 && y<300) {
    dx=0;
    dy=0;
    }
  
  }
  
  
  
