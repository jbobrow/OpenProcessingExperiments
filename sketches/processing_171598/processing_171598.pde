
void setup(){
size(200, 200, P3D);
}//setup

void draw(){
background(255);
translate(100,100,0);
drawPyramid(150);
}//draw

void drawPyramid(int t){
stroke(0);

beginShape(TRIANGLES);
fill(255,0, 39);
vertex(-t,-t,-t);
vertex(t, -t, -t);
vertex(0,0,t);

fill(149, 34, 100);
vertex(t,-t,-t);
vertex(t, t, -t);
vertex(0,0,t);

fill(10, 69, 45);
vertex(t,-t,-t);
vertex(t, t, -t);
vertex(0,0,t);

fill(200, 169, 145);
vertex(t-,t,-t);
vertex(-t, -t, -t);
vertex(0,0,t);
endShape();
}
