
void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  strokeWeight(2);
  for (int y = -10; y <= height; y +=10) {
    stroke(100, y/2, y);
    for (int x =0; x <=width; x+= 20) { 
      
        fill(random(255), x/2, x);
        triangle(x, y, x+20, y+20, x-20, y+20);
     
    }
  }
}

