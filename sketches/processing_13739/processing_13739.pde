
float r = 0;
float i = 0;
float j = 20;
int nX;
int nX;
 
void setup() {
  size(200,200);
  noStroke();
}
 
void draw() {
   background(0);
   for (int y = 0; y<10; y=y+1) {
    for (int x = 0; x<10; x=x+1) {
      fill(100,200,200);
      r = sin(radians(i + x * j/2 + y * j/2)) * 60;
      ellipse(x * 40 + 20, y * 40 + 20, r, r);
      }
    }
  i = i+0.5;
}
     
void mouseMoved(){  
  nX = mouseX;  
  nY = mouseY;    
}   
