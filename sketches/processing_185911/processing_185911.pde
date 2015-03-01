


void setup() {  //setup function called initially, only once
  size(400,400);
  background(color(255,255,255));
  color red = color(255,0,0);
  int y = 0;
  
  while (y < 100) {
     set(100, y, red);
     int startX = 100 - y;
     int stopX = 100 + y 
     int x = startX;
     
     while (x < stopX) {
        set(100, 100, red);
        x = x + 1;
     }
     y = y + 1;
  }
     
}
