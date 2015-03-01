
float A = 50;
float B = 5;


void setup () {
size (600,600);
 
}

void draw () {
background (15);

smooth();
noStroke();
translate(-200, -20);
scale(8.0); 
fill(255, 0, 0);
beginShape();
vertex(50, 15);
if (mousePressed) {
bezierVertex(A, -5, 75, B, 50, 45);
vertex(50, 15);
bezierVertex(A, -5, 25, B, 50, 45);
endShape(); }
else {
fill(#38D6CD);
ellipseMode(CENTER);
 ellipse(mouseX,mouseY,20,20);

}
}
