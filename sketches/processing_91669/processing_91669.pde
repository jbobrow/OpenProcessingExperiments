
float boxSize = 200;
float boxSpace = random(1,300);
float depth = 500;
  
int number = 10;
  
color boxFill;
  
void setup() {
  size (600,400, P3D);
  noStroke();
}
  
void draw() {
  background(255);
    
  float halfSpace = boxSpace * number /2;
    
  translate(width/2, height/2, -halfSpace +  halfSpace * sin(frameCount/100.0));
  rotateY(frameCount * 0.005);
  rotateX(frameCount * 0.005);
    
  for (int x = 0; x < number; x++) {
    for (float y = 0; y < number; y++) {
      for (float z = 0; z < number; z++) {
          
        boxFill = color( 255 * x/number, 255 * y/number, 255 * z/number, 100);
        fill (boxFill);
          
        pushMatrix();
        translate(boxSpace*x -halfSpace, boxSpace * y - halfSpace, boxSpace * z-halfSpace);
        box(boxSize, boxSize, boxSize);
        popMatrix();
      }
    }
  }
}
