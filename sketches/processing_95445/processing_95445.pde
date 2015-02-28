
void setup() {  
  size(200, 200);
  background(0);  

  noStroke();
  smooth();
  for (int y = -1; y <= 250; y += 10) {
    for (int x = -1; x <= 250; x += 10) {
      ellipse(x^x/(2+y), y + y^y/(2+x),x/2,x^y);
        fill(x,y,x+y*x,10);
    }
  }
}
