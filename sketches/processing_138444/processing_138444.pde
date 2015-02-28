
float y = 100;
void setup() {
  size(360, 360); 
  stroke(255);    
  frameRate(30);
}
 
void draw() {

  y = y - 1;
  if (y < 0) {
    y = height;
  }
 line(0, y, width, y); 
}

