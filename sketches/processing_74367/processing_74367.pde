

float rot_x = 0.0;
float rot_z = 0.0;
 
void setup() {
size(600,600,P3D);
smooth();
stroke(0);
}
 
void draw() {
background(255);
 

translate (width/2,height/2);
rotateX(rot_x);
rotateZ(rot_z);
fill(0,150,50,75);
box(200,200,200);
 
/*
translate (width/2,height/2);
rotateX(rot_x);
rotateZ(rot_z);
fill(0,0,255,75);
sphere(200);
*/
 
}
 
void mouseDragged() {
float reduire = 0.01;
rot_x += (pmouseY-mouseY) * reduire; 
rot_z += (mouseX-pmouseX) * reduire;
}


