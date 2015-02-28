
float d;
float x= 60;
float y= 40;
float angle; 

void setup() {
size(300, 300, P3D); 
smooth();
lights();
}

void draw() {
  background(255); 
  smooth();
  fill(#BAE61F, 100); 
d=100;
angle = PI*mouseX/width; 
pushMatrix();
translate(width/2,height/2);
 if (mousePressed){
  d= mouseX;
  y= mouseY;
  rotateY(PI/4);
  rotateX(PI/8);
 } else {
//   rotate(angle);
rotateY(mouseY/10);
rotateX(mouseX/10);
 }
box(x, y, d);
popMatrix();
}



