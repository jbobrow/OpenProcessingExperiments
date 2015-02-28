
void setup() {
  size(500, 500);
  frameRate(15);
  smooth();
  
}
 
void draw() {
  background(0);
  for (int i=0;  i<width;  i+=4){
      stroke(255);
      float r = random (i);
      int rand = int (r);
      float g = random (10+i/50);
      int grosor = int (g);
      strokeWeight(grosor);
      line (rand, i, i, rand);
    } 
     
}


