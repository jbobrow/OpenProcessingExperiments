
// E7 Loops und Gegensatzpaare
//laut

void setup() {
  size ( 640, 400);
  smooth();
    
}
void draw() {
  background(0);
  noCursor();
  noStroke();
  
 for (int i = 0; i < width; i= i + 10){
  ellipse (random(width), random(height), random(150,80), random(150,80));
 
 fill (255,50);

    }
  }
