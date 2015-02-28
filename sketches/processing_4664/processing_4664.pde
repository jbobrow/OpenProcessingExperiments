
int w = 10;
int h = 10;

void setup() {
  size(510,510);
  smooth();
}

void draw() {
  background(255);
    
  for (int x = 0; x < width; x += 10) {
    
    for (int y = 0; y < height; y += 10) { 
      stroke(255);
      int c = int(random(0,255));
      fill(c);
      rect(x,y,w,h);
    }
  }
}

  

