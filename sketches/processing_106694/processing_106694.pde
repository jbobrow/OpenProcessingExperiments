
int x=20;
int y=20;

int dx=3;
int dy=20;

void setup() {  //setup function called initially, only once
  size(400,400);
  }
  

void draw() {  //draw function loops 
  fill (0,90,0);
  background (255,255,255);
  ellipse (x,y,40,60);
  

 
  
 x=x+dx
 y=y+dy
 
 if (y>300){
 dy=-dy
 
 }
 }
