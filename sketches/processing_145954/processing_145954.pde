
//Konkuk University
//Department of Dynamic Media
//SOS iDesign
//Name: YUN SoJung
//ID: 201420093

float theta = 0.0;

void setup() {
size(600, 600, P3D);
}

void draw() {
background(144);
theta += 0.01;

translate(width/2, height/2, 0);
rotateX(theta);
rotateY(theta);
drawPyramid(50);

translate(width/3, 0, 20);

drawPyramid(10);
}

void drawPyramid(int t) {
noStroke();

fill(150, 0, 127);
beginShape(TRIANGLES);
vertex(-t, -t, -t);
vertex(t, -t, -t);
vertex(0, 0, t);

fill(0, 150, 0, 127);
vertex(t, -t, -t);
vertex(t, t, -t);
vertex(0, 0, t);

fill(0, 0, 150, 127);
vertex(t, t, -t);
vertex(-t, t, -t);
vertex(0, 0, t);

fill(150, 0, 150, 127);
vertex(-t, t, -t);
vertex(-t, -t, -t);
vertex(0, 0, t);
endShape();
}
