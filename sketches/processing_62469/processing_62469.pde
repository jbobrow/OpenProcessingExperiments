
void setup() {
  size ( 500, 200);
  smooth();
    }
    
    
void draw() {
 background(0);
noCursor();
  for(int i = 5; i < width; i = i + 80) {
 fill (255);
 ellipse(i, 100, 80, 40);
    }
  }



