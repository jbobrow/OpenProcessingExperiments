
void setup() {
  size ( 500, 500);
  smooth();
  
    
}
void draw() {
 background(0);
noCursor();
  for(int i = 0; i < width; i = i + 5) {
    for(int j = 0; j < height; j = j + 5){

 fill (255);
 stroke(50);
      rect(i, j, 50, 50);
    }
  }
}
