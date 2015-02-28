
float x1, y1, x2, y2;
float i = 0;
float sw = 0.5;
int r, g, b;
void setup() {
  size(505, 755);
  background(100);
  strokeWeight(sw);
  x1 = 5.0;
  y1 = 5.0;
  x2 = 50.0;
  y2 = 50.0;
  r = 0;
  g = 20;
  b = 255;

}

void draw() { 
  int c = 0;
    while (x1 < 500.0) {
      stroke(r, g , b);
      for(int d = 0; d < 45; d += 2) {
        line(x1, y2 - d, x2, y2 - d);
      }   
      g+=2;
      b-=2;
      stroke(r, g , b);
      line(x1, y1, x2, y2);
      strokeWeight(sw);
      x1 += 50;
      x2 += 50;
      i++;
     
    
    }
  
    x1 = 5.0;
    x2 = 50.0;
    y1 += 50.0;
    y2 += 50.0;
    i = 0;
  }

