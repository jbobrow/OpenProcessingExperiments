
float y = 100;
  
void setup() {
  size(666, 666);
  stroke(300);    
  noLoop();
   
  y = height * 0.5;
}
 
void draw() {
  background(214,11,122);
  stroke(200, 800, 200, 200); 
  line(6, y, width, y );
   y = y - 3;
  if (y < 0) {
    y = height;
  }
}
 
void mousePressed() {
  loop();
}

