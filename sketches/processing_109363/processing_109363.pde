
void setup() {
  size(1200, 900);
  smooth();
  colorMode(HSB, 360, 100, 100);
  frameRate(1);
}
  
void draw() {
  background(0,0,255);
   noStroke();
   noLoop();
    
  for (int i = 0; i < width; i += 40) {
    for (int j = 0; j < height; j += 40) {
  
      if (  i <35) {
        fill(0);
      }
      else if (j<35) {
        fill(0);
      }
      else {
        fill(random(255), 65, 100);
      }
  
      ellipse(i, j, 35, 35);
      line(i,20,j,20);
    }
  }
}
  
//(int(random(0, 2)) == 0)
