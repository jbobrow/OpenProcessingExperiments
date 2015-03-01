
float y = 100;
 
void setup() {
  size(640, 360); 
  stroke(300);     
  noLoop();
  
  y = height * 0.5;
}

void draw() { 
  background(0); 
  stroke(200, 800, 200, 200);  
  line(6, y, width, y ); 
   y = y - 1; 
  if (y < 0) { 
    y = height; 
  } 
} 

void mousePressed() {
  loop();
}

