
float x;
float y;

void setup () {
  size(400,400);
  smooth();
  background(255);
  }

void draw() {
  translate (200,200);
  ellipse (random (x), random (200,300), random (40,370), random (40,370));
  fill (120,40,200);
  
  ellipse (random (y), random (100,300), random (40,370), random (40,370));
  fill (180,100,90);
  
  ellipse (random (x), random (y), random (40,370), random (40,370));
  fill (70,80,100);
  
}
  

