
import processing.opengl.*;
float a=0;
int x1, x2, x3, x4, x5;
int y1, y2, y3, y4, y5;
int z1, z2, z3, z4, z5;
PFont font;

void setup()
{
  size(400,600,OPENGL);  
  frameRate(10);
  sphereDetail(20);
  noFill();
  x1 = -150;  y1 = 119;  z1 =  38;
x2 = 150;  y2 = 119;  z2 =  38;
x3 = 150;  y3 =119 ;  z3 = -38;
x4 = -150;  y4 = 119;  z4 = -38;
x5 = 0        ;  y5 = -126;  z5 =   0;

font = loadFont("Haettenschweiler-48.vlw");

}
void draw()
{    
  background(0);
  fill(255,28,28);
  textFont(font);
  text("Bauhaus Christmas", width/2-135,70);
  pushMatrix();
  translate(width/2,height/4,0);
  rotateY(a);
  stroke(0);
  fill(255,255,0);
  sphere(25);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  fill(255,0,0);
  rotateY(a);
  beginShape(TRIANGLES); // front face
vertex(x1, y1, z1);
vertex(x2, y2, z2);
vertex(x5, y5, z5);
endShape(CLOSE);

beginShape(TRIANGLES); // right face
vertex(x2, y2, z2);
vertex(x3, y3, z3);
vertex(x5, y5, z5);
endShape(CLOSE);

beginShape(TRIANGLES); // back face
vertex(x3, y3, z3);
vertex(x4, y4, z4);
vertex(x5, y5, z5);
endShape(CLOSE);

beginShape(TRIANGLES); // left face
vertex(x4, y4, z4);
vertex(x1, y1, z1);
vertex(x5, y5, z5);
endShape(CLOSE);

beginShape(QUADS); // base
vertex(x1, y1, z1);
vertex(x2, y2, z2);
vertex(x3, y3, z3);
vertex(x4, y4, z4);
endShape(CLOSE);
  popMatrix();
  
  
  pushMatrix();
  translate(width/2,454);
  rotateY(a);
  stroke(0);
  fill(0,0,255);
  box(75);
  popMatrix();
  
  pushMatrix();
  translate(width/2,500);
  rotateY(a);
  stroke(0);
  fill(0,64,0);
  box(200,10,200);
  popMatrix();
  
  a+=2*PI/(10*frameRate);
}


