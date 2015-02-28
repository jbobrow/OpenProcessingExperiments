
void setup() {
  size(1600,600, P3D);
  fill(204);
}

void draw() {
  lights();
  background(0);
  
  
  camera(30.0, mouseY, 270.0, 
         0.0, 0.0, 0.0, 
         0.0, 1.0, 0.0); 
  
  noStroke();
  textSize(256);
  textAlign(CENTER);
   text("Zoom",0,50);

  stroke(255);
 
}



