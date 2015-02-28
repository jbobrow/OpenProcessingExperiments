
void setup() {
  size ( 500, 200);
  smooth();
    }
    
    
void draw() {
 background(255);
noCursor();
  for(int i = 5; i < width; i = i + 7) {
    for(int j = 10; j < height; j = j + 20){
 fill (255);
 ellipse(i, j, 3, 3);
    }
  }
}


