
float x;
 
void setup() {
  size(400, 100);
  smooth();
  frameRate(20); // 1000 / 20 = 50 ms
  x = -15;
}  
 
void draw() {
  background(0);
  x = x + 2;
   
  if ( x > width + 15  ) {
    x = -15;
  }
   
  ellipse(x,height/2,30,30);
}

