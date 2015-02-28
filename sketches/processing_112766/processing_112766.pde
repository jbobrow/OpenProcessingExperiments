
float d;
float x= 60;
float y= 40;
boolean b= false;

void setup() {
size(300, 300, P3D); 
smooth();
lights();
}

void draw() {
  background(255); 
  fill(100); 
//  noStroke();
d=100;

pushMatrix();
translate(width/2,height/2);
 if (mousePressed){
  d= mouseX+mouseY;
  rotateY(PI/4);
  rotateX(PI/8);
 } else {
rotateY(mouseY/10);
rotateX(mouseX/10);
 }
box(x, y, d);
popMatrix();
}



