
//HW Week 9
//graham strang
//Makes a cheap 3-D prism shape.
//Works for all shapes, squares don't work very well.
void setup(){
  size (1200, 800);
  smooth();
  
}
void draw(){
  background(255);
  noFill();
  //(position x, position y, number of sides, number of iterations, radius)
  polyhedron(mouseX, mouseY, 6, 100, 150);
  
}



void polyhedron(int x, int y, int sides, int nest, float radius){
  for(int i = 0; i < nest; i ++){
  beginShape();
   for(int j = 0; j <= sides; j++){
    float polyX = cos(radians((360/sides)*j)) * (radius) + (i*4) + x;
    float polyY = sin(radians((360/sides)*j)) * (radius) + (i*4) + y;
    vertex(polyX,polyY);
  }
  endShape(CLOSE);
} 
}

