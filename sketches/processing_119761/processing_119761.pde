
float x1,x2,y1,y2,Dx,Dy;
void setup(){
  size(400,400,P3D);
 x1=20;
 y1=20;
}
void draw(){
  background(0);
  noStroke();
  fill(0,0,255);
  lights();
  translate(x1, y1, 0);
  sphere(20);
  x1=x1+Dx;
  y1=y1+Dy;
}
void mousePressed(){
x2=mouseX;
y2=mouseY;
Dx=(x2-x1)/50;
Dy=(y2-y1)/50;
}
