
import processing.opengl.*;

//  Title    : 3D Box rotation
//  Synopsis : Go baby go baby go
//  Author   : Michael Hawthorne
//  Date     : 22/08/2011
//  Changlog : N/A

float R_x =0;
float R_y =0;

void setup(){
size(200, 200, OPENGL);
//smooth();

}

void draw(){
  background(0);
  lights();
noStroke();
pushMatrix();
translate(100, height/2, 0);
rotateY(R_y);
rotateX(R_x);
R_y+=0.01;
R_x+=0.01;
stroke(0,0,255);
line(0,0,40,40);
box(50);
popMatrix();



}
                
