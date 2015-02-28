
int x=20;
int y=20;

int dx=4;
int dy=2;

void setup() {
  size(250,250);
  
 }
  
  void draw() {
      fill(255,255,0);
      ellipse(x,y,20,20);
      
      fill(255,255,0);
      ellipse(y,x,20,20);
      y=y+dy;
      
      if (y>250){
         dy=-dy;
      }
}
