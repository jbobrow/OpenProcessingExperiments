
int dim = 30;

void setup(){
  
  size (600, 400);
  println ();
  smooth (20);
  background (#1C6743);
  frameRate (30);
  
}

void draw() {
 
 
 if (mousePressed) { 
   
  noStroke ();
  fill (mouseX, mouseY, 0, 100);
  rect (mouseX, mouseY, dim*2, dim*2);
 }

else {
stroke (0, 0, 0, 20);
  fill (random (255), mouseX, mouseY, 100);
  ellipse (mouseX, mouseY, dim, dim);
}  
  
  
}
  
  
