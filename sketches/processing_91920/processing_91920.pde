
//practice movement in the Z direction

//PImage txt = loadImage("lava.jpg"); 
float x, y, z = 0;
float angX = 0;
float angY = 0;

void setup () {
  size (800, 500, P3D); 
} 

void draw () {
  background(0);
  lights();
  smooth();
  rectMode(CENTER);
  
  //red box
  pushMatrix();
  fill(255, 0, 0);
  translate(width/2, height/2, z); // translates shape to center
  rotateY(radians(angY));  
  rotateX(radians(angX));
  box(100);
  popMatrix();
  
  //green box
  pushMatrix();
  fill(0, 255, 0);
  translate(width/2 - 120, height/2, z); // translates shape to center
  rotateY(radians(angY));  
  rotateX(radians(angX));
  box(100);
  popMatrix();
  
  //blue box
  pushMatrix();
  fill(0, 0, 255);
  translate(width/2 + 120, height/2, z); // translates shape to center
  rotateY(radians(angY));  
  rotateX(radians(angX));
  box(100);
  popMatrix();
  
  println(angX); // show angle of movement X
  println(angY); // show angle of movement Y
  
  if (movement()) {
    angX++;
    angY++ ;  
  }else { 
    angX--; 
    angY--; 
  }
} 

//check for upward / downward movements
boolean movement(){
  if (mouseX >= width/2 || mouseY >= height/2) {
   return true; 
  } else {
   return false; 
  }
}


