
int n=5;   
int d;      
float D; 
float R;   

void setup() {
  size(200, 200);
  noStroke();
  
  d = width/n;
  
  R = 0.6 * d;

  D = dist(0, 0, width, height);
}


void draw() {

  background(102);

  for (int x = d/2; x < width; x += d) {
    for (int y = d/2; y < height; y += d) {

      int r = (int) (R * (1.0 - dist(x, y, mouseX, mouseY) / D));
      
      circle (x, y, r);
    }
  }
}


void circle(int x, int y, int r) {
  ellipseMode(CENTER);
  ellipse(x, y, r*2, r*2);
}



