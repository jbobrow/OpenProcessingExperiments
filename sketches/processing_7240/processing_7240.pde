
int w = 10;
int h = 10;

void setup() {
  size(800,800);
  smooth();
}

void draw() {
  background(255);
    
  for (int x = 0; x < width; x += 10) {
    
    for (int y = 0; y < height; y += 10) { 
      stroke(255);
      int r = int(random(255));
      int g = int(random(255));
      int b = int(random(255));
      //int a = int(random(255));
      fill(r,g,b);
      rect(x,y,w,h);
    }
  }
}

  

