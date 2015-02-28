
int dim = 30;

void setup(){
  
  size (600, 400);
  println ();
  smooth (20);
  background (0);
  frameRate (5);
  rectMode (CENTER);
  
}

void draw() {
 
  background (0); 
  if (mousePressed) {
  
  strokeWeight (1); 
  stroke (255); 
  fill (random (255), random (255), random (255));
  rect (200, 200, 50, 50);
  
  strokeWeight (1) ;
  stroke (255);
  fill (random (255), random (255), random (255));
  rect (200, 250, 50, 50);
  
  strokeWeight (1); 
  stroke (255);
  fill (random (255), random (255), random (255));
  rect (200, 300, 50, 50);
  
  strokeWeight (1) ;
  stroke (255);
  fill (random (255), random (255), random (255));
  ellipse (200, 100, 150, 150);
  
  strokeWeight (1);
  stroke (0); 
  fill (0);
  ellipse (230, 100, 20, 60);
  
  
  ellipse (170, 100, 20, 60);
  
  stroke (255);
  line (175, 175, 100, 300);
  strokeWeight (8);
  point (100, 300);
  
  strokeWeight (1);
  line (225, 175, 300, 300);
  
  strokeWeight (8);
  point (300, 300);
  
  strokeWeight (1);
  line (175, 325, 100, 350);
  
  strokeWeight (8);
  point (100, 350);
  
  strokeWeight (1);
  line (225, 325, 300, 350);
  
  strokeWeight (8);
  point (300, 350);
  }
  
  
}
