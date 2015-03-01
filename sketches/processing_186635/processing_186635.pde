
void setup() {
size(300,300);
colorMode(HSB);}
 
void draw(){
  float b=random(202);
  background(b,255,255);
  for (int x = 0;x<50;x++) {
  for (int y = 0;y<50;y++) {
   float a=random(27);
   fill(a,255,255);
   ellipse(x*50,y*50,20,20);
  }
  }  
  }
