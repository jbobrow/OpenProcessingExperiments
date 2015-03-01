
int counter;
int x=20;
int dx=5;
int y=30;
int dy=20;
void setup() {  //setup function called initially, only once
  size(400, 400);
  }
 
void draw() {  //draw function loops 
 ellipse(x,y,20,20);
 x=x+dx;
 
 if (x>400)
 dx=-9;

 if(x<0)
   dx=19;

y=y+dy;

if(y>400)
dy=-29;
 if(y<0)
dy=9;




}
