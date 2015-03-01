
int counter;
float px=1;
float py=300;
void setup() {
  size(600,600);
}
  void draw(){
      if(px>width/2) {
     px=width/2;
      }
      if (px==width/2) {
      py=py-10;
      }
         px=px+10;
    ellipse(px,py,10,10);
  }
  
