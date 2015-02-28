
int dim = 30;

void setup(){
  
  size (600, 400);
  println ();
  smooth (20);
  background (#1C6743);
  frameRate (5);
  
}

void draw() {
 
  background (#1C6743); 
  noStroke ();
  fill (random (255), random (255), random (255));
  rect (random (600), random (400), random (100), random (100));

  
  
}
  
  
