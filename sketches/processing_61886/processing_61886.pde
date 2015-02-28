
int strokes = 10;
int distance = 4;
int x = 20;
int y = 20;
 
int h,s,b;
 
int a = 60;
 
 
void setup() {
  size(100, 100);
  colorMode(HSB,360,100,100,100);
  background(0,0,100);
 
  h = (int) random(180,360);
  s = (int) random(50,100);
  b = (int) random(50,100);
  stroke(h,s,b,a);
  while (x <= width-20) {
    line(x, 20, x, 80);
    x += distance;
  }
   
  h = (int) random(180,360);
  s = (int) random(50,100);
  b = (int) random(50,100);
  stroke(h,s,b,a);
 
  while (y <= height-20) {
    line(20, y, 80, y);
    y += distance;
  }
 
  
  h = (int) random(180,360);
  s = (int) random(50,100);
  b = (int) random(50,100);
  stroke(h,s,b,a);
   
  while (x <= width-20) {
    line(x+10, 20, x, 80);
    x += distance;
  }
   
  h = (int) random(180,360);
  s = (int) random(50,100);
  b = (int) random(50,100);
  stroke(h,s,b,a);
  while (y <= height-20) {
    line(20, y+10, 80, y);
    y += distance;
  }
   
  h = (int) random(180,360);
  s = (int) random(50,100);
  b = (int) random(50,100);
   
  for(int x = 20; x <= width - 20; x *=1.2) {
    line(x,20,x,80);
  }
  h = (int) random(180,360);
  s = (int) random(50,100);
  b = (int) random(50,100);
   
  for(int y = 20; y <= height - 20; y *=1.2) {
    line(20,y,80,y);
  }
  h = (int) random(180,360);
  s = (int) random(50,100);
  b = (int) random(50,100);
   
  for(int y = 20; y <= height - 20; y += distance *2) {
    line(20,y,50,y);
    line(50,y+(distance*2)/2,80,y+(distance*2)/2);
  }
}

