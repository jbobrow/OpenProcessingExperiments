
//copyright Victoria Adams 1.24.11
//homework 3


float w, x, y, z, a;
 
void setup() {
 size(200,200);
 
}
 
 
void draw() {
  
  w = random (200);
  x = random (200);
  y = random (200);
  z = random (200);
  a = random (255);
   
background(58, 221, 229);
frameRate (10);

if (mousePressed == true) {
    fill(35, 179, 206, 0);
  } else {
    fill(35, 179, 206, a);
  }
 
noStroke ();
ellipse (x, y, 60, 60);

noStroke ();
ellipse (w, z, 60, 60);

}
       
