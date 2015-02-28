
// E7 Loops und Gegensatzpaare
//leise

void setup() {
  size ( 640, 400);
  smooth();
    
}
void draw() {
  background(0);
  noCursor();
  frameRate(3);
  
 for (int i = 0; i < width; i=i+20){
   ellipse (random(width), random(height), random(width/100), random(height/100));
 
 fill (255);

    }
  }
